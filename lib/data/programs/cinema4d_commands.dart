import 'package:flutter/material.dart';
import '../../models/program.dart';
import '../../models/command.dart';

final Program cinema4dProgram = Program(
  id: 'cinema4d',
  name: 'Cinema 4D',
  brandColor: const Color(0xFF00ADEF),
  commands: [
    // Basic
    Command(
      id: 'c4d-move',
      name: 'MOVE',
      shortcut: 'E',
      breadcrumb: 'Tools > Move',
      description: 'Taşıma aracı.',
    ),
    Command(
      id: 'c4d-scale',
      name: 'SCALE',
      shortcut: 'T',
      breadcrumb: 'Tools > Scale',
      description: 'Ölçekleme aracı.',
    ),
    Command(
      id: 'c4d-rotate',
      name: 'ROTATE',
      shortcut: 'R',
      breadcrumb: 'Tools > Rotate',
      description: 'Döndürme aracı.',
    ),
    Command(
      id: 'c4d-select',
      name: 'SELECTION',
      shortcut: 'Spacebar',
      breadcrumb: 'Tools > Selection',
      description: 'Seçim aracı.',
    ),

    // Modeling
    Command(
      id: 'c4d-extrude',
      name: 'EXTRUDE',
      shortcut: 'D',
      breadcrumb: 'Mesh > Extrude',
      description: 'Yüz/kenar uzatma.',
    ),
    Command(
      id: 'c4d-knife',
      name: 'KNIFE',
      shortcut: 'K',
      breadcrumb: 'Mesh > Knife',
      description: 'Bıçak aracı.',
    ),
    Command(
      id: 'c4d-subdivide',
      name: 'SUBDIVIDE',
      shortcut: 'U+S',
      breadcrumb: 'Mesh > Subdivide',
      description: 'Alt bölme.',
    ),
    Command(
      id: 'c4d-makeselection',
      name: 'MAKE SEL',
      shortcut: 'U+Q',
      breadcrumb: 'Select > Make Selection',
      description: 'Seçim oluştur.',
    ),

    // Display
    Command(
      id: 'c4d-gouraud',
      name: 'GOURAUD SHADING',
      shortcut: 'N+B',
      breadcrumb: 'Display > Gouraud',
      description: 'Gouraud gölgeleme.',
    ),
    Command(
      id: 'c4d-wireframe',
      name: 'WIREFRAME',
      shortcut: 'N+A',
      breadcrumb: 'Display > Wireframe',
      description: 'Tel kafes görünüm.',
    ),
    Command(
      id: 'c4d-quickshading',
      name: 'QUICK SHADING',
      shortcut: 'N+C',
      breadcrumb: 'Display > Quick Shading',
      description: 'Hızlı gölgeleme.',
    ),

    // Animation
    Command(
      id: 'c4d-setkey',
      name: 'SET KEY',
      shortcut: 'F9',
      breadcrumb: 'Animation > Record Key',
      description: 'Keyframe kaydeder.',
    ),
    Command(
      id: 'c4d-play',
      name: 'PLAY',
      shortcut: 'F8',
      breadcrumb: 'Animation > Play',
      description: 'Animasyonu oynatır.',
    ),
    Command(
      id: 'c4d-timeline',
      name: 'TIMELINE',
      shortcut: 'Shift+F3',
      breadcrumb: 'Window > Timeline',
      description: 'Zaman çizelgesi.',
    ),

    // MoGraph
    Command(
      id: 'c4d-cloner',
      name: 'CLONER',
      shortcut: 'Alt+G',
      breadcrumb: 'MoGraph > Cloner',
      description: 'Klonlayıcı oluşturur.',
    ),
    Command(
      id: 'c4d-randomeffector',
      name: 'RANDOM EFFECTOR',
      shortcut: 'MoGraph > Random',
      breadcrumb: 'MoGraph > Effector > Random',
      description: 'Rastgele efektör.',
    ),

    // Rendering
    Command(
      id: 'c4d-render',
      name: 'RENDER',
      shortcut: 'Ctrl+R',
      breadcrumb: 'Render > Render',
      description: 'Render başlatır.',
    ),
    Command(
      id: 'c4d-rendersettings',
      name: 'RENDER SETTINGS',
      shortcut: 'Ctrl+B',
      breadcrumb: 'Render > Edit Settings',
      description: 'Render ayarları.',
    ),
    Command(
      id: 'c4d-ipr',
      name: 'INTERACTIVE RENDER',
      shortcut: 'Alt+R',
      breadcrumb: 'Render > Interactive',
      description: 'Etkileşimli render.',
    ),

    // View
    Command(
      id: 'c4d-frameall',
      name: 'FRAME ALL',
      shortcut: 'H',
      breadcrumb: 'View > Frame Default',
      description: 'Tümünü çerçeveler.',
    ),
    Command(
      id: 'c4d-framesel',
      name: 'FRAME SELECTION',
      shortcut: 'S',
      breadcrumb: 'View > Frame Selected',
      description: 'Seçimi çerçeveler.',
    ),

    // Files
    Command(
      id: 'c4d-save',
      name: 'SAVE',
      shortcut: 'Ctrl+S',
      breadcrumb: 'File > Save',
      description: 'Kaydeder.',
    ),
    Command(
      id: 'c4d-undo',
      name: 'UNDO',
      shortcut: 'Ctrl+Z',
      breadcrumb: 'Edit > Undo',
      description: 'Geri alır.',
    ),
  ],
);
