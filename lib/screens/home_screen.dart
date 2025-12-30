import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../providers/app_state_provider.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_colors.dart';
import '../widgets/program_card.dart';
import 'collections_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppStateProvider>();
    final t = AppLocalizations(appState.languageCode);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isRTL = AppLocalizations.supportedLanguages
        .firstWhere((l) => l.code == appState.languageCode)
        .isRTL;

    final favoritePrograms = appState.favoritePrograms;
    final allPrograms = appState.allPrograms;

    return Directionality(
      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Gradient
            Container(
              decoration: BoxDecoration(
                gradient: isDark
                    ? AppGradients.headerDark
                    : AppGradients.headerLight,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              padding: const EdgeInsets.fromLTRB(24, 60, 24, 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: isRTL
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                              t.translate('title'),
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w900,
                                color: isDark
                                    ? Colors.white
                                    : AppColors.lightTextPrimary,
                                letterSpacing: -0.5,
                              ),
                            )
                            .animate()
                            .fadeIn(duration: 400.ms)
                            .slideX(
                              begin: isRTL ? 0.3 : -0.3,
                              end: 0,
                              curve: Curves.easeOut,
                            ),
                        const SizedBox(height: 8),
                        Text(
                              t.translate('subtitle'),
                              style: TextStyle(
                                fontSize: 13,
                                color: isDark
                                    ? Colors.white.withValues(alpha: 0.9)
                                    : AppColors.lightTextSecondary,
                                height: 1.4,
                              ),
                              maxLines: 2,
                            )
                            .animate(delay: 150.ms)
                            .fadeIn(duration: 400.ms)
                            .slideX(
                              begin: isRTL ? 0.3 : -0.3,
                              end: 0,
                              curve: Curves.easeOut,
                            ),
                      ],
                    ),
                  ),
                  Icon(
                        Icons.language_rounded,
                        color: isDark
                            ? Colors.white.withValues(alpha: 0.3)
                            : AppColors.lightTextPrimary.withValues(alpha: 0.3),
                        size: 40,
                      )
                      .animate(
                        onPlay: (controller) =>
                            controller.repeat(reverse: true),
                      )
                      .rotate(begin: 0, end: 0.05, duration: 2000.ms),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // My Collections Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CollectionsScreen(),
                    ),
                  );
                },
                child:
                    Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: isDark ? null : AppColors.collectionsCard,
                            gradient: isDark
                                ? LinearGradient(
                                    colors: [
                                      const Color(
                                        0xFF8B5CF6,
                                      ).withValues(alpha: 0.8),
                                      const Color(0xFF6366F1),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )
                                : null,
                            borderRadius: BorderRadius.circular(24),
                            border: isDark
                                ? null
                                : Border.all(
                                    color: AppColors.lightBorder,
                                    width: 1,
                                  ),
                            boxShadow: isDark
                                ? [
                                    BoxShadow(
                                      color: const Color(
                                        0xFF6366F1,
                                      ).withValues(alpha: 0.3),
                                      blurRadius: 12,
                                      offset: const Offset(0, 4),
                                    ),
                                  ]
                                : [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.05,
                                      ),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? Colors.white.withValues(alpha: 0.2)
                                      : AppColors.accentBlue.withValues(
                                          alpha: 0.15,
                                        ),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Icon(
                                  Icons.collections_bookmark,
                                  color: isDark
                                      ? Colors.white
                                      : AppColors.accentBlue,
                                  size: 26,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      t.translate('myCollections'),
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: isDark
                                            ? Colors.white
                                            : AppColors.lightTextPrimary,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      '${appState.collections.length} ${t.translate('collections').toLowerCase()}',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: isDark
                                            ? Colors.white.withValues(
                                                alpha: 0.9,
                                              )
                                            : AppColors.lightTextSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                isRTL
                                    ? Icons.chevron_left_rounded
                                    : Icons.chevron_right_rounded,
                                color: isDark
                                    ? Colors.white
                                    : AppColors.lightTextSecondary,
                                size: 28,
                              ),
                            ],
                          ),
                        )
                        .animate()
                        .fadeIn(duration: 500.ms)
                        .slideY(begin: 0.3, end: 0, curve: Curves.easeOut),
              ),
            ),

            const SizedBox(height: 32),

            // Favorites Section
            if (favoritePrograms.isNotEmpty) ...[
              Padding(
                padding: EdgeInsets.only(
                  left: isRTL ? 0 : 24,
                  right: isRTL ? 24 : 0,
                ),
                child: Text(
                  t.translate('favPrograms'),
                  style: Theme.of(context).textTheme.labelSmall,
                ).animate().fadeIn(duration: 400.ms),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemCount: favoritePrograms.length,
                  itemBuilder: (context, index) {
                    final program = favoritePrograms[index];
                    return Container(
                      width: 140,
                      margin: EdgeInsets.only(
                        left: isRTL ? 16 : (index == 0 ? 0 : 16),
                        right: isRTL ? (index == 0 ? 0 : 16) : 16,
                      ),
                      child: ProgramCard(
                        program: program,
                        isFavorite: true,
                        index: index,
                        onTap: () => appState.selectProgram(program),
                        onFavoriteTap: () =>
                            appState.toggleFavoriteProgram(program.id),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),
            ],

            // All Programs Section
            Padding(
              padding: EdgeInsets.only(
                left: isRTL ? 0 : 24,
                right: isRTL ? 24 : 0,
              ),
              child: Text(
                t.translate('allPrograms'),
                style: Theme.of(context).textTheme.labelSmall,
              ).animate(delay: 200.ms).fadeIn(duration: 400.ms),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.95,
                ),
                itemCount: allPrograms.length,
                itemBuilder: (context, index) {
                  final program = allPrograms[index];
                  return ProgramCard(
                    program: program,
                    isFavorite: appState.isProgramFavorite(program.id),
                    index: index,
                    onTap: () => appState.selectProgram(program),
                    onFavoriteTap: () =>
                        appState.toggleFavoriteProgram(program.id),
                  );
                },
              ),
            ),
            const SizedBox(height: 100), // Bottom padding for nav bar
          ],
        ),
      ),
    );
  }
}
