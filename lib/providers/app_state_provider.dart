import 'package:flutter/material.dart';
import '../models/program.dart';
import '../models/command.dart';
import '../data/programs_data.dart';
import '../utils/storage_helper.dart';

enum AppScreen { home, listing, saved }

class AppStateProvider with ChangeNotifier {
  // Current State
  AppScreen _currentScreen = AppScreen.home;
  Program? _selectedProgram;
  Command? _selectedCommand;
  String? _selectedProgramName;
  String? _selectedProgramLogo;

  // User Preferences
  List<String> _favoriteProgramIds = [];
  List<String> _favoriteCommandIds = [];
  Map<String, String> _notes = {};
  String _languageCode = 'en';
  bool _isDarkMode = false;

  // Search & Filter
  String _searchQuery = '';
  bool _isShortcutMode = false;

  // Getters
  AppScreen get currentScreen => _currentScreen;
  Program? get selectedProgram => _selectedProgram;
  Command? get selectedCommand => _selectedCommand;
  String? get selectedProgramName => _selectedProgramName;
  String? get selectedProgramLogo => _selectedProgramLogo;
  List<String> get favoriteProgramIds => _favoriteProgramIds;
  List<String> get favoriteCommandIds => _favoriteCommandIds;
  Map<String, String> get notes => _notes;
  String get languageCode => _languageCode;
  bool get isDarkMode => _isDarkMode;
  String get searchQuery => _searchQuery;
  bool get isShortcutMode => _isShortcutMode;

  List<Program> get allPrograms => programs;

  List<Program> get favoritePrograms {
    return programs.where((p) => _favoriteProgramIds.contains(p.id)).toList();
  }

  List<Map<String, dynamic>> get savedCommands {
    List<Map<String, dynamic>> saved = [];
    for (var program in programs) {
      for (var command in program.commands) {
        if (_favoriteCommandIds.contains(command.id)) {
          saved.add({
            'command': command,
            'programName': program.name,
            'programLogo': program.imageUrl,
          });
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

  void selectCommand(
    Command? command, {
    String? programName,
    String? programLogo,
  }) {
    _selectedCommand = command;
    if (command != null) {
      // If explicit program info is passed (e.g. from Saved screen), use it
      if (programName != null) _selectedProgramName = programName;
      if (programLogo != null)
        _selectedProgramLogo = programLogo;
      // If not, fall back to currently selected program (from Listing screen)
      else if (_selectedProgram != null) {
        _selectedProgramName = _selectedProgram!.name;
        _selectedProgramLogo = _selectedProgram!.imageUrl;
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

  List<Command> getFilteredCommands() {
    if (_selectedProgram == null) return [];

    if (_searchQuery.isEmpty) {
      return _selectedProgram!.commands;
    }

    return _selectedProgram!.commands.where((cmd) {
      final query = _searchQuery.toLowerCase();
      return cmd.name.toLowerCase().contains(query) ||
          cmd.shortcut.toLowerCase().contains(query);
    }).toList();
  }
}
