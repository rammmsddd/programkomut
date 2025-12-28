import 'package:flutter/material.dart';
import '../../models/program.dart';
import '../../models/command.dart';

final Program blenderProgram = Program(
  id: 'blender',
  name: 'Blender',
  brandColor: const Color(0xFFE87D0D),
  commands: [
    // ========================================
    // DOSYA İŞLEMLERİ
    // ========================================
    Command(
      id: 'bl-new',
      name: 'NEW FILE',
      shortcut: 'Ctrl+N',
      breadcrumb: 'File > New',
      description: 'Yeni dosya oluşturur.',
    ),
    Command(
      id: 'bl-open',
      name: 'OPEN',
      shortcut: 'Ctrl+O',
      breadcrumb: 'File > Open',
      description: 'Dosya açar.',
    ),
    Command(
      id: 'bl-save',
      name: 'SAVE',
      shortcut: 'Ctrl+S',
      breadcrumb: 'File > Save',
      description: 'Dosyayı kaydeder.',
    ),
    Command(
      id: 'bl-saveas',
      name: 'SAVE AS',
      shortcut: 'Shift+Ctrl+S',
      breadcrumb: 'File > Save As',
      description: 'Farklı kaydet.',
    ),
    Command(
      id: 'bl-quit',
      name: 'QUIT',
      shortcut: 'Ctrl+Q',
      breadcrumb: 'File > Quit',
      description: 'Blender\'ı kapatır.',
    ),

    // ========================================
    // GENEL DÜZENLEME
    // ========================================
    Command(
      id: 'bl-undo',
      name: 'UNDO',
      shortcut: 'Ctrl+Z',
      breadcrumb: 'Edit > Undo',
      description: 'Son işlemi geri alır.',
    ),
    Command(
      id: 'bl-redo',
      name: 'REDO',
      shortcut: 'Ctrl+Y',
      breadcrumb: 'Edit > Redo',
      description: 'İşlemi tekrar eder.',
    ),
    Command(
      id: 'bl-repeat',
      name: 'REPEAT LAST',
      shortcut: 'Shift+R',
      breadcrumb: 'Edit > Repeat Last',
      description: 'Son işlemi tekrarlar.',
    ),
    Command(
      id: 'bl-search',
      name: 'SEARCH MENU',
      shortcut: 'F3',
      breadcrumb: 'Edit > Menu Search',
      description: 'Menü arama penceresini açar.',
    ),
    Command(
      id: 'bl-rename',
      name: 'RENAME',
      shortcut: 'F2',
      breadcrumb: 'Edit > Rename',
      description: 'Aktif öğeyi yeniden adlandırır.',
    ),

    // ========================================
    // TRANSFORM (DÖNÜŞTÜRME)
    // ========================================
    Command(
      id: 'bl-move',
      name: 'GRAB/MOVE',
      shortcut: 'G',
      breadcrumb: 'Transform > Move',
      description: 'Seçili nesneleri taşır.',
    ),
    Command(
      id: 'bl-rotate',
      name: 'ROTATE',
      shortcut: 'R',
      breadcrumb: 'Transform > Rotate',
      description: 'Seçili nesneleri döndürür.',
    ),
    Command(
      id: 'bl-scale',
      name: 'SCALE',
      shortcut: 'S',
      breadcrumb: 'Transform > Scale',
      description: 'Seçili nesneleri ölçeklendirir.',
    ),
    Command(
      id: 'bl-move-x',
      name: 'MOVE X AXIS',
      shortcut: 'G+X',
      breadcrumb: 'Transform > Move > X',
      description: 'X ekseninde taşır.',
    ),
    Command(
      id: 'bl-move-y',
      name: 'MOVE Y AXIS',
      shortcut: 'G+Y',
      breadcrumb: 'Transform > Move > Y',
      description: 'Y ekseninde taşır.',
    ),
    Command(
      id: 'bl-move-z',
      name: 'MOVE Z AXIS',
      shortcut: 'G+Z',
      breadcrumb: 'Transform > Move > Z',
      description: 'Z ekseninde taşır.',
    ),
    Command(
      id: 'bl-scale-x',
      name: 'SCALE X AXIS',
      shortcut: 'S+X',
      breadcrumb: 'Transform > Scale > X',
      description: 'X ekseninde ölçekler.',
    ),
    Command(
      id: 'bl-scale-y',
      name: 'SCALE Y AXIS',
      shortcut: 'S+Y',
      breadcrumb: 'Transform > Scale > Y',
      description: 'Y ekseninde ölçekler.',
    ),
    Command(
      id: 'bl-scale-z',
      name: 'SCALE Z AXIS',
      shortcut: 'S+Z',
      breadcrumb: 'Transform > Scale > Z',
      description: 'Z ekseninde ölçeкler.',
    ),

    // ========================================
    // OBJECT MODE
    // ========================================
    Command(
      id: 'bl-add',
      name: 'ADD OBJECT',
      shortcut: 'Shift+A',
      breadcrumb: 'Add',
      description: 'Obje ekleme menüsünü açar.',
    ),
    Command(
      id: 'bl-delete',
      name: 'DELETE',
      shortcut: 'X',
      breadcrumb: 'Object > Delete',
      description: 'Seçili nesneleri siler.',
    ),
    Command(
      id: 'bl-duplicate',
      name: 'DUPLICATE',
      shortcut: 'Shift+D',
      breadcrumb: 'Object > Duplicate',
      description: 'Seçili nesneleri çoğaltır.',
    ),
    Command(
      id: 'bl-join',
      name: 'JOIN OBJECTS',
      shortcut: 'Ctrl+J',
      breadcrumb: 'Object > Join',
      description: 'Seçili objeleri birleştirir.',
    ),
    Command(
      id: 'bl-separate',
      name: 'SEPARATE',
      shortcut: 'P',
      breadcrumb: 'Mesh > Separate',
      description: 'Mesh parçalarını ayırır.',
    ),
    Command(
      id: 'bl-parent',
      name: 'SET PARENT',
      shortcut: 'Ctrl+P',
      breadcrumb: 'Object > Parent',
      description: 'Ebeveyn-çocuk ilişkisi kurar.',
    ),
    Command(
      id: 'bl-clearparent',
      name: 'CLEAR PARENT',
      shortcut: 'Alt+P',
      breadcrumb: 'Object > Parent > Clear',
      description: 'Ebeveyn ilişkisini kaldırır.',
    ),
    Command(
      id: 'bl-origin',
      name: 'SET ORIGIN',
      shortcut: 'Ctrl+Alt+Shift+C',
      breadcrumb: 'Object > Set Origin',
      description: 'Merkez noktası ayarlar.',
    ),

    // ========================================
    // SEÇİM (SELECTION)
    // ========================================
    Command(
      id: 'bl-selectall',
      name: 'SELECT ALL',
      shortcut: 'A',
      breadcrumb: 'Select > All',
      description: 'Tümünü seçer.',
    ),
    Command(
      id: 'bl-deselectall',
      name: 'DESELECT ALL',
      shortcut: 'Alt+A',
      breadcrumb: 'Select > None',
      description: 'Tüm seçimleri kaldırır.',
    ),
    Command(
      id: 'bl-invertselect',
      name: 'INVERT SELECTION',
      shortcut: 'Ctrl+I',
      breadcrumb: 'Select > Invert',
      description: 'Seçimi tersine çevirir.',
    ),
    Command(
      id: 'bl-boxselect',
      name: 'BOX SELECT',
      shortcut: 'B',
      breadcrumb: 'Select > Box Select',
      description: 'Kutu ile seçim yapar.',
    ),
    Command(
      id: 'bl-circleselect',
      name: 'CIRCLE SELECT',
      shortcut: 'C',
      breadcrumb: 'Select > Circle Select',
      description: 'Daire ile seçim yapar.',
    ),
    Command(
      id: 'bl-selectlinked',
      name: 'SELECT LINKED',
      shortcut: 'L',
      breadcrumb: 'Select > Linked',
      description: 'Bağlı vertexleri seçer.',
    ),
    Command(
      id: 'bl-selectmore',
      name: 'SELECT MORE',
      shortcut: 'Ctrl+Numpad +',
      breadcrumb: 'Select > More',
      description: 'Seçimi genişletir.',
    ),
    Command(
      id: 'bl-selectless',
      name: 'SELECT LESS',
      shortcut: 'Ctrl+Numpad -',
      breadcrumb: 'Select > Less',
      description: 'Seçimi daraltır.',
    ),

    // ========================================
    // EDIT MODE
    // ========================================
    Command(
      id: 'bl-tabmode',
      name: 'EDIT MODE TOGGLE',
      shortcut: 'Tab',
      breadcrumb: 'Mode > Edit Mode',
      description: 'Object/Edit mode arasında geçiş.',
    ),
    Command(
      id: 'bl-extrude',
      name: 'EXTRUDE',
      shortcut: 'E',
      breadcrumb: 'Mesh > Extrude',
      description: 'Seçili yüzleri/kenarları uzatır.',
    ),
    Command(
      id: 'bl-inset',
      name: 'INSET FACES',
      shortcut: 'I',
      breadcrumb: 'Mesh > Inset Faces',
      description: 'Yüzleri iç tarafa çeker.',
    ),
    Command(
      id: 'bl-bevel',
      name: 'BEVEL',
      shortcut: 'Ctrl+B',
      breadcrumb: 'Mesh > Bevel',
      description: 'Kenarları yuvarlar (pah kırar).',
    ),
    Command(
      id: 'bl-loopcut',
      name: 'LOOP CUT',
      shortcut: 'Ctrl+R',
      breadcrumb: 'Mesh > Loop Cut',
      description: 'Edge loop ekler.',
    ),
    Command(
      id: 'bl-knife',
      name: 'KNIFE TOOL',
      shortcut: 'K',
      breadcrumb: 'Mesh > Knife',
      description: 'Bıçak aracı ile kesim.',
    ),
    Command(
      id: 'bl-fill',
      name: 'FILL',
      shortcut: 'F',
      breadcrumb: 'Mesh > Fill',
      description: 'Seçili edge/vertex arasında yüz oluşturur.',
    ),
    Command(
      id: 'bl-subdivide',
      name: 'SUBDIVIDE',
      shortcut: 'Right Click > Subdivide',
      breadcrumb: 'Mesh > Subdivide',
      description: 'Seçili geometriyi böler.',
    ),
    Command(
      id: 'bl-merge',
      name: 'MERGE',
      shortcut: 'M',
      breadcrumb: 'Mesh > Merge',
      description: 'Vertexleri birleştirir.',
    ),
    Command(
      id: 'bl-rip',
      name: 'RIP',
      shortcut: 'V',
      breadcrumb: 'Mesh > Rip',
      description: 'Mesh\'i koparır.',
    ),
    Command(
      id: 'bl-spin',
      name: 'SPIN',
      shortcut: 'Alt+R',
      breadcrumb: 'Mesh > Spin',
      description: 'Döndürerek geometri oluşturur.',
    ),
    Command(
      id: 'bl-unwrap',
      name: 'UNWRAP',
      shortcut: 'U',
      breadcrumb: 'UV > Unwrap',
      description: 'UV unwrap menüsünü açar.',
    ),
    Command(
      id: 'bl-seam',
      name: 'MARK SEAM',
      shortcut: 'Ctrl+E > Mark Seam',
      breadcrumb: 'UV > Mark Seam',
      description: 'UV seam işaretler.',
    ),

    // ========================================
    // VİEW NAVIGATION (GÖRÜNÜM)
    // ========================================
    Command(
      id: 'bl-rotateview',
      name: 'ROTATE VIEW',
      shortcut: 'MMB Drag',
      breadcrumb: 'View > Navigation',
      description: '3D görünümü döndürür.',
    ),
    Command(
      id: 'bl-panview',
      name: 'PAN VIEW',
      shortcut: 'Shift+MMB',
      breadcrumb: 'View > Pan',
      description: 'Görünümü kaydırır.',
    ),
    Command(
      id: 'bl-zoomview',
      name: 'ZOOM VIEW',
      shortcut: 'Scroll/Ctrl+MMB',
      breadcrumb: 'View > Zoom',
      description: 'Yakınlaştır/uzaklaştır.',
    ),
    Command(
      id: 'bl-cameraview',
      name: 'CAMERA VIEW',
      shortcut: 'Numpad 0',
      breadcrumb: 'View > Camera',
      description: 'Kamera görünümüne geçer.',
    ),
    Command(
      id: 'bl-frontview',
      name: 'FRONT VIEW',
      shortcut: 'Numpad 1',
      breadcrumb: 'View > Front',
      description: 'Ön görünüm.',
    ),
    Command(
      id: 'bl-rightview',
      name: 'RIGHT VIEW',
      shortcut: 'Numpad 3',
      breadcrumb: 'View > Right',
      description: 'Sağ görünüm.',
    ),
    Command(
      id: 'bl-topview',
      name: 'TOP VIEW',
      shortcut: 'Numpad 7',
      breadcrumb: 'View > Top',
      description: 'Üst görünüm.',
    ),
    Command(
      id: 'bl-bottomview',
      name: 'BOTTOM VIEW',
      shortcut: 'Ctrl+Numpad 7',
      breadcrumb: 'View > Bottom',
      description: 'Alt görünüm.',
    ),
    Command(
      id: 'bl-orthographic',
      name: 'ORTHO/PERSPECTIVE',
      shortcut: 'Numpad 5',
      breadcrumb: 'View > Perspective',
      description: 'Perspektif/ortografik geçişi.',
    ),
    Command(
      id: 'bl-frameselected',
      name: 'FRAME SELECTED',
      shortcut: 'Numpad .',
      breadcrumb: 'View > Frame Selected',
      description: 'Seçimi ortalar.',
    ),
    Command(
      id: 'bl-frameall',
      name: 'FRAME ALL',
      shortcut: 'Home',
      breadcrumb: 'View > Frame All',
      description: 'Tüm objeleri gösterir.',
    ),

    // ========================================
    // GÖRÜNÜRLÜKve DISPLAY
    // ========================================
    Command(
      id: 'bl-hide',
      name: 'HIDE',
      shortcut: 'H',
      breadcrumb: 'Object > Show/Hide > Hide',
      description: 'Seçili objeleri gizler.',
    ),
    Command(
      id: 'bl-unhideall',
      name: 'UNHIDE ALL',
      shortcut: 'Alt+H',
      breadcrumb: 'Object > Show/Hide > Show',
      description: 'Tüm gizli objeleri gösterir.',
    ),
    Command(
      id: 'bl-isolate',
      name: 'ISOLATE',
      shortcut: 'Numpad /',
      breadcrumb: 'View > Local View',
      description: 'Seçileni izole eder /lokal görünüm.',
    ),
    Command(
      id: 'bl-xray',
      name: 'X-RAY MODE',
      shortcut: 'Alt+Z',
      breadcrumb: 'Shading > X-Ray',
      description: 'X-Ray görünüm modu.',
    ),
    Command(
      id: 'bl-wireframe',
      name: 'WIREFRAME',
      shortcut: 'Z > Wireframe',
      breadcrumb: 'Shading > Wireframe',
      description: 'Wireframe görünüm.',
    ),
    Command(
      id: 'bl-solid',
      name: 'SOLID SHADING',
      shortcut: 'Z > Solid',
      breadcrumb: 'Shading > Solid',
      description: 'Katı renk görünüm.',
    ),
    Command(
      id: 'bl-material',
      name: 'MATERIAL PREVIEW',
      shortcut: 'Z > Material Preview',
      breadcrumb: 'Shading > Material Preview',
      description: 'Materyal önizleme.',
    ),
    Command(
      id: 'bl-rendered',
      name: 'RENDERED',
      shortcut: 'Z > Rendered',
      breadcrumb: 'Shading > Rendered',
      description: 'Renderli önizleme.',
    ),

    // ========================================
    // MODİFİERS
    // ========================================
    Command(
      id: 'bl-subdsurf',
      name: 'SUBDIVISION SURFACE',
      shortcut: 'Ctrl+1/2/3',
      breadcrumb: 'Modifier > Subdivision',
      description: 'Subdivision surface ekler (1-3 level).',
    ),
    Command(
      id: 'bl-mirror',
      name: 'MIRROR MODIFIER',
      shortcut: 'Right Click > Mirror',
      breadcrumb: 'Modifier > Mirror',
      description: 'Mirror modifier ekler.',
    ),
    Command(
      id: 'bl-array',
      name: 'ARRAY MODIFIER',
      shortcut: 'Right Click > Array',
      breadcrumb: 'Modifier > Array',
      description: 'Array modifier ekler.',
    ),
    Command(
      id: 'bl-applymodifier',
      name: 'APPLY MODIFIER',
      shortcut: 'Ctrl+A',
      breadcrumb: 'Modifier > Apply',
      description: 'Modifierleri uygular.',
    ),

    // ========================================
    // SHADING & MATERIALS
    // ========================================
    Command(
      id: 'bl-shadesmooth',
      name: 'SHADE SMOOTH',
      shortcut: 'Right Click > Shade Smooth',
      breadcrumb: 'Object > Shade Smooth',
      description: 'Pürüzsüz gölgeleme.',
    ),
    Command(
      id: 'bl-shadeflat',
      name: 'SHADE FLAT',
      shortcut: 'Right Click > Shade Flat',
      breadcrumb: 'Object > Shade Flat',
      description: 'Düz gölgeleme.',
    ),
    Command(
      id: 'bl-newmaterial',
      name: 'NEW MATERIAL',
      shortcut: 'Material Properties > +New',
      breadcrumb: 'Material > New',
      description: 'Yeni materyal oluşturur.',
    ),

    // ========================================
    // ANİMASYON
    // ========================================
    Command(
      id: 'bl-insertkey',
      name: 'INSERT KEYFRAME',
      shortcut: 'I',
      breadcrumb: 'Animation > Insert Keyframe',
      description: 'Keyframe ekler.',
    ),
    Command(
      id: 'bl-deletekey',
      name: 'DELETE KEYFRAME',
      shortcut: 'Alt+I',
      breadcrumb: 'Animation > Delete Keyframe',
      description: 'Keyframe siler.',
    ),
    Command(
      id: 'bl-play',
      name: 'PLAY ANIMATION',
      shortcut: 'Spacebar',
      breadcrumb: 'Animation > Play',
      description: 'Animasyonu oynatır.',
    ),
    Command(
      id: 'bl-firstframe',
      name: 'FIRST FRAME',
      shortcut: 'Shift+Left Arrow',
      breadcrumb: 'Animation > Jump to Start',
      description: 'İlk frame\'e gider.',
    ),
    Command(
      id: 'bl-lastframe',
      name: 'LAST FRAME',
      shortcut: 'Shift+Right Arrow',
      breadcrumb: 'Animation > Jump to End',
      description: 'Son frame\'e gider.',
    ),
    Command(
      id: 'bl-nextframe',
      name: 'NEXT FRAME',
      shortcut: 'Right Arrow',
      breadcrumb: 'Animation > Next Frame',
      description: 'Sonraki frame.',
    ),
    Command(
      id: 'bl-prevframe',
      name: 'PREVIOUS FRAME',
      shortcut: 'Left Arrow',
      breadcrumb: 'Animation > Previous Frame',
      description: 'Önceki frame.',
    ),

    // ========================================
    // RENDERING
    // ========================================
    Command(
      id: 'bl-render',
      name: 'RENDER IMAGE',
      shortcut: 'F12',
      breadcrumb: 'Render > Render Image',
      description: 'Görüntüyü renderlar.',
    ),
    Command(
      id: 'bl-renderanim',
      name: 'RENDER ANIMATION',
      shortcut: 'Ctrl+F12',
      breadcrumb: 'Render > Render Animation',
      description: 'Animasyonu renderlar.',
    ),
    Command(
      id: 'bl-viewrender',
      name: 'VIEW RENDER',
      shortcut: 'F11',
      breadcrumb: 'Render > View Render',
      description: 'Render sonucunu görüntüler.',
    ),

    // ========================================
    // PROPORTIONAL EDITING
    // ========================================
    Command(
      id: 'bl-proportional',
      name: 'PROPORTIONAL EDITING',
      shortcut: 'O',
      breadcrumb: 'Mesh > Proportional Editing',
      description: 'Orantılı düzenlemeyi açar/kapatır.',
    ),
    Command(
      id: 'bl-propconnected',
      name: 'CONNECTED ONLY',
      shortcut: 'Alt+O',
      breadcrumb: 'Mesh > Connected Only',
      description: 'Sadece bağlı vertexlere etki eder.',
    ),

    // ========================================
    // SNAP & ALIGN
    // ========================================
    Command(
      id: 'bl-snap',
      name: 'SNAP',
      shortcut: 'Shift+S',
      breadcrumb: 'Mesh > Snap',
      description: 'Snap menüsünü açar.',
    ),
    Command(
      id: 'bl-cursortocenter',
      name: 'CURSOR TO WORLD ORIGIN',
      shortcut: 'Shift+S > Cursor to World',
      breadcrumb: 'Mesh > Snap > Cursor to World',
      description: '3D imleci merkeze taşır.',
    ),
    Command(
      id: 'bl-cursortoselected',
      name: 'CURSOR TO SELECTED',
      shortcut: 'Shift+S > Cursor to Selected',
      breadcrumb: 'Mesh > Snap > Cursor to Selected',
      description: '3D imleci seçime taşır.',
    ),

    // ========================================
    // VERTEX GROUPS & WEIGHT PAINT
    // ========================================
    Command(
      id: 'bl-vertexgroup',
      name: 'ASSIGN VERTEX GROUP',
      shortcut: 'Ctrl+G',
      breadcrumb: 'Mesh > Vertex Groups',
      description: 'Vertex group atar.',
    ),

    // ========================================
    // OUTLINER & COLLECTIONS
    // ========================================
    Command(
      id: 'bl-newcollection',
      name: 'NEW COLLECTION',
      shortcut: 'M',
      breadcrumb: 'Object > Move to Collection',
      description: 'Yeni collection oluşturur.',
    ),

    // ========================================
    // PRERENCESences & WORKSPACE
    // ========================================
    Command(
      id: 'bl-preferences',
      name: 'PREFERENCES',
      shortcut: 'Edit > Preferences',
      breadcrumb: 'Edit > Preferences',
      description: 'Ayarlar penceresini açar.',
    ),
    Command(
      id: 'bl-screenshot',
      name: 'SAVE SCREENSHOT',
      shortcut: 'Ctrl+F3',
      breadcrumb: 'Window > Save Screenshot',
      description: 'Ekran görüntüsü kaydeder.',
    ),
  ],
);
