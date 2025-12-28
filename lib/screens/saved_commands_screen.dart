import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../providers/app_state_provider.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_colors.dart';
import '../widgets/settings_modal.dart';

class SavedCommandsScreen extends StatelessWidget {
  const SavedCommandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppStateProvider>();
    final t = AppLocalizations(appState.languageCode);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isRTL = AppLocalizations.supportedLanguages
        .firstWhere((l) => l.code == appState.languageCode)
        .isRTL;

    final savedCommands = appState.savedCommands;

    return Directionality(
      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 60, 24, 16),
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
                            t.translate('myCommands'),
                            style: Theme.of(context).textTheme.displayMedium,
                          )
                          .animate()
                          .fadeIn(duration: 400.ms)
                          .slideX(begin: isRTL ? 0.2 : -0.2, end: 0),
                      const SizedBox(height: 4),
                      Text(
                        t.translate('myCommandsSub'),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ).animate(delay: 100.ms).fadeIn(duration: 400.ms),
                    ],
                  ),
                ),
                GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => const SettingsModal(),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: isDark
                              ? AppColors.darkCardBackground
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isDark
                                ? AppColors.darkBorder
                                : AppColors.lightBorder,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.settings_rounded,
                          color: isDark
                              ? AppColors.darkTextSecondary
                              : AppColors.lightTextSecondary,
                          size: 22,
                        ),
                      ),
                    )
                    .animate(delay: 150.ms)
                    .fadeIn(duration: 400.ms)
                    .rotate(begin: 0, end: 0, duration: 300.ms),
              ],
            ),
          ),

          // Content
          Expanded(
            child: savedCommands.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                              Icons.favorite_border_rounded,
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
                          t.translate('noCommands'),
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                color: isDark
                                    ? AppColors.darkTextPrimary
                                    : AppColors.lightTextPrimary,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          t.translate('noCommandsSub'),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ).animate().fadeIn(duration: 600.ms),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 100),
                    itemCount: savedCommands.length,
                    itemBuilder: (context, index) {
                      final item = savedCommands[index];
                      final command = item['command'];
                      final programName = item['programName'];

                      return GestureDetector(
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
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
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
                                                        : const Color(
                                                            0xFFF9FAFB,
                                                          ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8,
                                                        ),
                                                  ),
                                                  child: Text(
                                                    command.shortcut,
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w900,
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
                                      const SizedBox(width: 8),
                                      // Star Button
                                      GestureDetector(
                                        onTap: () => appState
                                            .toggleFavoriteCommand(command.id),
                                        behavior: HitTestBehavior.opaque,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child:
                                              const Icon(
                                                    Icons.star,
                                                    color: AppColors
                                                        .favoriteYellow,
                                                    size: 24,
                                                  )
                                                  .animate(
                                                    onPlay: (controller) =>
                                                        controller.repeat(
                                                          reverse: true,
                                                        ),
                                                  )
                                                  .shimmer(
                                                    delay: Duration(
                                                      milliseconds: index * 200,
                                                    ),
                                                    duration: 1500.ms,
                                                    color: Colors.white
                                                        .withOpacity(0.3),
                                                  ),
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
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
