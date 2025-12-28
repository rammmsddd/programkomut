import 'package:flutter/material.dart';
import '../../models/program.dart';
import '../../models/command.dart';

final Program mayaProgram = Program(
  id: 'maya',
  name: 'Maya',
  brandColor: const Color(0xFF00B4A0),
  commands: [
    // Tools
    Command(
      id: 'my-select',
      name: 'SELECT',
      shortcut: 'Q',
      breadcrumb: 'Tools > Select',
      description: 'Seçim aracı.',
    ),
    Command(
      id: 'my-lasso',
      name: 'LASSO',
      shortcut: 'Q+Ctrl',
      breadcrumb: 'Tools > Lasso',
      description: 'Lasso seçimi.',
    ),
    Command(
      id: 'my-move',
      name: 'MOVE',
      shortcut: 'W',
      breadcrumb: 'Tools > Move',
      description: 'Taşıma aracı.',
    ),
    Command(
      id: 'my-rotate',
      name: 'ROTATE',
      shortcut: 'E',
      breadcrumb: 'Tools > Rotate',
      description: 'Döndürme aracı.',
    ),
    Command(
      id: 'my-scale',
      name: 'SCALE',
      shortcut: 'R',
      breadcrumb: 'Tools > Scale',
      description: 'Ölçekleme aracı.',
    ),
    Command(
      id: 'my-universal',
      name: 'UNIVERSAL MANIPULATOR',
      shortcut: 'Ctrl+T',
      breadcrumb: 'Tools > Universal',
      description: 'Evrensel manipülatör.',
    ),

    // Edit
    Command(
      id: 'my-undo',
      name: 'UNDO',
      shortcut: 'Ctrl+Z',
      breadcrumb: 'Edit > Undo',
      description: 'Geri alır.',
    ),
    Command(
      id: 'my-redo',
      name: 'REDO',
      shortcut: 'Ctrl+Shift+Z',
      breadcrumb: 'Edit > Redo',
      description: 'Tekrar yapar.',
    ),
    Command(
      id: 'my-duplicate',
      name: 'DUPLICATE',
      shortcut: 'Ctrl+D',
      breadcrumb: 'Edit > Duplicate',
      description: 'Çoğaltır.',
    ),
    Command(
      id: 'my-delete',
      name: 'DELETE',
      shortcut: 'Delete',
      breadcrumb: 'Edit > Delete',
      description: 'Siler.',
    ),
    Command(
      id: 'my-group',
      name: 'GROUP',
      shortcut: 'Ctrl+G',
      breadcrumb: 'Edit > Group',
      description: 'Gruplar.',
    ),
    Command(
      id: 'my-ungroup',
      name: 'UNGROUP',
      shortcut: 'Ctrl+Shift+G',
      breadcrumb: 'Edit > Ungroup',
      description: 'Grubu çözer.',
    ),
    Command(
      id: 'my-parent',
      name: 'PARENT',
      shortcut: 'P',
      breadcrumb: 'Edit > Parent',
      description: 'Ebeveyn yapar.',
    ),

    // Modeling
    Command(
      id: 'my-extrude',
      name: 'EXTRUDE',
      shortcut: 'Ctrl+E',
      breadcrumb: 'Mesh > Extrude',
      description: 'Yüzleri uzatır.',
    ),
    Command(
      id: 'my-bevel',
      name: 'BEVEL',
      shortcut: 'Ctrl+B',
      breadcrumb: 'Mesh > Bevel',
      description: 'Pah kırar.',
    ),
    Command(
      id: 'my-merge',
      name: 'MERGE VERTICES',
      shortcut: 'Shift+Right Click > Merge',
      breadcrumb: 'Mesh > Merge',
      description: 'Vertex birleştirir.',
    ),
    Command(
      id: 'my-insertloop',
      name: 'INSERT EDGE LOOP',
      shortcut: 'Ctrl+R',
      breadcrumb: 'Mesh > Insert Edge Loop',
      description: 'Edge loop ekler.',
    ),
    Command(
      id: 'my-bridge',
      name: 'BRIDGE',
      shortcut: 'Mesh > Bridge',
      breadcrumb: 'Mesh > Bridge',
      description: 'Edge/face birleştirir.',
    ),
    Command(
      id: 'my-separate',
      name: 'SEPARATE',
      shortcut: 'Shift+Ctrl+D',
      breadcrumb: 'Mesh > Separate',
      description: 'Mesh ayırır.',
    ),
    Command(
      id: 'my-combine',
      name: 'COMBINE',
      shortcut: 'Mesh > Combine',
      breadcrumb: 'Mesh > Combine',
      description: 'Meshleri birleştirir.',
    ),

    // Display
    Command(
      id: 'my-wireframe',
      name: 'WIREFRAME',
      shortcut: '4',
      breadcrumb: 'Shading > Wireframe',
      description: 'Tel kafes görünüm.',
    ),
    Command(
      id: 'my-shaded',
      name: 'SHADED',
      shortcut: '5',
      breadcrumb: 'Shading > Shaded',
      description: 'Gölgeli görünüm.',
    ),
    Command(
      id: 'my-textured',
      name: 'TEXTURED',
      shortcut: '6',
      breadcrumb: 'Shading > Textured',
      description: 'Dokulu görünüm.',
    ),
    Command(
      id: 'my-xray',
      name: 'X-RAY',
      shortcut: 'Alt+X',
      breadcrumb: 'Shading > X-Ray',
      description: 'X-Ray modu.',
    ),
    Command(
      id: 'my-isolate',
      name: 'ISOLATE SELECT',
      shortcut: 'Alt+I',
      breadcrumb: 'Show > Isolate',
      description: 'Seçileni izole eder.',
    ),
    Command(
      id: 'my-hide',
      name: 'HIDE',
      shortcut: 'Ctrl+H',
      breadcrumb: 'Display > Hide',
      description: 'Gizler.',
    ),
    Command(
      id: 'my-showall',
      name: 'SHOW ALL',
      shortcut: 'Ctrl+Shift+H',
      breadcrumb: 'Display > Show All',
      description: 'Tümünü gösterir.',
    ),

    // View
    Command(
      id: 'my-framall',
      name: 'FRAME ALL',
      shortcut: 'A',
      breadcrumb: 'View > Frame All',
      description: 'Tümünü çerçeveler.',
    ),
    Command(
      id: 'my-framesel',
      name: 'FRAME SELECTION',
      shortcut: 'F',
      breadcrumb: 'View > Frame Selection',
      description: 'Seçimi çerçeveler.',
    ),
    Command(
      id: 'my-panels',
      name: 'TOGGLE PANELS',
      shortcut: 'Ctrl+M',
      breadcrumb: 'Display > Toggle Panels',
      description: 'Panelleri gizle/göster.',
    ),

    // Animation
    Command(
      id: 'my-setkey',
      name: 'SET KEY',
      shortcut: 'S',
      breadcrumb: 'Animation > Set Key',
      description: 'Keyframe ayarlar.',
    ),
    Command(
      id: 'my-autokey',
      name: 'AUTO KEY',
      shortcut: 'Auto Key button',
      breadcrumb: 'Animation > Auto Key',
      description: 'Otomatik keyframe.',
    ),
    Command(
      id: 'my-play',
      name: 'PLAY ANIMATION',
      shortcut: 'Alt+V',
      breadcrumb: 'Playback > Play',
      description: 'Animasyonu oynatır.',
    ),
    Command(
      id: 'my-nextframe',
      name: 'NEXT FRAME',
      shortcut: '.',
      breadcrumb: 'Playback > Next Frame',
      description: 'Sonraki frame.',
    ),
    Command(
      id: 'my-prevframe',
      name: 'PREVIOUS FRAME',
      shortcut: ',',
      breadcrumb: 'Playback > Previous Frame',
      description: 'Önceki frame.',
    ),

    // Rendering
    Command(
      id: 'my-render',
      name: 'RENDER',
      shortcut: 'Ctrl+R',
      breadcrumb: 'Render > Render',
      description: 'Render başlatır.',
    ),
    Command(
      id: 'my-ipr',
      name: 'IPR RENDER',
      shortcut: 'Render > IPR',
      breadcrumb: 'Render > IPR',
      description: 'Interaktif render.',
    ),
    Command(
      id: 'my-hypershade',
      name: 'HYPERSHADE',
      shortcut: 'Window > Hypershade',
      breadcrumb: 'Window > Hypershade',
      description: 'Shader editörü.',
    ),

    // UV
    Command(
      id: 'my-uveditor',
      name: 'UV EDITOR',
      shortcut: 'UV > UV Editor',
      breadcrumb: 'UV > UV Editor',
      description: 'UV düzenleme penceresi.',
    ),
    Command(
      id: 'my-unwrap',
      name: 'AUTOMATIC UNWRAP',
      shortcut: 'UV > Auto Unwrap',
      breadcrumb: 'UV > Automatic',
      description: 'Otomatik UV açma.',
    ),

    // Component Mode
    Command(
      id: 'my-vertex',
      name: 'VERTEX MODE',
      shortcut: 'Right Click > Vertex',
      breadcrumb: 'Select > Vertex',
      description: 'Vertex seçim modu.',
    ),
    Command(
      id: 'my-edge',
      name: 'EDGE MODE',
      shortcut: 'Right Click > Edge',
      breadcrumb: 'Select > Edge',
      description: 'Edge seçim modu.',
    ),
    Command(
      id: 'my-face',
      name: 'FACE MODE',
      shortcut: 'Right Click > Face',
      breadcrumb: 'Select > Face',
      description: 'Face seçim modu.',
    ),
    Command(
      id: 'my-object',
      name: 'OBJECT MODE',
      shortcut: 'Right Click > Object',
      breadcrumb: 'Select > Object',
      description: 'Object modu.',
    ),
  ],
);
