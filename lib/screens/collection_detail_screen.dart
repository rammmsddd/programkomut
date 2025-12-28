import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../providers/app_state_provider.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_colors.dart';
import '../models/collection.dart';

class CollectionDetailScreen extends StatelessWidget {
  final String collectionId;

  const CollectionDetailScreen({super.key, required this.collectionId});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppStateProvider>();
    final t = AppLocalizations(appState.languageCode);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isRTL = AppLocalizations.supportedLanguages
        .firstWhere((l) => l.code == appState.languageCode)
        .isRTL;

    final collection = appState.collections.firstWhere(
      (c) => c.id == collectionId,
      orElse: () => Collection(
        id: '',
        name: '',
        commandIds: [],
        createdAt: DateTime.now(),
      ),
    );

    if (collection.id.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Collection Not Found')), // TODO: Localize
        body: Center(
          child: Text('This collection no longer exists'),
        ), // TODO: Localize
      );
    }

    final commands = appState.getCollectionCommands(collectionId);

    return Directionality(
      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: isDark
            ? AppColors.darkBackground
            : AppColors.lightBackground,
        appBar: AppBar(
          title: Text(collection.name),
          centerTitle: true,
          elevation: 0,
          backgroundColor: isDark
              ? AppColors.darkBackground
              : AppColors.lightBackground,
          actions: [
            // Share button (TODO: implement sharing)
            IconButton(
              icon: const Icon(Icons.share_rounded),
              onPressed: () {
                // TODO: Show share dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Sharing coming soon!'), // TODO: Localize
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),
          ],
        ),
        body: commands.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                          Icons.bookmark_border_rounded,
                          size: 64,
                          color: isDark
                              ? AppColors.darkBorder
                              : const Color(0xFFE5E7EB),
                        )
                        .animate(
                          onPlay: (controller) =>
                              controller.repeat(reverse: true),
                        )
                        .scale(
                          begin: const Offset(1.0, 1.0),
                          end: const Offset(1.1, 1.1),
                          duration: 1500.ms,
                        ),
                    const SizedBox(height: 24),
                    Text(
                      'Empty Collection', // TODO: Localize
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: isDark
                            ? AppColors.darkTextPrimary
                            : AppColors.lightTextPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Add commands from detail sheets', // TODO: Localize
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ).animate().fadeIn(duration: 600.ms),
              )
            : ListView.builder(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                itemCount: commands.length,
                itemBuilder: (context, index) {
                  final item = commands[index];
                  final command = item['command'];
                  final programName = item['programName'];

                  return Dismissible(
                    key: Key(command.id),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: const Icon(
                        Icons.remove_circle,
                        color: Colors.white,
                      ),
                    ),
                    onDismissed: (direction) {
                      appState.removeCommandFromCollection(
                        collectionId,
                        command.id,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Removed from collection',
                          ), // TODO: Localize
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    child: GestureDetector(
                      onTap: () => appState.selectCommand(
                        command,
                        programName: programName,
                      ),
                      child:
                          Container(
                                margin: const EdgeInsets.only(bottom: 14),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? AppColors.darkCardBackground
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(28),
                                  border: Border.all(
                                    color: isDark
                                        ? AppColors.darkBorder
                                        : AppColors.lightBorder,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.03),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    // Program Initial Letter
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            const Color(
                                              0xFF6366F1,
                                            ).withOpacity(0.8),
                                            const Color(0xFF6366F1),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(
                                              0xFF6366F1,
                                            ).withOpacity(0.3),
                                            blurRadius: 6,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          programName[0].toUpperCase(),
                                          style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    // Command Info
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: isRTL
                                            ? CrossAxisAlignment.end
                                            : CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            programName.toUpperCase(),
                                            style: TextStyle(
                                              fontSize: 9,
                                              fontWeight: FontWeight.w900,
                                              color: AppColors.accentBlue,
                                              letterSpacing: 1.5,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  command.name,
                                                  style: Theme.of(
                                                    context,
                                                  ).textTheme.titleMedium,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 6,
                                                      vertical: 2,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color: isDark
                                                      ? AppColors.darkBorder
                                                      : const Color(0xFFF9FAFB),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Text(
                                                  command.shortcut,
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w900,
                                                    color: isDark
                                                        ? AppColors
                                                              .darkTextSecondary
                                                        : AppColors
                                                              .lightTextSecondary,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              .animate(
                                delay: Duration(milliseconds: index * 50),
                              )
                              .fadeIn(duration: 300.ms)
                              .slideY(
                                begin: 0.2,
                                end: 0,
                                curve: Curves.easeOut,
                              ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
