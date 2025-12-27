import '../models/program.dart';
import '../models/command.dart';

final List<Program> programs = [
  Program(
    id: 'autocad',
    name: 'AutoCAD',
    imageUrl: 'assets/images/autocad.svg', // Placeholder
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
      Command(
        id: 'ac-ellipse',
        name: 'ELLIPSE',
        shortcut: 'EL',
        breadcrumb: 'Home > Draw > Ellipse',
        description: 'Elips çizer.',
      ),
      Command(
        id: 'ac-hatch',
        name: 'HATCH',
        shortcut: 'H',
        breadcrumb: 'Home > Draw > Hatch',
        description: 'Kapalı alanları tarar veya boyar.',
      ),
      Command(
        id: 'ac-gradient',
        name: 'GRADIENT',
        shortcut: 'GD',
        breadcrumb: 'Home > Draw > Gradient',
        description: 'Renk geçişli boyama yapar.',
      ),
      Command(
        id: 'ac-spline',
        name: 'SPLINE',
        shortcut: 'SPL',
        breadcrumb: 'Home > Draw > Spline',
        description: 'Eğrisel, yumuşak hatlı çizgiler çizer.',
      ),
      Command(
        id: 'ac-xline',
        name: 'XLINE',
        shortcut: 'XL',
        breadcrumb: 'Home > Draw > Construction Line',
        description: 'Sonsuz uzunlukta yardımcı çizgi çizer.',
      ),
      Command(
        id: 'ac-point',
        name: 'POINT',
        shortcut: 'PO',
        breadcrumb: 'Home > Draw > Point',
        description: 'Nokta koyar.',
      ),
      Command(
        id: 'ac-donut',
        name: 'DONUT',
        shortcut: 'DO',
        breadcrumb: 'Home > Draw > Donut',
        description: 'İçi dolu halka/simit çizer.',
      ),
      Command(
        id: 'ac-region',
        name: 'REGION',
        shortcut: 'REG',
        breadcrumb: 'Home > Draw > Region',
        description: 'Kapalı çizgileri tek bir yüzeye çevirir.',
      ),
      Command(
        id: 'ac-revcloud',
        name: 'REVISION CLOUD',
        shortcut: 'REVCLOUD',
        breadcrumb: 'Home > Draw > Revision Cloud',
        description: 'Revizyon bulutu çizer.',
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
        shortcut: 'CO / CP',
        breadcrumb: 'Home > Modify > Copy',
        description: 'Objeyi kopyalar.',
      ),
      Command(
        id: 'ac-stretch',
        name: 'STRETCH',
        shortcut: 'S',
        breadcrumb: 'Home > Modify > Stretch',
        description: 'Objeyi sündürür/uzatır (Seçim penceresiyle çalışır).',
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
        id: 'ac-scale',
        name: 'SCALE',
        shortcut: 'SC',
        breadcrumb: 'Home > Modify > Scale',
        description: 'Objeyi büyütür veya küçültür.',
      ),
      Command(
        id: 'ac-trim',
        name: 'TRIM',
        shortcut: 'TR',
        breadcrumb: 'Home > Modify > Trim',
        description: 'Kesişen çizgilerin fazlasını budar.',
      ),
      Command(
        id: 'ac-extend',
        name: 'EXTEND',
        shortcut: 'EX',
        breadcrumb: 'Home > Modify > Extend',
        description: 'Çizgiyi karşıdaki sınıra kadar uzatır.',
      ),
      Command(
        id: 'ac-fillet',
        name: 'FILLET',
        shortcut: 'F',
        breadcrumb: 'Home > Modify > Fillet',
        description: 'Köşeleri yuvarlatır (R değeri girilir).',
      ),
      Command(
        id: 'ac-chamfer',
        name: 'CHAMFER',
        shortcut: 'CHA',
        breadcrumb: 'Home > Modify > Chamfer',
        description: 'Köşeleri pahlar (Keskin kırar).',
      ),
      Command(
        id: 'ac-array',
        name: 'ARRAY',
        shortcut: 'AR',
        breadcrumb: 'Home > Modify > Array',
        description: 'Objeleri sıralı şekilde çoğaltır (Dizi).',
      ),
      Command(
        id: 'ac-explode',
        name: 'EXPLODE',
        shortcut: 'X',
        breadcrumb: 'Home > Modify > Explode',
        description: 'Blokları veya birleşik çizgileri patlatır/ayırır.',
      ),
      Command(
        id: 'ac-offset',
        name: 'OFFSET',
        shortcut: 'O',
        breadcrumb: 'Home > Modify > Offset',
        description: 'Belirli mesafede paralel kopya oluşturur.',
      ),
      Command(
        id: 'ac-align',
        name: 'ALIGN',
        shortcut: 'AL',
        breadcrumb: 'Modify > Align',
        description:
            'Bir objeyi başka bir objeye hizalar ve oturtur (Çok kritik!).',
      ),
      Command(
        id: 'ac-join',
        name: 'JOIN',
        shortcut: 'J',
        breadcrumb: 'Home > Modify > Join',
        description: 'Uç uca duran çizgileri birleştirir (Tek parça yapar).',
      ),
      Command(
        id: 'ac-break',
        name: 'BREAK',
        shortcut: 'BR',
        breadcrumb: 'Home > Modify > Break',
        description: 'Çizgiyi iki noktadan kırar/koparır.',
      ),
      Command(
        id: 'ac-overkill',
        name: 'OVERKILL',
        shortcut: 'OVERKILL',
        breadcrumb: 'Modify > Delete Duplicate',
        description: 'Üst üste binmiş gereksiz çizgileri temizler.',
      ),
      Command(
        id: 'ac-purge',
        name: 'PURGE',
        shortcut: 'PU',
        breadcrumb: 'Application Menu > Drawing Utilities',
        description:
            'Kullanılmayan katmanları ve blokları temizler (Dosyayı hafifletir).',
      ),

      // 3. 3D Modelleme Komutları (Solid & Surface)
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
        description:
            'Kapalı alanları tıklayıp çekiştirerek 3D yapar (SketchUp gibi).',
      ),
      Command(
        id: 'ac-3d-box',
        name: 'BOX',
        shortcut: 'BOX',
        breadcrumb: '3D > Modeling',
        description: 'Hazır 3D kutu çizer.',
      ),
      Command(
        id: 'ac-3d-cyl',
        name: 'CYLINDER',
        shortcut: 'CYL',
        breadcrumb: '3D > Modeling',
        description: '3D Silindir çizer.',
      ),
      Command(
        id: 'ac-3d-sph',
        name: 'SPHERE',
        shortcut: 'SPH',
        breadcrumb: '3D > Modeling',
        description: '3D Küre çizer.',
      ),
      Command(
        id: 'ac-3d-uni',
        name: 'UNION',
        shortcut: 'UNI',
        breadcrumb: '3D > Boolean',
        description: 'İki ayrı 3D katı objeyi tek parça yapar (Birleştirir).',
      ),
      Command(
        id: 'ac-3d-sub',
        name: 'SUBTRACT',
        shortcut: 'SU',
        breadcrumb: '3D > Boolean',
        description: 'Bir 3D objeden diğerini çıkarır (Delik açmak için).',
      ),
      Command(
        id: 'ac-3d-int',
        name: 'INTERSECT',
        shortcut: 'IN',
        breadcrumb: '3D > Boolean',
        description: 'Kesişen iki objenin sadece kesişimini bırakır.',
      ),
      Command(
        id: 'ac-3d-rev',
        name: 'REVOLVE',
        shortcut: 'REV',
        breadcrumb: '3D > Modeling',
        description:
            'Bir profili eksen etrafında döndürerek 3D yapar (Vazo, bardak vb.).',
      ),
      Command(
        id: 'ac-3d-sw',
        name: 'SWEEP',
        shortcut: 'SW',
        breadcrumb: '3D > Modeling',
        description: 'Bir profili bir yol boyunca süpürerek 3D yapar.',
      ),
      Command(
        id: 'ac-3d-loft',
        name: 'LOFT',
        shortcut: 'LOFT',
        breadcrumb: '3D > Modeling',
        description:
            'Farklı kesitleri birleştirerek organik 3D form oluşturur.',
      ),
      Command(
        id: 'ac-3d-sl',
        name: 'SLICE',
        shortcut: 'SL',
        breadcrumb: '3D > Modeling',
        description: '3D objeyi bıçakla keser gibi ikiye böler.',
      ),
      Command(
        id: 'ac-3d-3r',
        name: '3D ROTATE',
        shortcut: '3R',
        breadcrumb: '3D > Transform',
        description: '3D uzayda (X,Y,Z ekseninde) döndürme yapar.',
      ),
      Command(
        id: 'ac-3d-3m',
        name: '3D MOVE',
        shortcut: '3M',
        breadcrumb: '3D > Transform',
        description: '3D uzayda taşıma yapar.',
      ),
      Command(
        id: 'ac-3d-vs',
        name: 'VISUALSTYLES',
        shortcut: 'VS',
        breadcrumb: '3D > View',
        description: 'Görüntü modunu değiştirir (Tel kafes, Katı, Gerçekçi).',
      ),

      // 4. Gelişmiş Blok ve XREF (Referans) Komutları
      Command(
        id: 'ac-xr',
        name: 'XREF',
        shortcut: 'XR',
        breadcrumb: 'Insert > Reference',
        description: 'Dışarıdan başka bir DWG dosyasını altlık olarak bağlar.',
      ),
      Command(
        id: 'ac-be',
        name: 'BEDIT',
        shortcut: 'BE',
        breadcrumb: 'Home > Block > Edit',
        description:
            'Blok düzenleme editörünü açar (Bloğu patlatmadan düzenler).',
      ),
      Command(
        id: 'ac-att',
        name: 'ATTDEF',
        shortcut: 'ATT',
        breadcrumb: 'Home > Block > Attribute',
        description:
            'Bloğa "Nitelik" ekler (Örn: Kapı bloğuna marka/fiyat bilgisi girmek).',
      ),
      Command(
        id: 'ac-bc',
        name: 'BCOUNT',
        shortcut: '-',
        breadcrumb: 'Express Tools > Block',
        description: '(Express Tool) Çizimdeki blokları sayar.',
      ),
      Command(
        id: 'ac-refe',
        name: 'REFEDIT',
        shortcut: 'REF',
        breadcrumb: 'Insert > Reference',
        description: 'Xref\'i veya bloğu yerinde düzenler.',
      ),
      Command(
        id: 'ac-wb',
        name: 'WBLOCK',
        shortcut: 'W',
        breadcrumb: 'Command Line',
        description: 'Seçili kısmı ayrı bir dosya olarak kaydeder.',
      ),
      Command(
        id: 'ac-dx',
        name: 'DATAEXTRACTION',
        shortcut: 'DX',
        breadcrumb: 'Insert > Linking & Extraction',
        description:
            'Çizimdeki verileri (blok sayıları, ölçüler) Excel\'e aktarır.',
      ),

      // 5. Layout (Pafta) ve Çıktı Komutları
      Command(
        id: 'ac-plot',
        name: 'PLOT',
        shortcut: 'CTRL+P',
        breadcrumb: 'Application Menu > Print',
        description: 'Çıktı alma penceresini açar.',
      ),
      Command(
        id: 'ac-mv',
        name: 'MVIEW',
        shortcut: 'MV',
        breadcrumb: 'Layout > Layout Viewports',
        description: 'Layout sayfasında çizim penceresi açar.',
      ),
      Command(
        id: 'ac-lo',
        name: 'LAYOUT',
        shortcut: 'LO',
        breadcrumb: 'Layout > New',
        description: 'Yeni pafta sayfası oluşturur.',
      ),
      Command(
        id: 'ac-psi',
        name: 'PSETUPIN',
        shortcut: '-',
        breadcrumb: 'Layout > Page Setup',
        description: 'Başka dosyadan sayfa ayarlarını içe aktarır.',
      ),
      Command(
        id: 'ac-vp',
        name: 'VPORTS',
        shortcut: '-',
        breadcrumb: 'View > Viewports',
        description:
            'Ekranı parçalara böler (Aynı anda hem planı hem görünüşü görmek için).',
      ),
      Command(
        id: 'ac-pub',
        name: 'PUBLISH',
        shortcut: '-',
        breadcrumb: 'Application Menu > Publish',
        description: 'Çoklu paftaları toplu halde PDF yapar.',
      ),
      Command(
        id: 'ac-lts',
        name: 'LTSCALE',
        shortcut: 'LTS',
        breadcrumb: 'Command Line',
        description: 'Kesikli çizgilerin sıklığını (ölçeğini) ayarlar.',
      ),
      Command(
        id: 'ac-plts',
        name: 'PSLTSCALE',
        shortcut: '-',
        breadcrumb: 'Command Line',
        description: 'Layout\'taki çizgi ölçeğini ayarlar (0 veya 1 yapılır).',
      ),

      // 6. Sistem Değişkenleri
      Command(
        id: 'ac-sys-fd',
        name: 'FILEDIA',
        shortcut: '0 / 1',
        breadcrumb: 'System Settings',
        description: 'Dosya açarken pencere gelmiyorsa 1 yap.',
      ),
      Command(
        id: 'ac-sys-pb',
        name: 'PICKBOX',
        shortcut: '1-50',
        breadcrumb: 'Options > Selection',
        description: 'İmlecin ucundaki kare seçim kutusunu büyütür/küçültür.',
      ),
      Command(
        id: 'ac-sys-cs',
        name: 'CURSORSIZE',
        shortcut: '1-100',
        breadcrumb: 'Options > Display',
        description:
            'İmlecin artı (+) uçlarını uzatır. 100 yaparsan ekranı kaplar.',
      ),
      Command(
        id: 'ac-sys-mt',
        name: 'MIRRTEXT',
        shortcut: '0 / 1',
        breadcrumb: 'System Settings',
        description: 'Aynalayınca yazı ters dönüyorsa 0 yap.',
      ),
      Command(
        id: 'ac-sys-hi',
        name: 'HIGHLIGHT',
        shortcut: '0 / 1',
        breadcrumb: 'System Settings',
        description: 'Seçilen obje parlamıyorsa 1 yap.',
      ),
      Command(
        id: 'ac-sys-zf',
        name: 'ZOOMFACTOR',
        shortcut: '3-100',
        breadcrumb: 'Options > User Preferences',
        description:
            'Mouse tekerleğinin ne kadar hızlı yakınlaştırdığını ayarlar.',
      ),
      Command(
        id: 'ac-sys-mp',
        name: 'MBUTTONPAN',
        shortcut: '0 / 1',
        breadcrumb: 'System Settings',
        description: 'Mouse tekerleğine basınca el (Pan) çıkmıyorsa 1 yap.',
      ),

      // 7. Hayat Kurtaran Gizli Komutlar
      Command(
        id: 'ac-oops',
        name: 'OOPS',
        shortcut: '-',
        breadcrumb: 'Command Line',
        description:
            'En son sildiğin objeyi geri getirir (Aradaki işleri bozmaz).',
      ),
      Command(
        id: 'ac-ttf',
        name: 'TEXTTOFRONT',
        shortcut: '-',
        breadcrumb: 'Home > Annotation',
        description: 'Tüm yazıları ve ölçüleri çizimlerin en önüne getirir.',
      ),
      Command(
        id: 'ac-mc',
        name: 'MOCORO',
        shortcut: '-',
        breadcrumb: 'Express Tools > Modify',
        description: 'Move, Copy, Rotate komutlarını tek seferde yaptırır.',
      ),
      Command(
        id: 'ac-qs',
        name: 'QSAVE',
        shortcut: 'QS',
        breadcrumb: 'File',
        description: 'Hızlı kayıt (Ctrl+S\'nin komut halidir).',
      ),
      Command(
        id: 'ac-audit',
        name: 'AUDIT',
        shortcut: '-',
        breadcrumb: 'Application Menu > Drawing Utilities',
        description: 'Dosyadaki hataları tarar ve düzeltir.',
      ),
      Command(
        id: 'ac-recover',
        name: 'RECOVER',
        shortcut: '-',
        breadcrumb: 'Application Menu > Drawing Utilities',
        description: 'Bozulan, açılmayan dosyaları kurtararak açar.',
      ),
      Command(
        id: 'ac-closeall',
        name: 'CLOSEALL',
        shortcut: '-',
        breadcrumb: 'File',
        description: 'Açık olan bütün sekmeleri kapatır.',
      ),

      // 8. Ölçülendirme ve Yazı (ANNOTATION)
      Command(
        id: 'ac-t',
        name: 'TEXT (MTEXT)',
        shortcut: 'T / MT',
        breadcrumb: 'Home > Annotation > Multiline Text',
        description: 'Çok satırlı yazı yazar.',
      ),
      Command(
        id: 'ac-dim',
        name: 'DIMENSION',
        shortcut: 'DIM',
        breadcrumb: 'Home > Annotation > Dimension',
        description: 'Akıllı ölçülendirme (Otomatik algılar).',
      ),
      Command(
        id: 'ac-dli',
        name: 'DIMLINEAR',
        shortcut: 'DLI',
        breadcrumb: 'Annotate > Dimension > Linear',
        description: 'Yatay veya dikey düz ölçü alır.',
      ),
      Command(
        id: 'ac-dal',
        name: 'DIMALIGNED',
        shortcut: 'DAL',
        breadcrumb: 'Annotate > Dimension > Aligned',
        description: 'Açılı çizgilerin boyunu ölçer.',
      ),
      Command(
        id: 'ac-dan',
        name: 'DIMANGULAR',
        shortcut: 'DAN',
        breadcrumb: 'Annotate > Dimension > Angular',
        description: 'Açı ölçer.',
      ),
      Command(
        id: 'ac-dra',
        name: 'DIMRADIUS',
        shortcut: 'DRA',
        breadcrumb: 'Annotate > Dimension > Radius',
        description: 'Yarıçap ölçer.',
      ),
      Command(
        id: 'ac-le',
        name: 'LEADER',
        shortcut: 'LE / QLE',
        breadcrumb: 'Annotate > Leaders',
        description: 'Ok işareti ile not ekler.',
      ),
      Command(
        id: 'ac-tb',
        name: 'TABLE',
        shortcut: 'TB',
        breadcrumb: 'Annotate > Table',
        description: 'Tablo oluşturur.',
      ),
      Command(
        id: 'ac-d',
        name: 'DIMSTYLE',
        shortcut: 'D',
        breadcrumb: 'Annotate > Dimensions (Ok)',
        description: 'Ölçü ayarları penceresini açar.',
      ),

      // 9. Katman ve Özellikler (LAYERS & PROPERTIES)
      Command(
        id: 'ac-la',
        name: 'LAYER',
        shortcut: 'LA',
        breadcrumb: 'Home > Layers > Layer Properties',
        description: 'Katman yöneticisini açar (Yeni layer açma/kapama).',
      ),
      Command(
        id: 'ac-ma',
        name: 'MATCH PROPERTIES',
        shortcut: 'MA',
        breadcrumb: 'Home > Clipboard > Match Properties',
        description: 'Bir objenin özelliğini (renk, layer) diğerine boyar.',
      ),
      Command(
        id: 'ac-pr',
        name: 'PROPERTIES',
        shortcut: 'PR / CH / MO',
        breadcrumb: 'View > Palettes > Properties',
        description: 'Özellikler panelini açar.',
      ),
      Command(
        id: 'ac-li',
        name: 'LAYISO',
        shortcut: 'LAYISO',
        breadcrumb: 'Home > Layers > Isolate',
        description: 'Seçili obje haricindeki tüm layerları gizler/kilitler.',
      ),
      Command(
        id: 'ac-lu',
        name: 'LAYUNISO',
        shortcut: 'LAYUNISO',
        breadcrumb: 'Home > Layers > Unisolate',
        description: 'Gizlenen layerları geri açar.',
      ),
      Command(
        id: 'ac-lo',
        name: 'LAYOFF',
        shortcut: 'LAYOFF',
        breadcrumb: 'Home > Layers > Off',
        description: 'Tıklanan objenin katmanını kapatır.',
      ),

      // 10. Blok ve Gruplama (BLOCKS)
      Command(
        id: 'ac-b',
        name: 'BLOCK',
        shortcut: 'B',
        breadcrumb: 'Home > Block > Create',
        description: 'Seçili objelerden blok oluşturur (Dosya içinde).',
      ),
      Command(
        id: 'ac-wb-2',
        name: 'WRITE BLOCK',
        shortcut: 'W',
        breadcrumb: 'Command Line',
        description: 'Bloğu dışarıya .dwg dosyası olarak kaydeder.',
      ),
      Command(
        id: 'ac-i',
        name: 'INSERT',
        shortcut: 'I',
        breadcrumb: 'Home > Block > Insert',
        description: 'Dosyaya blok veya resim ekler.',
      ),
      Command(
        id: 'ac-g',
        name: 'GROUP',
        shortcut: 'G',
        breadcrumb: 'Home > Groups > Group',
        description: 'Objeleri gruplar (Bloktan daha basittir).',
      ),
      Command(
        id: 'ac-ung',
        name: 'UNGROUP',
        shortcut: 'UNG',
        breadcrumb: 'Home > Groups > Ungroup',
        description: 'Grubu bozar.',
      ),
      Command(
        id: 'ac-xc',
        name: 'XCLIP',
        shortcut: 'XC',
        breadcrumb: 'Command Line',
        description:
            'Bloğun veya Xref\'in sadece bir kısmını gösterir (Kırpar).',
      ),

      // 11. Görünüm ve Kontrol (VIEW & CONTROL)
      Command(
        id: 'ac-z',
        name: 'ZOOM',
        shortcut: 'Z',
        breadcrumb: 'View > Navigate > Zoom',
        description:
            'Yakınlaşma aracı (Z + Enter + E yaparsan her şeyi ekrana sığdırır).',
      ),
      Command(
        id: 'ac-p',
        name: 'PAN',
        shortcut: 'P',
        breadcrumb: 'View > Navigate > Pan',
        description: 'Ekranı kaydırır (El aracı).',
      ),
      Command(
        id: 'ac-re',
        name: 'REGEN',
        shortcut: 'RE',
        breadcrumb: 'View > Regen',
        description: 'Ekranı yeniler (Kırık görünen daireleri düzeltir).',
      ),
      Command(
        id: 'ac-un',
        name: 'UNITS',
        shortcut: 'UN',
        breadcrumb: 'Application Menu > Drawing Utilities',
        description: 'Çizim birimini (cm, mm, m) ayarlar.',
      ),
      Command(
        id: 'ac-op',
        name: 'OPTIONS',
        shortcut: 'OP',
        breadcrumb: 'Application Menu > Options',
        description: 'Genel ayarlar menüsünü açar (Arka plan rengi vb.).',
      ),
      Command(
        id: 'ac-di',
        name: 'DIST',
        shortcut: 'DI',
        breadcrumb: 'Home > Utilities > Measure',
        description: 'İki nokta arasını hızlıca ölçer (Ekranda yazar).',
      ),
      Command(
        id: 'ac-aa',
        name: 'AREA',
        shortcut: 'AA',
        breadcrumb: 'Home > Utilities > Measure > Area',
        description: 'Alan (metrekare) hesaplar.',
      ),
      Command(
        id: 'ac-id',
        name: 'ID POINT',
        shortcut: 'ID',
        breadcrumb: 'Home > Utilities > ID Point',
        description: 'Tıklanan noktanın X,Y,Z koordinatını verir.',
      ),
    ],
  ),
  Program(
    id: 'sketchup',
    name: 'SketchUp',
    imageUrl: 'assets/images/sketchup.svg', // Placeholder
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
    imageUrl: 'assets/images/blender.png', // Found
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
    imageUrl: 'assets/images/revit.svg', // Placeholder
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
    imageUrl: 'assets/images/3dsmax.svg', // Placeholder
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
    name: 'Rhino 3D',
    imageUrl: 'assets/images/rhino.svg', // Placeholder
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
    imageUrl: 'assets/images/archicad.svg', // Placeholder
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
    imageUrl: 'assets/images/cinema4d.svg', // Placeholder
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
    name: 'Maya',
    imageUrl: 'assets/images/maya.svg', // Placeholder
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
    imageUrl: 'assets/images/solidworks.svg', // Placeholder
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
    imageUrl: 'assets/images/fusion360.svg', // Placeholder
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
    imageUrl: 'assets/images/vectorworks.svg', // Placeholder
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
    name: 'Photoshop',
    imageUrl: 'assets/images/photoshop.png', // Found
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
    name: 'Illustrator',
    imageUrl: 'assets/images/illustrator.png', // Found
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
    imageUrl: 'assets/images/zbrush.svg', // Placeholder
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
    imageUrl: 'assets/images/lumion.svg', // Placeholder
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
    imageUrl: 'assets/images/indesign.png', // Found
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
