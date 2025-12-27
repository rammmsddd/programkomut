import '../models/program.dart';
import '../models/command.dart';

final List<Program> programs = [
  Program(
    id: 'autocad',
    name: 'AutoCAD',
    imageUrl: 'https://cdn.worldvectorlogo.com/logos/autodesk-autocad-2021.svg',
    commands: [
      // 1. Çizim Komutları (DRAW)
      Command(
        id: 'ac-line',
        name: 'LINE',
        shortcut: 'L',
        breadcrumb: 'Home > Draw > Line',
        description: 'Başlangıç ve bitiş noktası belli düz çizgi çizer.',
      ),
      Command(
        id: 'ac-pline',
        name: 'POLYLINE',
        shortcut: 'PL',
        breadcrumb: 'Home > Draw > Polyline',
        description: 'Birleşik, tek parça halinde çizgiler çizer.',
      ),
      Command(
        id: 'ac-circle',
        name: 'CIRCLE',
        shortcut: 'C',
        breadcrumb: 'Home > Draw > Circle',
        description: 'Daire çizer.',
      ),
      Command(
        id: 'ac-rect',
        name: 'RECTANGLE',
        shortcut: 'REC',
        breadcrumb: 'Home > Draw > Rectangle',
        description: 'Dikdörtgen çizer.',
      ),
      Command(
        id: 'ac-hatch',
        name: 'HATCH',
        shortcut: 'H',
        breadcrumb: 'Home > Draw > Hatch',
        description: 'Kapalı alanları tarar veya boyar.',
      ),
      Command(
        id: 'ac-arc',
        name: 'ARC',
        shortcut: 'A',
        breadcrumb: 'Home > Draw > Arc',
        description: 'Yay çizer (3 nokta ile).',
      ),
      Command(
        id: 'ac-polygon',
        name: 'POLYGON',
        shortcut: 'POL',
        breadcrumb: 'Home > Draw > Polygon',
        description: 'Çokgen çizer (Beşgen, Altıgen vb.).',
      ),

      // 2. Düzenleme Komutları (MODIFY)
      Command(
        id: 'ac-move',
        name: 'MOVE',
        shortcut: 'M',
        breadcrumb: 'Home > Modify > Move',
        description: 'Objeyi taşır.',
      ),
      Command(
        id: 'ac-copy',
        name: 'COPY',
        shortcut: 'CO',
        breadcrumb: 'Home > Modify > Copy',
        description: 'Objeyi kopyalar.',
      ),
      Command(
        id: 'ac-rotate',
        name: 'ROTATE',
        shortcut: 'RO',
        breadcrumb: 'Home > Modify > Rotate',
        description: 'Objeyi çevirir/döndürür.',
      ),
      Command(
        id: 'ac-mirror',
        name: 'MIRROR',
        shortcut: 'MI',
        breadcrumb: 'Home > Modify > Mirror',
        description: 'Objeyi aynalar (Simetrisini alır).',
      ),
      Command(
        id: 'ac-trim',
        name: 'TRIM',
        shortcut: 'TR',
        breadcrumb: 'Home > Modify > Trim',
        description: 'Kesişen çizgilerin fazlasını budar.',
      ),
      Command(
        id: 'ac-align',
        name: 'ALIGN',
        shortcut: 'AL',
        breadcrumb: 'Modify > Align',
        description: 'Bir objeyi başka bir objeye hizalar ve oturtur.',
      ),
      Command(
        id: 'ac-stretch',
        name: 'STRETCH',
        shortcut: 'S',
        breadcrumb: 'Home > Modify > Stretch',
        description: 'Objeyi sündürür/uzatır.',
      ),
      Command(
        id: 'ac-offset',
        name: 'OFFSET',
        shortcut: 'O',
        breadcrumb: 'Home > Modify > Offset',
        description: 'Paralel kopya oluşturur.',
      ),

      // 3. 3D Modelleme
      Command(
        id: 'ac-3d-ext',
        name: 'EXTRUDE',
        shortcut: 'EXT',
        breadcrumb: '3D > Solid > Extrude',
        description: '2D çizimi uzatarak 3D katı modele çevirir.',
      ),
      Command(
        id: 'ac-3d-pp',
        name: 'PRESSPULL',
        shortcut: 'PRES',
        breadcrumb: '3D > Modeling',
        description: 'Kapalı alanları tıklayıp çekiştirerek 3D yapar.',
      ),
      Command(
        id: 'ac-3d-uni',
        name: 'UNION',
        shortcut: 'UNI',
        breadcrumb: '3D > Boolean',
        description: 'İki ayrı 3D katı objeyi tek parça yapar.',
      ),
      Command(
        id: 'ac-3d-sub',
        name: 'SUBTRACT',
        shortcut: 'SU',
        breadcrumb: '3D > Boolean',
        description: 'Bir 3D objeden diğerini çıkarır.',
      ),

      // 4. Sistem Değişkenleri
      Command(
        id: 'ac-sys-fd',
        name: 'FILEDIA',
        shortcut: '1/0',
        breadcrumb: 'System > Variables',
        description: 'Dosya açarken pencere gelmiyorsa 1 yap.',
      ),
      Command(
        id: 'ac-sys-mt',
        name: 'MIRRTEXT',
        shortcut: '0/1',
        breadcrumb: 'System > Variables',
        description: 'Aynalayınca yazı ters dönüyorsa 0 yap.',
      ),
    ],
  ),
  Program(
    id: 'sketchup',
    name: 'SketchUp',
    imageUrl: 'https://cdn.worldvectorlogo.com/logos/sketchup.svg',
    commands: [
      Command(
        id: 'sk-push',
        name: 'PUSH/PULL',
        shortcut: 'P',
        breadcrumb: 'Toolbar > Push/Pull',
        description: 'Yüzeyleri iterek veya çekerek 3D hacim oluşturur.',
      ),
      Command(
        id: 'sk-line',
        name: 'LINE',
        shortcut: 'L',
        breadcrumb: 'Toolbar > Line',
        description: 'İki nokta arasında doğru parçası çizer.',
      ),
      Command(
        id: 'sk-move',
        name: 'MOVE',
        shortcut: 'M',
        breadcrumb: 'Toolbar > Move',
        description: 'Objeleri taşır veya kopyalar.',
      ),
      Command(
        id: 'sk-rotate',
        name: 'ROTATE',
        shortcut: 'Q',
        breadcrumb: 'Toolbar > Rotate',
        description: 'Objeleri döndürür.',
      ),
    ],
  ),
  Program(
    id: 'blender',
    name: 'Blender',
    imageUrl: 'https://cdn.worldvectorlogo.com/logos/blender-2.svg',
    commands: [
      Command(
        id: 'bl-extrude',
        name: 'EXTRUDE',
        shortcut: 'E',
        breadcrumb: 'Edit Mode > Edge/Face > Extrude',
        description:
            'Seçili yüzeyi veya kenarı dışarıya veya içeriye doğru uzatır.',
      ),
      Command(
        id: 'bl-move',
        name: 'MOVE',
        shortcut: 'G',
        breadcrumb: 'Transform > Grab',
        description: 'Seçili nesneleri serbestçe taşır.',
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
    ],
  ),
  Program(
    id: 'revit',
    name: 'Revit',
    imageUrl: 'https://cdn.worldvectorlogo.com/logos/autodesk-revit.svg',
    commands: [
      Command(
        id: 'rv-wall',
        name: 'WALL',
        shortcut: 'WA',
        breadcrumb: 'Architecture > Wall',
        description: 'Mimari duvar elemanları oluşturur.',
      ),
      Command(
        id: 'rv-door',
        name: 'DOOR',
        shortcut: 'DR',
        breadcrumb: 'Architecture > Door',
        description: 'Duvarlara kapı yerleştirir.',
      ),
      Command(
        id: 'rv-window',
        name: 'WINDOW',
        shortcut: 'WN',
        breadcrumb: 'Architecture > Window',
        description: 'Duvarlara pencere yerleştirir.',
      ),
    ],
  ),
  Program(
    id: '3dsmax',
    name: '3ds Max',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Autodesk_3ds_Max_logo.svg/1200px-Autodesk_3ds_Max_logo.svg.png',
    commands: [
      Command(
        id: '3d-move',
        name: 'MOVE',
        shortcut: 'W',
        breadcrumb: 'Toolbar > Move',
        description: 'Nesneleri X, Y veya Z eksenlerinde taşır.',
      ),
      Command(
        id: '3d-rotate',
        name: 'ROTATE',
        shortcut: 'E',
        breadcrumb: 'Toolbar > Rotate',
        description: 'Nesneleri döndürür.',
      ),
      Command(
        id: '3d-scale',
        name: 'SCALE',
        shortcut: 'R',
        breadcrumb: 'Toolbar > Scale',
        description: 'Nesneleri ölçeklendirir.',
      ),
    ],
  ),
  Program(
    id: 'rhino',
    name: 'Rhinoceros 3D',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/en/thumb/5/52/Rhinoceros_3D_Logo.png/250px-Rhinoceros_3D_Logo.png',
    commands: [
      Command(
        id: 'rh-poly',
        name: 'POLYLINE',
        shortcut: 'PLine',
        breadcrumb: 'Curve > Polyline',
        description: 'Ardışık doğru parçalarından oluşan çizgi grubu.',
      ),
      Command(
        id: 'rh-ext',
        name: 'EXTRUDE CURVE',
        shortcut: 'ExtrudeCrv',
        breadcrumb: 'Surface > Extrude',
        description: 'Eğrileri katı veya yüzeye çevirir.',
      ),
    ],
  ),
  Program(
    id: 'archicad',
    name: 'ArchiCAD',
    imageUrl: 'https://cdn.worldvectorlogo.com/logos/archicad-2.svg',
    commands: [
      Command(
        id: 'ar-wall',
        name: 'WALL',
        shortcut: 'W',
        breadcrumb: 'Design > Wall',
        description: 'Duvar aracı.',
      ),
      Command(
        id: 'ar-slab',
        name: 'SLAB',
        shortcut: 'S',
        breadcrumb: 'Design > Slab',
        description: 'Döşeme aracı.',
      ),
    ],
  ),
  Program(
    id: 'cinema4d',
    name: 'Cinema 4D',
    imageUrl: 'https://cdn.worldvectorlogo.com/logos/cinema-4d-1.svg',
    commands: [
      Command(
        id: 'c4d-move',
        name: 'MOVE',
        shortcut: 'E',
        breadcrumb: 'Tools > Move',
        description: 'Nesneleri taşır.',
      ),
      Command(
        id: 'c4d-scale',
        name: 'SCALE',
        shortcut: 'T',
        breadcrumb: 'Tools > Scale',
        description: 'Nesneleri ölçeklendirir.',
      ),
    ],
  ),
  Program(
    id: 'maya',
    name: 'Autodesk Maya',
    imageUrl: 'https://cdn.worldvectorlogo.com/logos/autodesk-maya-1.svg',
    commands: [
      Command(
        id: 'my-move',
        name: 'MOVE',
        shortcut: 'W',
        breadcrumb: 'Tools > Move',
        description: 'Seçili objeyi taşır.',
      ),
      Command(
        id: 'my-rotate',
        name: 'ROTATE',
        shortcut: 'E',
        breadcrumb: 'Tools > Rotate',
        description: 'Seçili objeyi döndürür.',
      ),
    ],
  ),
  Program(
    id: 'solidworks',
    name: 'SolidWorks',
    imageUrl: 'https://cdn.worldvectorlogo.com/logos/solidworks.svg',
    commands: [
      Command(
        id: 'sw-sketch',
        name: 'SKETCH',
        shortcut: 'S',
        breadcrumb: 'Features > Sketch',
        description: 'Yeni bir çizim taslağı açar.',
      ),
      Command(
        id: 'sw-extrude',
        name: 'EXTRUDED BOSS',
        shortcut: 'E',
        breadcrumb: 'Features > Extrude',
        description: 'Çizimi katıya çevirir.',
      ),
    ],
  ),
  Program(
    id: 'fusion360',
    name: 'Fusion 360',
    imageUrl: 'https://cdn.worldvectorlogo.com/logos/autodesk-fusion-360.svg',
    commands: [
      Command(
        id: 'f3-ext',
        name: 'EXTRUDE',
        shortcut: 'E',
        breadcrumb: 'Create > Extrude',
        description: 'Profil yüzeylerini uzatarak katı oluşturur.',
      ),
      Command(
        id: 'f3-fillet',
        name: 'FILLET',
        shortcut: 'F',
        breadcrumb: 'Modify > Fillet',
        description: 'Kenarları yuvarlatır.',
      ),
    ],
  ),
  Program(
    id: 'vectorworks',
    name: 'Vectorworks',
    imageUrl: 'https://cdn.worldvectorlogo.com/logos/vectorworks.svg',
    commands: [
      Command(
        id: 'vw-line',
        name: 'LINE',
        shortcut: 'L',
        breadcrumb: 'Toolbox > Line',
        description: 'Düz çizgi çizer.',
      ),
      Command(
        id: 'vw-rect',
        name: 'RECTANGLE',
        shortcut: '4',
        breadcrumb: 'Toolbox > Rectangle',
        description: 'Dikdörtgen aracı.',
      ),
    ],
  ),
  Program(
    id: 'photoshop',
    name: 'Adobe Photoshop',
    imageUrl: 'https://cdn.worldvectorlogo.com/logos/adobe-photoshop-2.svg',
    commands: [
      Command(
        id: 'ps-brush',
        name: 'BRUSH',
        shortcut: 'B',
        breadcrumb: 'Toolbar > Brush',
        description: 'Fırça aracı.',
      ),
      Command(
        id: 'ps-move',
        name: 'MOVE',
        shortcut: 'V',
        breadcrumb: 'Toolbar > Move',
        description: 'Taşıma aracı.',
      ),
      Command(
        id: 'ps-crop',
        name: 'CROP',
        shortcut: 'C',
        breadcrumb: 'Toolbar > Crop',
        description: 'Kırpma aracı.',
      ),
    ],
  ),
  Program(
    id: 'illustrator',
    name: 'Adobe Illustrator',
    imageUrl:
        'https://cdn.worldvectorlogo.com/logos/adobe-illustrator-cc-icon.svg',
    commands: [
      Command(
        id: 'ai-pen',
        name: 'PEN TOOL',
        shortcut: 'P',
        breadcrumb: 'Toolbar > Pen',
        description: 'Vektörel çizim aracı.',
      ),
      Command(
        id: 'ai-selection',
        name: 'SELECTION',
        shortcut: 'V',
        breadcrumb: 'Toolbar > Selection',
        description: 'Nesne seçme ve taşıma.',
      ),
    ],
  ),
  Program(
    id: 'zbrush',
    name: 'ZBrush',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/ZBrush_Logo.png/600px-ZBrush_Logo.png',
    commands: [
      Command(
        id: 'zb-brush',
        name: 'BRUSH LIST',
        shortcut: 'B',
        breadcrumb: 'Standard > Brushes',
        description: 'Fırça listesini açar.',
      ),
      Command(
        id: 'zb-subtool',
        name: 'SUBTOOL',
        shortcut: 'N',
        breadcrumb: 'Tool > Subtool',
        description: 'Subtool menüsünü açar.',
      ),
    ],
  ),
  Program(
    id: 'lumion',
    name: 'Lumion',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/d/df/Lumion_Logo.png',
    commands: [
      Command(
        id: 'lu-move',
        name: 'MOVE',
        shortcut: 'W/A/S/D',
        breadcrumb: 'Navigation',
        description: 'Sahne içerisinde hareket eder.',
      ),
      Command(
        id: 'lu-place',
        name: 'PLACE',
        shortcut: 'P',
        breadcrumb: 'Objects > Place',
        description: 'Kütüphaneden obje yerleştirir.',
      ),
    ],
  ),
  Program(
    id: 'indesign',
    name: 'InDesign',
    imageUrl:
        'https://cdn.worldvectorlogo.com/logos/adobe-indesign-cc-icon.svg',
    commands: [
      Command(
        id: 'id-text',
        name: 'TEXT',
        shortcut: 'T',
        breadcrumb: 'Toolbar > Type',
        description: 'Yazı alanı oluşturur.',
      ),
      Command(
        id: 'id-rect',
        name: 'RECTANGLE FRAME',
        shortcut: 'F',
        breadcrumb: 'Toolbar > Frame',
        description: 'Görsel çerçevesi oluşturur.',
      ),
    ],
  ),
];
