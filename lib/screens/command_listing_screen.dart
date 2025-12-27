import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../providers/app_state_provider.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_colors.dart';
import '../models/command.dart';

class CommandListingScreen extends StatelessWidget {
  const CommandListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppStateProvider>();
    final t = AppLocalizations(appState.languageCode);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isRTL = AppLocalizations.supportedLanguages
        .firstWhere((l) => l.code == appState.languageCode)
        .isRTL;

    final program = appState.selectedProgram;
    if (program == null) return const SizedBox.shrink();

    final filteredCommands = appState.getFilteredCommands();

    return Directionality(
      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
      child: Column(
        children: [
          // Sticky Header
          Container(
            decoration: BoxDecoration(
              color:
                  (isDark
                          ? AppColors.darkBackground
                          : AppColors.lightBackground)
                      .withOpacity(0.95),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.fromLTRB(24, 60, 24, 16),
            child: Column(
              children: [
                // Header Row
                Row(
                  children: [
                    GestureDetector(
                          onTap: () => appState.goBack(),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isDark
                                  ? AppColors.darkCardBackground
                                  : const Color(0xFFF9FAFB),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Icon(
                              isRTL
                                  ? Icons.arrow_forward_rounded
                                  : Icons.arrow_back_rounded,
                              color: isDark
                                  ? AppColors.darkTextSecondary
                                  : AppColors.lightTextSecondary,
                              size: 22,
                            ),
                          ),
                        )
                        .animate()
                        .fadeIn(duration: 300.ms)
                        .scale(
                          begin: const Offset(0.8, 0.8),
                          end: const Offset(1.0, 1.0),
                        ),
                    const SizedBox(width: 12),
                    Expanded(
                      child:
                          Text(
                                program.name,
                                style: Theme.of(context).textTheme.titleLarge,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )
                              .animate(delay: 100.ms)
                              .fadeIn(duration: 300.ms)
                              .slideX(begin: isRTL ? -0.2 : 0.2, end: 0),
                    ),
                    // Toggle Button
                    GestureDetector(
                      onTap: () => appState.toggleShortcutMode(),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: appState.isShortcutMode
                              ? AppColors.accentBlue
                              : (isDark
                                    ? AppColors.darkCardBackground
                                    : const Color(0xFFF3F4F6)),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: appState.isShortcutMode
                                ? AppColors.accentBlue
                                : (isDark
                                      ? AppColors.darkBorder
                                      : const Color(0xFFE5E7EB)),
                          ),
                          boxShadow: appState.isShortcutMode
                              ? [
                                  BoxShadow(
                                    color: AppColors.accentBlue.withOpacity(
                                      0.3,
                                    ),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ]
                              : [],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.swap_horiz_rounded,
                              size: 14,
                              color: appState.isShortcutMode
                                  ? Colors.white
                                  : (isDark
                                        ? AppColors.darkTextSecondary
                                        : AppColors.lightTextSecondary),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              appState.isShortcutMode
                                  ? t.translate('shortcutMode')
                                  : t.translate('nameMode'),
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w900,
                                color: appState.isShortcutMode
                                    ? Colors.white
                                    : (isDark
                                          ? AppColors.darkTextSecondary
                                          : AppColors.lightTextSecondary),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).animate(delay: 150.ms).fadeIn(duration: 300.ms),
                  ],
                ),
                const SizedBox(height: 16),
                // Search Bar
                Container(
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppColors.darkCardBackground
                            : const Color(0xFFF9FAFB),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isDark
                              ? AppColors.darkBorder
                              : AppColors.lightBorder,
                        ),
                      ),
                      child: TextField(
                        onChanged: (value) => appState.setSearchQuery(value),
                        style: Theme.of(context).textTheme.bodyLarge,
                        decoration: InputDecoration(
                          hintText: t.translate('searchPlaceholder'),
                          hintStyle: Theme.of(context).textTheme.bodyMedium,
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: isDark
                                ? AppColors.darkTextSecondary
                                : AppColors.lightTextSecondary,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                      ),
                    )
                    .animate(delay: 200.ms)
                    .fadeIn(duration: 300.ms)
                    .slideY(begin: -0.2, end: 0),
              ],
            ),
          ),

          // Commands List
          Expanded(
            child: filteredCommands.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off_rounded,
                          size: 64,
                          color: isDark
                              ? AppColors.darkBorder
                              : const Color(0xFFE5E7EB),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          t.translate('noCommands'),
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: isDark
                                    ? AppColors.darkTextSecondary
                                    : AppColors.lightTextSecondary,
                              ),
                        ),
                      ],
                    ).animate().fadeIn(duration: 400.ms),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
                    itemCount: filteredCommands.length,
                    itemBuilder: (context, index) {
                      final command = filteredCommands[index];
                      return _CommandListItem(
                        command: command,
                        isShortcutMode: appState.isShortcutMode,
                        isFavorite: appState.isCommandFavorite(command.id),
                        onTap: () => appState.selectCommand(command),
                        onFavoriteTap: () =>
                            appState.toggleFavoriteCommand(command.id),
                        index: index,
                        isDark: isDark,
                        isRTL: isRTL,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _CommandListItem extends StatelessWidget {
  final Command command;
  final bool isShortcutMode;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;
  final int index;
  final bool isDark;
  final bool isRTL;

  const _CommandListItem({
    required this.command,
    required this.isShortcutMode,
    required this.isFavorite,
    required this.onTap,
    required this.onFavoriteTap,
    required this.index,
    required this.isDark,
    required this.isRTL,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:
          Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkCardBackground : Colors.white,
                  borderRadius: BorderRadius.circular(20),
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
                    Expanded(
                      child: Row(
                        children: isShortcutMode
                            ? [
                                // Shortcut first
                                Text(
                                  command.shortcut,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: AppColors.accentBlue,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    command.name,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: isDark
                                          ? AppColors.darkTextSecondary
                                          : AppColors.lightTextSecondary,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ]
                            : [
                                // Name first
                                Expanded(
                                  child: Text(
                                    command.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      color: isDark
                                          ? AppColors.darkTextPrimary
                                          : AppColors.lightTextPrimary,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.accentBlue.withOpacity(
                                      0.1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    command.shortcut,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w900,
                                      color: AppColors.accentBlue,
                                    ),
                                  ),
                                ),
                              ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: onFavoriteTap,
                      behavior: HitTestBehavior.opaque,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child:
                            Icon(
                                  isFavorite ? Icons.star : Icons.star_border,
                                  color: isFavorite
                                      ? AppColors.favoriteYellow
                                      : (isDark
                                            ? AppColors.darkBorder
                                            : const Color(0xFFE5E7EB)),
                                  size: 24,
                                )
                                .animate(target: isFavorite ? 1 : 0)
                                .scale(
                                  begin: const Offset(0.5, 0.5),
                                  end: const Offset(1.2, 1.2),
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.elasticOut,
                                )
                                .then()
                                .scale(
                                  begin: const Offset(1.2, 1.2),
                                  end: const Offset(1.0, 1.0),
                                  duration: const Duration(milliseconds: 150),
                                ),
                      ),
                    ),
                  ],
                ),
              )
              .animate(delay: Duration(milliseconds: index * 30))
              .fadeIn(duration: 300.ms)
              .slideY(begin: 0.2, end: 0, curve: Curves.easeOut),
    );
  }
}
