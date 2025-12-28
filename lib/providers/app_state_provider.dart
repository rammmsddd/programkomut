import 'package:flutter/material.dart';
import 'dart:convert';
import '../models/program.dart';
import '../models/command.dart';
import '../models/collection.dart';
import '../data/programs_data.dart';
import '../utils/storage_helper.dart';

enum AppScreen { home, listing, saved }

enum SearchFilter { name, shortcut }

class AppStateProvider with ChangeNotifier {
  // Current State
  AppScreen _currentScreen = AppScreen.home;
  Program? _selectedProgram;
  Command? _selectedCommand;
  String? _selectedProgramName;

  // User Preferences
  List<String> _favoriteProgramIds = [];
  List<String> _favoriteCommandIds = [];
  Map<String, String> _notes = {};
  String _languageCode = 'en';
  bool _isDarkMode = false;
  List<Collection> _collections = [];

  // Search & Filter
  String _searchQuery = '';
  bool _isShortcutMode = false;
  SearchFilter _searchFilter = SearchFilter.name;

  // Getters
  AppScreen get currentScreen => _currentScreen;
  Program? get selectedProgram => _selectedProgram;
  Command? get selectedCommand => _selectedCommand;
  String? get selectedProgramName => _selectedProgramName;
  List<String> get favoriteProgramIds => _favoriteProgramIds;
  List<String> get favoriteCommandIds => _favoriteCommandIds;
  Map<String, String> get notes => _notes;
  String get languageCode => _languageCode;
  bool get isDarkMode => _isDarkMode;
  String get searchQuery => _searchQuery;
  bool get isShortcutMode => _isShortcutMode;
  SearchFilter get searchFilter => _searchFilter;
  List<Collection> get collections => _collections;

  List<Program> get allPrograms => programs;

  List<Program> get favoritePrograms {
    return programs.where((p) => _favoriteProgramIds.contains(p.id)).toList();
  }

  List<Map<String, dynamic>> get savedCommands {
    List<Map<String, dynamic>> saved = [];
    for (var program in programs) {
      for (var command in program.commands) {
        if (_favoriteCommandIds.contains(command.id)) {
          saved.add({'command': command, 'programName': program.name});
        }
      }
    }
    return saved;
  }

  // Initialize from storage
  Future<void> loadPreferences() async {
    _favoriteProgramIds = await StorageHelper.getFavoritePrograms();
    _favoriteCommandIds = await StorageHelper.getFavoriteCommands();
    _notes = await StorageHelper.getNotes();
    _languageCode = await StorageHelper.getLanguage();
    _isDarkMode = await StorageHelper.getDarkMode();

    // Load collections
    final collectionsJson = await StorageHelper.getCollections();
    _collections = collectionsJson
        .map((json) => Collection.fromJson(json))
        .toList();

    notifyListeners();
  }

  // Navigation
  void navigateToScreen(AppScreen screen) {
    _currentScreen = screen;
    notifyListeners();
  }

  void selectProgram(Program? program) {
    _selectedProgram = program;
    _currentScreen = AppScreen.listing;
    _searchQuery = ''; // Reset search when selecting new program
    notifyListeners();
  }

  void selectCommand(Command? command, {String? programName}) {
    _selectedCommand = command;
    if (command != null) {
      // If explicit program info is passed (e.g. from Saved screen), use it
      if (programName != null)
        _selectedProgramName = programName;
      // If not, fall back to currently selected program (from Listing screen)
      else if (_selectedProgram != null) {
        _selectedProgramName = _selectedProgram!.name;
      }
    }
    notifyListeners();
  }

  void goBack() {
    if (_currentScreen == AppScreen.listing) {
      _currentScreen = AppScreen.home;
      _selectedProgram = null;
      _searchQuery = '';
    }
    notifyListeners();
  }

  // Favorites
  void toggleFavoriteProgram(String programId) {
    if (_favoriteProgramIds.contains(programId)) {
      _favoriteProgramIds.remove(programId);
    } else {
      _favoriteProgramIds.add(programId);
    }
    StorageHelper.saveFavoritePrograms(_favoriteProgramIds);
    notifyListeners();
  }

  void toggleFavoriteCommand(String commandId) {
    if (_favoriteCommandIds.contains(commandId)) {
      _favoriteCommandIds.remove(commandId);
    } else {
      _favoriteCommandIds.add(commandId);
    }
    StorageHelper.saveFavoriteCommands(_favoriteCommandIds);
    notifyListeners();
  }

  bool isProgramFavorite(String programId) {
    return _favoriteProgramIds.contains(programId);
  }

  bool isCommandFavorite(String commandId) {
    return _favoriteCommandIds.contains(commandId);
  }

  // Notes
  void saveNote(String commandId, String note) {
    if (note.isEmpty) {
      _notes.remove(commandId);
    } else {
      _notes[commandId] = note;
    }
    StorageHelper.saveNotes(_notes);
    notifyListeners();
  }

