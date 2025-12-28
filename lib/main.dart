import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'providers/app_state_provider.dart';
import 'screens/home_screen.dart';
import 'screens/command_listing_screen.dart';
import 'screens/saved_commands_screen.dart';
import 'widgets/bottom_navigation.dart';
import 'widgets/command_detail_sheet.dart';
import 'theme/app_theme.dart';
import 'l10n/app_localizations.dart';
import 'models/command.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize app state provider
  final appState = AppStateProvider();
  await appState.loadPreferences();

  runApp(ChangeNotifierProvider(create: (_) => appState, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppStateProvider>();

    // Set system UI overlay style
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: appState.isDarkMode
            ? Brightness.light
            : Brightness.dark,
        systemNavigationBarColor: appState.isDarkMode
            ? Colors.black
            : Colors.white,
        systemNavigationBarIconBrightness: appState.isDarkMode
            ? Brightness.light
            : Brightness.dark,
      ),
    );

    return MaterialApp(
      title: 'Command Finder',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      locale: Locale(appState.languageCode),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLanguages
          .map((lang) => Locale(lang.code))
          .toList(),
      home: const _CommandDetailObserver(child: MainScreen()),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppStateProvider>();
    final t = AppLocalizations(appState.languageCode);

    return Scaffold(
      body: Stack(
        children: [
          // Main Content
          IndexedStack(
            index: appState.currentScreen == AppScreen.home
                ? 0
                : appState.currentScreen == AppScreen.listing
                ? 1
                : 2,
            children: const [
              HomeScreen(),
              CommandListingScreen(),
              SavedCommandsScreen(),
            ],
          ),

          // Bottom Navigation
          if (appState.currentScreen != AppScreen.listing)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: BottomNavigation(
                currentScreen: appState.currentScreen,
                onNavigate: (screen) => appState.navigateToScreen(screen),
                homeLabel: t.translate('home'),
                savedLabel: t.translate('saved'),
                isRTL: AppLocalizations.supportedLanguages
                    .firstWhere((l) => l.code == appState.languageCode)
                    .isRTL,
              ),
            ),
        ],
      ),
    );
  }
}

// Observer to show command detail sheet when command is selected
class _CommandDetailObserver extends StatefulWidget {
  final Widget child;

  const _CommandDetailObserver({required this.child});

  @override
  State<_CommandDetailObserver> createState() => _CommandDetailObserverState();
}

class _CommandDetailObserverState extends State<_CommandDetailObserver> {
  Command? _visibleCommand;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final appState = context.watch<AppStateProvider>();
    final selectedCommand = appState.selectedCommand;

    // Show command detail sheet when command is selected, but only if it's not already visible
    if (selectedCommand != null && selectedCommand != _visibleCommand) {
      _visibleCommand = selectedCommand;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => CommandDetailSheet(command: selectedCommand),
        ).then((_) {
          // Clear visible command when sheet is dismissed
          _visibleCommand = null;
          if (mounted &&
              context.read<AppStateProvider>().selectedCommand != null) {
            context.read<AppStateProvider>().selectCommand(null);
          }
        });
      });
    } else if (selectedCommand == null) {
      _visibleCommand = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
