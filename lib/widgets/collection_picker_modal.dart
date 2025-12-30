import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state_provider.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_colors.dart';

class CollectionPickerModal extends StatefulWidget {
  final String commandId;

  const CollectionPickerModal({super.key, required this.commandId});

  @override
  State<CollectionPickerModal> createState() => _CollectionPickerModalState();
}

class _CollectionPickerModalState extends State<CollectionPickerModal> {
  final TextEditingController _newCollectionController =
      TextEditingController();
  String? _selectedCollectionId;

  @override
  void dispose() {
    _newCollectionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppStateProvider>();
    final t = AppLocalizations(appState.languageCode);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final collections = appState.collections;

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
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

          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  t.translate('addToCollection'),
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close_rounded),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Collections List
          if (collections.isEmpty)
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                t.translate('createFirst'),
                style: TextStyle(
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            )
          else
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: collections.length,
                itemBuilder: (context, index) {
                  final collection = collections[index];
                  final isSelected = _selectedCollectionId == collection.id;
                  final isInCollection = appState.isCommandInCollection(
                    collection.id,
                    widget.commandId,
                  );

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCollectionId = collection.id;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.accentBlue.withValues(alpha: 0.1)
                            : (isDark
                                  ? AppColors.darkBackground
                                  : const Color(0xFFF9FAFB)),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.accentBlue
                              : (isDark
                                    ? AppColors.darkBorder
                                    : AppColors.lightBorder),
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            isInCollection
                                ? Icons.check_circle
                                : (isSelected
                                      ? Icons.radio_button_checked
                                      : Icons.radio_button_unchecked),
                            color: isInCollection
                                ? Colors.green
                                : (isSelected
                                      ? AppColors.accentBlue
                                      : (isDark
                                            ? AppColors.darkTextSecondary
                                            : AppColors.lightTextSecondary)),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  collection.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: isSelected
                                        ? AppColors.accentBlue
                                        : null,
                                  ),
                                ),
                                if (isInCollection)
                                  Text(
                                    t.translate('added'),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.green.shade700,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

          const SizedBox(height: 16),

          // Create New Collection Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Divider(),
                const SizedBox(height: 16),
                Text(
                  t.translate('createNew'),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _newCollectionController,
                  decoration: InputDecoration(
                    hintText: t.translate('collectionName'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Action Buttons
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(t.translate('cancel')),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      // Create new collection if name provided
                      if (_newCollectionController.text.trim().isNotEmpty) {
                        appState.createCollection(
                          _newCollectionController.text.trim(),
                        );
                        // Get the newly created collection
                        final newCollection = appState.collections.last;
                        appState.addCommandToCollection(
                          newCollection.id,
                          widget.commandId,
                        );
                      }
                      // Add to selected collection
                      else if (_selectedCollectionId != null) {
                        appState.addCommandToCollection(
                          _selectedCollectionId!,
                          widget.commandId,
                        );
                      }
                      Navigator.pop(context);

                      // Show confirmation
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(t.translate('added')),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: AppColors.accentBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(t.translate('save')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