  String? getNoteForCommand(String commandId) {
    return _notes[commandId];
  }

  // Language
  void setLanguage(String code) {
    _languageCode = code;
    StorageHelper.saveLanguage(code);
    notifyListeners();
  }

  // Theme
  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    StorageHelper.saveDarkMode(_isDarkMode);
    notifyListeners();
  }

  void setDarkMode(bool value) {
    _isDarkMode = value;
    StorageHelper.saveDarkMode(_isDarkMode);
    notifyListeners();
  }

  // Search
  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void toggleShortcutMode() {
    _isShortcutMode = !_isShortcutMode;
    notifyListeners();
  }

  void setSearchFilter(SearchFilter filter) {
    _searchFilter = filter;
    notifyListeners();
  }

  List<Command> getFilteredCommands() {
    if (_selectedProgram == null) return [];

    if (_searchQuery.isEmpty) {
      return _selectedProgram!.commands;
    }

    return _selectedProgram!.commands.where((cmd) {
      final query = _searchQuery.toLowerCase();

      if (_searchFilter == SearchFilter.name) {
        // Search in name and description (checking localized first)
        final desc = cmd.getDescription(_languageCode).toLowerCase();
        return cmd.name.toLowerCase().contains(query) || desc.contains(query);
      } else {
        // Search only in shortcut
        return cmd.shortcut.toLowerCase().contains(query);
      }
    }).toList();
  }

  // Collections Management
  void createCollection(String name) {
    final newCollection = Collection(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      commandIds: [],
      createdAt: DateTime.now(),
    );
    _collections.add(newCollection);
    _saveCollections();
    notifyListeners();
  }

  void deleteCollection(String collectionId) {
    _collections.removeWhere((c) => c.id == collectionId);
    _saveCollections();
    notifyListeners();
  }

  void renameCollection(String collectionId, String newName) {
    final index = _collections.indexWhere((c) => c.id == collectionId);
    if (index != -1) {
      _collections[index] = _collections[index].copyWith(name: newName);
      _saveCollections();
      notifyListeners();
    }
  }

  void addCommandToCollection(String collectionId, String commandId) {
    final index = _collections.indexWhere((c) => c.id == collectionId);
    if (index != -1) {
      final collection = _collections[index];
      if (!collection.commandIds.contains(commandId)) {
        final updatedIds = [...collection.commandIds, commandId];
        _collections[index] = collection.copyWith(commandIds: updatedIds);
        _saveCollections();
        notifyListeners();
      }
    }
  }

  void removeCommandFromCollection(String collectionId, String commandId) {
    final index = _collections.indexWhere((c) => c.id == collectionId);
    if (index != -1) {
      final collection = _collections[index];
      final updatedIds = collection.commandIds
          .where((id) => id != commandId)
          .toList();
      _collections[index] = collection.copyWith(commandIds: updatedIds);
      _saveCollections();
      notifyListeners();
    }
  }

  bool isCommandInCollection(String collectionId, String commandId) {
    final collection = _collections.firstWhere(
      (c) => c.id == collectionId,
      orElse: () => Collection(
        id: '',
        name: '',
        commandIds: [],
        createdAt: DateTime.now(),
      ),
    );
    return collection.commandIds.contains(commandId);
  }

  List<Map<String, dynamic>> getCollectionCommands(String collectionId) {
    final collection = _collections.firstWhere(
      (c) => c.id == collectionId,
      orElse: () => Collection(
        id: '',
        name: '',
        commandIds: [],
        createdAt: DateTime.now(),
      ),
    );

    final commands = <Map<String, dynamic>>[];
    for (final commandId in collection.commandIds) {
      for (final program in programs) {
        final command = program.commands.firstWhere(
          (cmd) => cmd.id == commandId,
          orElse: () => Command(
            id: '',
            name: '',
            shortcut: '',
            breadcrumb: '',
            description: '',
          ),
        );
        if (command.id.isNotEmpty) {
          commands.add({'command': command, 'programName': program.name});
          break;
        }
      }
    }
    return commands;
  }

  // Sharing: Export collection as JSON
  String exportCollectionAsJson(String collectionId) {
    final collection = _collections.firstWhere(
      (c) => c.id == collectionId,
      orElse: () => Collection(
        id: '',
        name: '',
        commandIds: [],
        createdAt: DateTime.now(),
      ),
    );

    if (collection.id.isEmpty) return '';

    return jsonEncode(collection.toJson());
  }

  // Sharing: Import collection from JSON
  bool importCollectionFromJson(String jsonString) {
    try {
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      final collection = Collection.fromJson(json);

      // Regenerate ID to avoid conflicts
      final importedCollection = collection.copyWith(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
      );

      _collections.add(importedCollection);
      _saveCollections();
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> _saveCollections() async {
    final collectionsJson = _collections.map((c) => c.toJson()).toList();
    await StorageHelper.saveCollections(collectionsJson);
  }
}
