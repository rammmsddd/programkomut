import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../providers/app_state_provider.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_colors.dart';

class SettingsModal extends StatelessWidget {
  const SettingsModal({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppStateProvider>();
    final t = AppLocalizations(appState.languageCode);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isRTL = AppLocalizations.supportedLanguages
        .firstWhere((l) => l.code == appState.languageCode)
        .isRTL;

    return Directionality(
      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCardBackground : Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(48),
            topRight: Radius.circular(48),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 40,
              offset: const Offset(0, -10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Blue Header Section
            Container(
              decoration: BoxDecoration(
                gradient: AppGradients.blueHeader,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(48),
                  topRight: Radius.circular(48),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(32, 12, 32, 20),
              child: Column(
                children: [
                  // Handle
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    width: 48,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ).animate().fadeIn(duration: 200.ms),

                  // Header Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                            t.translate('settings'),
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          )
                          .animate()
                          .fadeIn(duration: 300.ms)
                          .slideX(begin: isRTL ? 0.2 : -0.2, end: 0),
                      GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Icon(
                                Icons.close_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          )
                          .animate(delay: 100.ms)
                          .fadeIn(duration: 300.ms)
                          .scale(
                            begin: const Offset(0.5, 0.5),
                            end: const Offset(1.0, 1.0),
                          ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Content
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Dark Mode Toggle
                    Container(
                          padding: const EdgeInsets.all(16),
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
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? AppColors.darkCardBackground
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.05,
                                      ),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  isDark
                                      ? Icons.dark_mode_rounded
                                      : Icons.light_mode_rounded,
                                  color: isDark
                                      ? const Color(0xFF60A5FA)
                                      : const Color(0xFFFBBF24),
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  isDark
                                      ? t.translate('darkMode')
                                      : t.translate('lightMode'),
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                              ),
                              // Toggle Switch
                              GestureDetector(
                                onTap: () => appState.toggleDarkMode(),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeOut,
                                  width: 48,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: isDark
                                        ? AppColors.accentBlueDark
                                        : const Color(0xFFD1D5DB),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: AnimatedAlign(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeOut,
                                    alignment: isDark
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                    child: Container(
                                      margin: const EdgeInsets.all(4),
                                      width: 20,
                                      height: 20,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        .animate(delay: 150.ms)
                        .fadeIn(duration: 300.ms)
                        .slideY(begin: 0.2, end: 0),

                    const SizedBox(height: 24),

                    // Language Section
                    Text(
                      t.translate('language'),
                      style: Theme.of(context).textTheme.labelSmall,
                    ).animate(delay: 200.ms).fadeIn(duration: 300.ms),

                    const SizedBox(height: 12),

                    // Language List
                    ...AppLocalizations.supportedLanguages.asMap().entries.map((
                      entry,
                    ) {
                      final index = entry.key;
                      final language = entry.value;
                      final isSelected = language.code == appState.languageCode;

                      return GestureDetector(
                        onTap: () => appState.setLanguage(language.code),
                        child:
                            Container(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? (isDark
                                              ? AppColors.accentBlueDark
                                                    .withValues(alpha: 0.2)
                                              : AppColors.accentBlue.withValues(
                                                  alpha: 0.1,
                                                ))
                                        : (isDark
                                              ? const Color(0xFF374151)
                                              : const Color(0xFFF9FAFB)),
                                    borderRadius: BorderRadius.circular(24),
                                    border: Border.all(
                                      color: isSelected
                                          ? (isDark
                                                ? AppColors.accentBlueDark
                                                : AppColors.accentBlue)
                                          : (isDark
                                                ? AppColors.darkBorder
                                                : AppColors.lightBorder),
                                      width: isSelected ? 2 : 1,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        language.flag,
                                        style: const TextStyle(fontSize: 28),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Text(
                                          language.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                color: isSelected
                                                    ? (isDark
                                                          ? AppColors
                                                                .accentBlueDark
                                                          : AppColors
                                                                .accentBlue)
                                                    : null,
                                              ),
                                        ),
                                      ),
                                      if (isSelected)
                                        Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: isDark
                                                ? AppColors.accentBlueDark
                                                : AppColors.accentBlue,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ).animate().scale(
                                          begin: const Offset(0.5, 0.5),
                                          end: const Offset(1.0, 1.0),
                                          curve: Curves.elasticOut,
                                        ),
                                    ],
                                  ),
                                )
                                .animate(
                                  delay: Duration(
                                    milliseconds: 250 + (index * 30),
                                  ),
                                )
                                .fadeIn(duration: 300.ms)
                                .slideX(
                                  begin: isRTL ? -0.2 : 0.2,
                                  end: 0,
                                  curve: Curves.easeOut,
                                ),
                      );
                    }),

                    const SizedBox(height: 80), // Extra space for bottom sheet
                  ],
                ),
              ),
            ),

            // Close Button
            Padding(
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 32),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: isDark
                            ? const Color(0xFF60A5FA)
                            : const Color(0xFF111827),
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color:
                                (isDark
                                        ? const Color(0xFF60A5FA)
                                        : const Color(0xFF111827))
                                    .withValues(alpha: 0.3),
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
                  ),
                )
                .animate(delay: 300.ms)
                .fadeIn(duration: 400.ms)
                .slideY(begin: 0.3, end: 0),
          ],
        ),
      ).animate().slideY(begin: 1, end: 0, duration: 400.ms, curve: Curves.easeOut),
    );
  }
}
