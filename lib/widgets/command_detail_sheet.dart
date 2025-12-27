import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    final programName = appState.selectedProgramName ?? 'Program';
    final programLogo = appState.selectedProgramLogo;

    return Directionality(
      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCardBackground : Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 20),
              width: 48,
              height: 4,
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkBorder : const Color(0xFFE5E7EB),
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            // Header (Program Icon + Name + Close)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  // Program Icon (Now Local Asset)
                  Container(
                    width: 48,
                    height: 48,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.darkCardBackground
                          : AppColors.lightCardBackground,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isDark
                            ? AppColors.darkBorder
                            : AppColors.lightBorder,
                      ),
                    ),
                    child: (programLogo == null)
                        ? Icon(
                            Icons.apps,
                            color: Theme.of(context).colorScheme.primary,
                            size: 24,
                          )
                        : programLogo.endsWith('.svg')
                        ? SvgPicture.asset(
                            programLogo,
                            fit: BoxFit.contain,
                            placeholderBuilder: (context) => const Center(
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                          )
                        : Image.asset(
                            programLogo,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) => Icon(
                              Icons.apps,
                              color: Theme.of(context).colorScheme.primary,
                              size: 24,
                            ),
                          ),
                  ),
                  const SizedBox(width: 16),

                  // Title
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.command.name,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                        ),
                        Text(
                          "$programName ${t.translate('programCommand')}", // e.g. AutoCAD Command
                          style: TextStyle(
                            fontSize: 13,
                            color: isDark ? Colors.white60 : Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Close Button
                  GestureDetector(
                    onTap: () {
                      appState.selectCommand(null);
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.white.withOpacity(0.05)
                            : const Color(0xFFF3F4F6),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        size: 20,
                        color: isDark ? Colors.white70 : Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Scrollable Content
            Flexible(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  // Big Shortcut Letter
                  Center(
                    child:
                        Text(
                          widget.command.shortcut,
                          style: const TextStyle(
                            fontSize: 96,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF2563EB), // Premium Blue
                            height: 1.0,
                          ),
                        ).animate().scale(
                          begin: const Offset(0.5, 0.5),
                          end: const Offset(1.0, 1.0),
                          curve: Curves.elasticOut,
                          duration: 600.ms,
                        ),
                  ),

                  const SizedBox(height: 16),

                  // Breadcrumb Pill
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFF6FF), // Light Blue
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              widget.command.breadcrumb,
                              style: const TextStyle(
                                color: Color(0xFF2563EB),
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // DESCRIPTION
                  Text(
                    t.translate('desc').toUpperCase(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                      color: isDark ? Colors.white54 : Colors.grey[500],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.command.description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: isDark
                          ? Colors.white.withOpacity(0.9)
                          : const Color(0xFF374151),
                      height: 1.5,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // NOTES
                  Text(
                    t.translate('notes').toUpperCase(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                      color: isDark ? Colors.white54 : Colors.grey[500],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Message Input Field
                  Container(
                    decoration: BoxDecoration(
                      color: isDark
                          ? Colors.white.withOpacity(0.02)
                          : Colors.grey[50],
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isDark ? Colors.white24 : Colors.grey[300]!,
                        style: BorderStyle.solid,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _noteController,
                            onChanged: (value) {
                              appState.saveNote(widget.command.id, value);
                            },
                            style: Theme.of(context).textTheme.bodyMedium,
                            minLines: 1,
                            maxLines: 5,
                            decoration: InputDecoration(
                              hintText: t.translate('notePlaceholder'),
                              hintStyle: TextStyle(
                                color: isDark
                                    ? Colors.white30
                                    : Colors.grey[400],
                                fontStyle: FontStyle.italic,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.description_outlined,
                          size: 20,
                          color: isDark ? Colors.white30 : Colors.grey[400],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),

            // Bottom Save Button
            Container(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
              child: GestureDetector(
                onTap: () => appState.toggleFavoriteCommand(widget.command.id),
                child: Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    color: isDark
                        ? const Color(0xFF1F2937)
                        : const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                            isFavorite ? Icons.star : Icons.star_border_rounded,
                            color: isFavorite
                                ? AppColors.favoriteYellow
                                : (isDark ? Colors.white : Colors.black87),
                            size: 24,
                          )
                          .animate(target: isFavorite ? 1 : 0)
                          .scale(
                            begin: const Offset(1, 1),
                            end: const Offset(1.3, 1.3),
                            duration: 200.ms,
                            curve: Curves.elasticOut,
                          )
                          .then()
                          .scale(end: const Offset(1, 1)),
                      const SizedBox(width: 8),
                      Text(
                        isFavorite
                            ? t.translate('saved')
                            : t.translate(
                                'save',
                              ), // Use localized "Save" / "Saved"
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isDark
                              ? Colors.white
                              : const Color(0xFF374151),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
