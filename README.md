# Command Finder - Flutter

A premium Flutter application for discovering keyboard shortcuts across 16 design software tools.

## Features

- 🎨 **Premium UI/UX** - Glass-morphism effects, smooth animations, gradient designs
- 🌍 **15 Languages** - Full internationalization with RTL support
- 🌓 **Dark/Light Mode** - Beautiful theming system
- 💾 **Persistent Storage** - Save favorites and notes
- 📱 **Cross-Platform** - iOS, Android, and Web support
- ⚡ **High Performance** - Cached images, optimized rebuilds

## Supported Software

AutoCAD, Blender, SketchUp, Revit, 3ds Max, Rhino, ArchiCAD, Cinema 4D, Maya, SolidWorks, Fusion 360, Vectorworks, Photoshop, Illustrator, ZBrush, Lumion, InDesign

## Getting Started

### Prerequisites

- Flutter SDK (>=3.10.3)
- Chrome/Edge browser (for web)
- Android Studio/Xcode (for mobile)

### Installation

```bash
# Get dependencies
flutter pub get

# Run on Chrome
flutter run -d chrome

# Run on mobile (with emulator/device connected)
flutter run
```

## Architecture

```
lib/
├── data/         # Program and command data
├── l10n/         # Localization files
├── models/       # Data models
├── providers/    # State management
├── screens/      # Main screens
├── theme/        # Theming system
├── utils/        # Helper functions
├── widgets/      # Reusable widgets
└── main.dart     # App entry point
```

## Dependencies

- **provider** - State management
- **shared_preferences** - Local storage
- **flutter_animate** - Animations
- **glassmorphism** - Glass effects
- **google_fonts** - Typography
- **cached_network_image** - Image caching

## License

Created with ❤️ using Flutter
