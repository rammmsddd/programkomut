import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class StorageHelper {
  static const String _favProgramsKey = 'favPrograms';
  static const String _favCommandsKey = 'favCommands';
  static const String _notesKey = 'notes';
  static const String _languageKey = 'lang';
  static const String _darkModeKey = 'darkMode';
  static const String _collectionsKey = 'collections';

  // Get SharedPreferences instance
  static Future<SharedPreferences> get _prefs async {
    return await SharedPreferences.getInstance();
  }

  // Favorite Programs
  static Future<List<String>> getFavoritePrograms() async {
    final prefs = await _prefs;
    final jsonString = prefs.getString(_favProgramsKey);
    if (jsonString == null) return ['autocad', 'blender']; // Default favorites
    return List<String>.from(jsonDecode(jsonString));
  }

  static Future<void> saveFavoritePrograms(List<String> programs) async {
    final prefs = await _prefs;
    await prefs.setString(_favProgramsKey, jsonEncode(programs));
  }

  // Favorite Commands
  static Future<List<String>> getFavoriteCommands() async {
    final prefs = await _prefs;
    final jsonString = prefs.getString(_favCommandsKey);
    if (jsonString == null) return [];
    return List<String>.from(jsonDecode(jsonString));
  }

  static Future<void> saveFavoriteCommands(List<String> commands) async {
    final prefs = await _prefs;
    await prefs.setString(_favCommandsKey, jsonEncode(commands));
  }

  // Notes
  static Future<Map<String, String>> getNotes() async {
    final prefs = await _prefs;
    final jsonString = prefs.getString(_notesKey);
    if (jsonString == null) return {};
    return Map<String, String>.from(jsonDecode(jsonString));
  }

  static Future<void> saveNotes(Map<String, String> notes) async {
    final prefs = await _prefs;
    await prefs.setString(_notesKey, jsonEncode(notes));
  }

  // Language
  static Future<String> getLanguage() async {
    final prefs = await _prefs;
    return prefs.getString(_languageKey) ?? 'en';
  }

  static Future<void> saveLanguage(String languageCode) async {
    final prefs = await _prefs;
    await prefs.setString(_languageKey, languageCode);
  }

  // Dark Mode
  static Future<bool> getDarkMode() async {
    final prefs = await _prefs;
    return prefs.getBool(_darkModeKey) ?? false;
  }

  static Future<void> saveDarkMode(bool isDark) async {
    final prefs = await _prefs;
    await prefs.setBool(_darkModeKey, isDark);
  }

  // Collections
  static Future<List<Map<String, dynamic>>> getCollections() async {
    final prefs = await _prefs;
    final jsonString = prefs.getString(_collectionsKey);
    if (jsonString == null) return [];
    final List<dynamic> decoded = jsonDecode(jsonString);
    return decoded.cast<Map<String, dynamic>>();
  }

  static Future<void> saveCollections(
    List<Map<String, dynamic>> collections,
  ) async {
    final prefs = await _prefs;
    await prefs.setString(_collectionsKey, jsonEncode(collections));
  }
}
