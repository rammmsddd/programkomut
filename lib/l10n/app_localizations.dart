import 'package:flutter/material.dart';

class Language {
  final String code;
  final String name;
  final String flag;
  final bool isRTL;

  const Language({
    required this.code,
    required this.name,
    required this.flag,
    this.isRTL = false,
  });
}

class AppLocalizations {
  final String languageCode;

  AppLocalizations(this.languageCode);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const List<Language> supportedLanguages = [
    Language(code: 'en', name: 'English', flag: '🇺🇸'),
    Language(code: 'tr', name: 'Türkçe', flag: '🇹🇷'),
    Language(code: 'ar', name: 'العربية', flag: '🇸🇦', isRTL: true),
    Language(code: 'ru', name: 'Русский', flag: '🇷🇺'),
    Language(code: 'zh', name: '简体中文', flag: '🇨🇳'),
    Language(code: 'es', name: 'Español', flag: '🇪🇸'),
    Language(code: 'fr', name: 'Français', flag: '🇫🇷'),
    Language(code: 'de', name: 'Deutsch', flag: '🇩🇪'),
    Language(code: 'ja', name: '日本語', flag: '🇯🇵'),
    Language(code: 'ko', name: '한국어', flag: '🇰🇷'),
    Language(code: 'pt', name: 'Português', flag: '🇧🇷'),
    Language(code: 'it', name: 'Italiano', flag: '🇮🇹'),
    Language(code: 'nl', name: 'Nederlands', flag: '🇳🇱'),
    Language(code: 'hi', name: 'हिन्दी', flag: '🇮🇳'),
    Language(code: 'vi', name: 'Tiếng Việt', flag: '🇻🇳'),
  ];

  static const Map<String, Map<String, String>> _translations = {
    'en': {
      'home': 'Home',
      'saved': 'Saved',
      'title': 'Command Finder',
      'subtitle': 'Find the shortcut you need in seconds.',
      'favPrograms': 'Favorites',
      'allPrograms': 'All Software',
      'myCommands': 'Saved Commands',
      'myCommandsSub': 'Your personal dictionary.',
      'settings': 'Settings',
      'language': 'Language',
      'close': 'Close',
      'noCommands': 'Nothing here!',
      'noCommandsSub': 'Tap stars to add.',
      'searchPlaceholder': 'Search...',
      'shortcutMode': 'Shortcut',
      'nameMode': 'Name',
      'desc': 'Description',
      'notes': 'Notes',
      'addFav': 'Save',
      'remFav': 'Remove',
      'save': 'Save',
      'cancel': 'Cancel',
      'notePlaceholder': 'Add note...',
      'programCommand': 'Command',
      'selectLang': 'Language Selection',
      'darkMode': 'Dark Mode',
      'lightMode': 'Light Mode',
    },
    'tr': {
      'home': 'Ana Sayfa',
      'saved': 'Kayıtlılar',
      'title': 'Komut Bulucu',
      'subtitle': 'İhtiyacın olan kısayolu saniyeler içinde bul.',
      'favPrograms': 'Favoriler',
      'allPrograms': 'Tüm Programlar',
      'myCommands': 'Kayıtlı Komutlarım',
      'myCommandsSub': 'Özel sözlüğün burada.',
      'settings': 'Ayarlar',
      'language': 'Dil',
      'close': 'Kapat',
      'noCommands': 'Henüz bir şey yok!',
      'noCommandsSub': 'Yıldızlara basarak ekle.',
      'searchPlaceholder': 'Ara...',
      'shortcutMode': 'Kısayol',
      'nameMode': 'Ad',
      'desc': 'Açıklama',
      'notes': 'Notlarım',
      'addFav': 'Kaydet',
      'remFav': 'Çıkar',
      'save': 'Kaydet',
      'cancel': 'İptal',
      'notePlaceholder': 'Not yaz...',
      'programCommand': 'Komutu',
      'selectLang': 'Dil Seçimi',
      'darkMode': 'Koyu Mod',
      'lightMode': 'Açık Mod',
    },
    'ar': {
      'home': 'الرئيسية',
      'saved': 'المحفوظات',
      'title': 'مكتشف الأوامر',
      'subtitle': 'ابحث عن الاختصار في ثوانٍ.',
      'favPrograms': 'المفضلة',
      'allPrograms': 'كل البرامج',
      'myCommands': 'أوامري المحفوظة',
      'myCommandsSub': 'قاموسك الشخصي هنا.',
      'settings': 'الإعدادات',
      'language': 'اللغة',
      'close': 'إغلاق',
      'noCommands': 'لا يوجد شيء بعد!',
      'noCommandsSub': 'اضغط على النجوم للإضافة.',
      'searchPlaceholder': 'بحث...',
      'shortcutMode': 'اختصار',
      'nameMode': 'الاسم',
      'desc': 'الوصف',
      'notes': 'ملاحظاتي',
      'addFav': 'حفظ',
      'remFav': 'إزالة',
      'save': 'حفظ',
      'cancel': 'إلغاء',
      'notePlaceholder': 'أضف ملاحظة...',
      'programCommand': 'أمر',
      'selectLang': 'اختر اللغة',
      'darkMode': 'الوضع الداكن',
      'lightMode': 'الوضع الفاتح',
    },
    'ru': {
      'home': 'Главная',
      'saved': 'Сохранено',
      'title': 'Поиск Команд',
      'subtitle': 'Найдите шорткат за секунды.',
      'favPrograms': 'Избранное',
      'allPrograms': 'Все программы',
      'myCommands': 'Мои команды',
      'myCommandsSub': 'Ваш личный словарь.',
      'settings': 'Настройки',
      'language': 'Язык',
      'close': 'Закрыть',
      'noCommands': 'Пусто!',
      'noCommandsSub': 'Нажмите на звезду.',
      'searchPlaceholder': 'Поиск...',
      'shortcutMode': 'Клавиши',
      'nameMode': 'Имя',
      'desc': 'Описание',
      'notes': 'Заметки',
      'addFav': 'Сохр.',
      'remFav': 'Удалить',
      'save': 'ОК',
      'cancel': 'Отмена',
      'notePlaceholder': 'Заметка...',
      'programCommand': 'Команда',
      'selectLang': 'Язык',
      'darkMode': 'Темная тема',
      'lightMode': 'Светлая тема',
    },
    // Add other languages as needed...
  };

  String translate(String key) {
    return _translations[languageCode]?[key] ?? _translations['en']![key]!;
  }
}
