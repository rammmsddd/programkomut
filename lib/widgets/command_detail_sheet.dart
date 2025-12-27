import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../providers/app_state_provider.dart';
import '../models/command.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_colors.dart';

class CommandDetailSheet extends StatefulWidget {
  final Command command;

  const CommandDetailSheet({super.key, required this.command});

  @override
  State<CommandDetailSheet> createState() => _CommandDetailSheetState();
}

class _CommandDetailSheetState extends State<CommandDetailSheet> {
  late TextEditingController _noteController;

  @override
  void initState() {
    super.initState();
    final appState = context.read<AppStateProvider>();
    _noteController = TextEditingController(
      text: appState.getNoteForCommand(widget.command.id) ?? '',
    );
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppStateProvider>();
    final t = AppLocalizations(appState.languageCode);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isRTL = AppLocalizations.supportedLanguages
        .firstWhere((l) => l.code == appState.languageCode)
        .isRTL;

    final isFavorite = appState.isCommandFavorite(widget.command.id);

    return Directionality(
      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
      child:
          Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.75,
            ),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkCardBackground : Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(48),
                topRight: Radius.circular(48),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 40,
                  offset: const Offset(0, -10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Handle
                Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 20),
                  width: 48,
                  height: 5,
                  decoration: BoxDecoration(
                    color: isDark
                        ? AppColors.darkBorder
                        : const Color(0xFFE5E7EB),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ).animate().fadeIn(duration: 200.ms),

                // Content
                Flexible(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header with Star
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Shortcut Badge
                            Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: isDark
                                        ? AppGradients.headerDark
                                        : AppGradients.headerLight,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.accentBlue.withOpacity(
                                          0.3,
                                        ),
                                        blurRadius: 12,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    widget.command.shortcut,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                                .animate()
                                .fadeIn(duration: 300.ms)
                                .scale(
                                  begin: const Offset(0.8, 0.8),
                                  end: const Offset(1.0, 1.0),
                                  curve: Curves.elasticOut,
                                ),

                            // Favorite Button
                            GestureDetector(
                              onTap: () => appState.toggleFavoriteCommand(
                                widget.command.id,
                              ),
                              child:
                                  Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: isFavorite
                                              ? AppColors.favoriteYellow
                                                    .withOpacity(0.2)
                                              : (isDark
                                                    ? AppColors.darkBorder
                                                    : const Color(0xFFF9FAFB)),
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          border: Border.all(
                                            color: isFavorite
                                                ? AppColors.favoriteYellow
                                                : (isDark
                                                      ? AppColors.darkBorder
                                                      : AppColors.lightBorder),
                                            width: 2,
                                          ),
                                        ),
                                        child: Icon(
                                          isFavorite
                                              ? Icons.star
                                              : Icons.star_border,
                                          color: isFavorite
                                              ? AppColors.favoriteYellow
                                              : (isDark
                                                    ? AppColors
                                                          .darkTextSecondary
                                                    : AppColors
                                                          .lightTextSecondary),
                                          size: 32,
                                        ),
                                      )
                                      .animate(target: isFavorite ? 1 : 0)
                                      .scale(
                                        begin: const Offset(1.0, 1.0),
                                        end: const Offset(1.2, 1.2),
                                        duration: 200.ms,
                                        curve: Curves.elasticOut,
                                      )
                                      .then()
                                      .scale(
                                        begin: const Offset(1.2, 1.2),
                                        end: const Offset(1.0, 1.0),
                                        duration: 150.ms,
                                      ),
                            ).animate(delay: 100.ms).fadeIn(duration: 300.ms),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // Command Name
                        Text(
                              widget.command.name,
                              style: Theme.of(context).textTheme.displayMedium,
                            )
                            .animate(delay: 150.ms)
                            .fadeIn(duration: 300.ms)
                            .slideY(begin: 0.2, end: 0),

                        const SizedBox(height: 8),

                        // Breadcrumb
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: isDark
                                ? const Color(0xFF374151)
                                : const Color(0xFFF9FAFB),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            widget.command.breadcrumb,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: isDark
                                  ? AppColors.darkTextSecondary
                                  : AppColors.lightTextSecondary,
                            ),
                          ),
                        ).animate(delay: 200.ms).fadeIn(duration: 300.ms),

                        const SizedBox(height: 24),

                        // Description Label
                        Text(
                          t.translate('desc'),
                          style: Theme.of(context).textTheme.labelSmall,
                        ).animate(delay: 250.ms).fadeIn(duration: 300.ms),

                        const SizedBox(height: 12),

                        // Description
                        Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: isDark
                                    ? const Color(0xFF374151)
                                    : const Color(0xFFF9FAFB),
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                  color: isDark
                                      ? AppColors.darkBorder
                                      : AppColors.lightBorder,
                                ),
                              ),
                              child: Text(
                                widget.command.description,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            )
                            .animate(delay: 300.ms)
                            .fadeIn(duration: 300.ms)
                            .slideY(begin: 0.2, end: 0),

                        const SizedBox(height: 24),

                        // Notes Label
                        Text(
                          t.translate('notes'),
                          style: Theme.of(context).textTheme.labelSmall,
                        ).animate(delay: 350.ms).fadeIn(duration: 300.ms),

                        const SizedBox(height: 12),

                        // Notes TextField
                        Container(
                              decoration: BoxDecoration(
                                color: isDark
                                    ? const Color(0xFF374151)
                                    : const Color(0xFFF9FAFB),
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                  color: isDark
                                      ? AppColors.darkBorder
                                      : AppColors.lightBorder,
                                ),
                              ),
                              child: TextField(
                                controller: _noteController,
                                onChanged: (value) {
                                  appState.saveNote(widget.command.id, value);
                                },
                                maxLines: 4,
                                style: Theme.of(context).textTheme.bodyLarge,
                                decoration: InputDecoration(
                                  hintText: t.translate('notePlaceholder'),
                                  hintStyle: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium,
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.all(20),
                                ),
                              ),
                            )
                            .animate(delay: 400.ms)
                            .fadeIn(duration: 300.ms)
                            .slideY(begin: 0.2, end: 0),

                        const SizedBox(height: 32),

                        // Close Button
                        GestureDetector(
                              onTap: () {
                                appState.selectCommand(null);
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? AppColors.accentBlueDark
                                      : const Color(0xFF111827),
                                  borderRadius: BorderRadius.circular(24),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          (isDark
                                                  ? AppColors.accentBlueDark
                                                  : const Color(0xFF111827))
                                              .withOpacity(0.3),
                                      blurRadius: 20,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  t.translate('close'),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                            .animate(delay: 450.ms)
                            .fadeIn(duration: 400.ms)
                            .slideY(begin: 0.3, end: 0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ).animate().slideY(
            begin: 1,
            end: 0,
            duration: 400.ms,
            curve: Curves.easeOut,
          ),
    );
  }
}
