import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/program.dart';
import '../theme/app_colors.dart';

class ProgramCard extends StatelessWidget {
  final Program program;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;
  final int index;

  const ProgramCard({
    super.key,
    required this.program,
    required this.isFavorite,
    required this.onTap,
    required this.onFavoriteTap,
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);

    return GestureDetector(
          onTap: onTap,
          child:
              Container(
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.darkCardBackground
                          : AppColors.lightCardBackground,
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(
                        color: isDark
                            ? AppColors.darkBorder
                            : AppColors.lightBorder,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Star Icon
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: onFavoriteTap,
                            behavior: HitTestBehavior.opaque,
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child:
                                  Icon(
                                        isFavorite
                                            ? Icons.star
                                            : Icons.star_border,
                                        color: isFavorite
                                            ? AppColors.favoriteYellow
                                            : (isDark
                                                  ? AppColors.darkBorder
                                                  : const Color(0xFFE5E7EB)),
                                        size: 20,
                                      )
                                      .animate(target: isFavorite ? 1 : 0)
                                      .scale(
                                        begin: const Offset(0.5, 0.5),
                                        end: const Offset(1.2, 1.2),
                                        duration: const Duration(
                                          milliseconds: 300,
                                        ),
                                        curve: Curves.elasticOut,
                                      )
                                      .then()
                                      .scale(
                                        begin: const Offset(1.2, 1.2),
                                        end: const Offset(1.0, 1.0),
                                        duration: const Duration(
                                          milliseconds: 150,
                                        ),
                                      ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),

                        // Program Logo - Premium First Letter Design
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                program.brandColor.withValues(alpha: 0.8),
                                program.brandColor,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: program.brandColor.withValues(alpha: 0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              program.name[0].toUpperCase(),
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withValues(alpha: 0.2),
                                    offset: const Offset(0, 2),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Program Name
                        Text(
                          program.name,
                          style: theme.textTheme.titleMedium,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                  .animate(delay: Duration(milliseconds: index * 50))
                  .fadeIn(duration: const Duration(milliseconds: 400))
                  .scale(
                    begin: const Offset(0.8, 0.8),
                    end: const Offset(1.0, 1.0),
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOut,
                  ),
        )
        .animate(onPlay: (controller) => controller.repeat(reverse: true))
        .shimmer(
          delay: Duration(milliseconds: 2000 + (index * 100)),
          duration: const Duration(milliseconds: 1000),
          color: Colors.white.withValues(alpha: 0.05),
        );
  }
}
