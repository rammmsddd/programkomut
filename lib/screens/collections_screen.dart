import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../providers/app_state_provider.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_colors.dart';
import 'collection_detail_screen.dart';

class CollectionsScreen extends StatefulWidget {
  const CollectionsScreen({super.key});

  @override
  State<CollectionsScreen> createState() => _CollectionsScreenState();
}

class _CollectionsScreenState extends State<CollectionsScreen> {
  final TextEditingController _createController = TextEditingController();

  @override
  void dispose() {
    _createController.dispose();
    super.dispose();
  }

  void _showCreateDialog() {
    final appState = context.read<AppStateProvider>();
    final t = AppLocalizations(appState.languageCode);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.translate('createCollection')),
        content: TextField(
          controller: _createController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: t.translate('collectionName'),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.translate('cancel')),
          ),
          FilledButton(
            onPressed: () {
              if (_createController.text.trim().isNotEmpty) {
                appState.createCollection(_createController.text.trim());
                _createController.clear();
                Navigator.pop(context);
              }
            },
            child: Text(t.translate('save')),
          ),
        ],
      ),
    );
  }

  void _deleteCollection(String collectionId) {
    final appState = context.read<AppStateProvider>();
    final t = AppLocalizations(appState.languageCode);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.translate('deleteCollection')),
        content: Text(t.translate('deleteConfirm')),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.translate('cancel')),
          ),
          FilledButton(
            onPressed: () {
              appState.deleteCollection(collectionId);
              Navigator.pop(context);
            },
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: Text(t.translate('delete')),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppStateProvider>();
    final t = AppLocalizations(appState.languageCode);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isRTL = AppLocalizations.supportedLanguages
        .firstWhere((l) => l.code == appState.languageCode)
        .isRTL;

    final collections = appState.collections;

    return Directionality(
      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: isDark
            ? AppColors.darkBackground
            : AppColors.lightBackground,
        appBar: AppBar(
          title: Text(t.translate('collections')),
          centerTitle: true,
          elevation: 0,
          backgroundColor: isDark
              ? AppColors.darkBackground
              : AppColors.lightBackground,
        ),
        body: collections.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                          Icons.collections_bookmark_outlined,
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
                      t.translate('noCollections'),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: isDark
                            ? AppColors.darkTextPrimary
                            : AppColors.lightTextPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      t.translate('createFirst'),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ).animate().fadeIn(duration: 600.ms),
              )
            : ListView.builder(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 100),
                itemCount: collections.length,
                itemBuilder: (context, index) {
                  final collection = collections[index];
                  final commandCount = collection.commandIds.length;

                  return Dismissible(
                    key: Key(collection.id),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    confirmDismiss: (direction) async {
                      _deleteCollection(collection.id);
                      return false; // Prevent auto-dismiss
                    },
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CollectionDetailScreen(
                              collectionId: collection.id,
                            ),
                          ),
                        );
                      },
                      child:
                          Container(
                                margin: const EdgeInsets.only(bottom: 14),
                                padding: const EdgeInsets.all(20),
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
                                      color: Colors.black.withValues(
                                        alpha: 0.03,
                                      ),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    // Collection Icon
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            AppColors.accentBlue.withValues(
                                              alpha: 0.8,
                                            ),
                                            AppColors.accentBlue,
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.accentBlue
                                                .withValues(alpha: 0.3),
                                            blurRadius: 6,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.collections_bookmark,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    // Collection Info
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: isRTL
                                            ? CrossAxisAlignment.end
                                            : CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            collection.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            '$commandCount ${t.translate('commands')}',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: isDark
                                                  ? AppColors.darkTextSecondary
                                                  : AppColors
                                                        .lightTextSecondary,
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
                                          ? AppColors.darkTextSecondary
                                          : AppColors.lightTextSecondary,
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
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _showCreateDialog,
          backgroundColor: AppColors.accentBlue,
          icon: const Icon(Icons.add),
          label: Text(t.translate('createNew')),
        ),
      ),
    );
  }
}
