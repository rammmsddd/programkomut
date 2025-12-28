import 'package:flutter/material.dart';
import '../../models/program.dart';
import '../../models/command.dart';

final Program photoshopProgram = Program(
  id: 'photoshop',
  name: 'Photoshop',
  brandColor: const Color(0xFF31A8FF),
  commands: [
    // ========================================
    // DOSYA İŞLEMLERİ
    // ========================================
    Command(
      id: 'ps-new',
      name: 'NEW',
      shortcut: 'Ctrl+N',
      breadcrumb: 'File > New',
      description: 'Yeni belge oluşturur.',
    ),
    Command(
      id: 'ps-open',
      name: 'OPEN',
      shortcut: 'Ctrl+O',
      breadcrumb: 'File > Open',
      description: 'Dosya açma penceresini gösterir.',
    ),
    Command(
      id: 'ps-save',
      name: 'SAVE',
      shortcut: 'Ctrl+S',
      breadcrumb: 'File > Save',
      description: 'Aktif belgeyi kaydeder.',
    ),
    Command(
      id: 'ps-saveas',
      name: 'SAVE AS',
      shortcut: 'Ctrl+Shift+S',
      breadcrumb: 'File > Save As',
      description: 'Belgeyi farklı kaydet.',
    ),
    Command(
      id: 'ps-saveforweb',
      name: 'SAVE FOR WEB',
      shortcut: 'Ctrl+Shift+Alt+S',
      breadcrumb: 'File > Export > Save for Web',
      description: 'Web için optimize edilmiş kaydet.',
    ),
    Command(
      id: 'ps-close',
      name: 'CLOSE',
      shortcut: 'Ctrl+W',
      breadcrumb: 'File > Close',
      description: 'Aktif belgeyi kapatır.',
    ),
    Command(
      id: 'ps-print',
      name: 'PRINT',
      shortcut: 'Ctrl+P',
      breadcrumb: 'File > Print',
      description: 'Yazdırma penceresini açar.',
    ),

    // ========================================
    // DÜZENLEME
    // ========================================
    Command(
      id: 'ps-undo',
      name: 'UNDO',
      shortcut: 'Ctrl+Z',
      breadcrumb: 'Edit > Undo',
      description: 'Son işlemi geri alır.',
    ),
    Command(
      id: 'ps-redo',
      name: 'REDO',
      shortcut: 'Ctrl+Shift+Z',
      breadcrumb: 'Edit > Redo',
      description: 'Geri alınan işlemi tekrarlar.',
    ),
    Command(
      id: 'ps-stepback',
      name: 'STEP BACKWARD',
      shortcut: 'Ctrl+Alt+Z',
      breadcrumb: 'Edit > Step Backward',
      description: 'Geçmiş adımında geriye gider.',
    ),
    Command(
      id: 'ps-cut',
      name: 'CUT',
      shortcut: 'Ctrl+X',
      breadcrumb: 'Edit > Cut',
      description: 'Seçimi keser ve panoya kopyalar.',
    ),
    Command(
      id: 'ps-copy',
      name: 'COPY',
      shortcut: 'Ctrl+C',
      breadcrumb: 'Edit > Copy',
      description: 'Seçimi panoya kopyalar.',
    ),
    Command(
      id: 'ps-paste',
      name: 'PASTE',
      shortcut: 'Ctrl+V',
      breadcrumb: 'Edit > Paste',
      description: 'Panodan yapıştırır.',
    ),
    Command(
      id: 'ps-fill-fg',
      name: 'FILL FOREGROUND',
      shortcut: 'Alt+Backspace',
      breadcrumb: 'Edit > Fill',
      description: 'Ön plan rengi ile doldurur.',
    ),
    Command(
      id: 'ps-fill-bg',
      name: 'FILL BACKGROUND',
      shortcut: 'Ctrl+Backspace',
      breadcrumb: 'Edit > Fill',
      description: 'Arka plan rengi ile doldurur.',
    ),
    Command(
      id: 'ps-freetransform',
      name: 'FREE TRANSFORM',
      shortcut: 'Ctrl+T',
      breadcrumb: 'Edit > Free Transform',
      description: 'Serbest dönüştürme modunu açar.',
    ),

    // ========================================
    // SEÇİM ARAÇLARI
    // ========================================
    Command(
      id: 'ps-selectall',
      name: 'SELECT ALL',
      shortcut: 'Ctrl+A',
      breadcrumb: 'Select > All',
      description: 'Tümünü seçer.',
    ),
    Command(
      id: 'ps-deselect',
      name: 'DESELECT',
      shortcut: 'Ctrl+D',
      breadcrumb: 'Select > Deselect',
      description: 'Seçimi kaldırır.',
    ),
    Command(
      id: 'ps-reselect',
      name: 'RESELECT',
      shortcut: 'Ctrl+Shift+D',
      breadcrumb: 'Select > Reselect',
      description: 'Önceki seçimi tekrar seçer.',
    ),
    Command(
      id: 'ps-inverse',
      name: 'INVERSE SELECTION',
      shortcut: 'Ctrl+Shift+I',
      breadcrumb: 'Select > Inverse',
      description: 'Seçimi tersine çevirir.',
    ),
    Command(
      id: 'ps-feather',
      name: 'FEATHER',
      shortcut: 'Shift+F6',
      breadcrumb: 'Select > Modify > Feather',
      description: 'Seçim kenarlarını yumuşatır.',
    ),
    Command(
      id: 'ps-marquee',
      name: 'MARQUEE TOOL',
      shortcut: 'M',
      breadcrumb: 'Tools > Marquee',
      description: 'Dikdörtgen/elips seçim aracı.',
    ),
    Command(
      id: 'ps-lasso',
      name: 'LASSO TOOL',
      shortcut: 'L',
      breadcrumb: 'Tools > Lasso',
      description: 'Serbest seçim aracı.',
    ),
    Command(
      id: 'ps-quickselect',
      name: 'QUICK SELECTION',
      shortcut: 'W',
      breadcrumb: 'Tools > Quick Selection',
      description: 'Hızlı seçim aracı.',
    ),
    Command(
      id: 'ps-magicwand',
      name: 'MAGIC WAND',
      shortcut: 'W',
      breadcrumb: 'Tools > Magic Wand',
      description: 'Sihirli değnek seçim aracı.',
    ),

    // ========================================
    // KATMANLAR (LAYERS)
    // ========================================
    Command(
      id: 'ps-newlayer',
      name: 'NEW LAYER',
      shortcut: 'Ctrl+Shift+N',
      breadcrumb: 'Layer > New > Layer',
      description: 'Yeni katman oluşturur.',
    ),
    Command(
      id: 'ps-duplicatelayer',
      name: 'DUPLICATE LAYER',
      shortcut: 'Ctrl+J',
      breadcrumb: 'Layer > Duplicate Layer',
      description: 'Aktif katmanı çoğaltır.',
    ),
    Command(
      id: 'ps-mergedown',
      name: 'MERGE DOWN',
      shortcut: 'Ctrl+E',
      breadcrumb: 'Layer > Merge Down',
      description: 'Katmanı alttaki ile birleştirir.',
    ),
    Command(
      id: 'ps-mergevisible',
      name: 'MERGE VISIBLE',
      shortcut: 'Ctrl+Shift+E',
      breadcrumb: 'Layer > Merge Visible',
      description: 'Görünür katmanları birleştirir.',
    ),
    Command(
      id: 'ps-flattimage',
      name: 'FLATTEN IMAGE',
      shortcut: 'Ctrl+Shift+E',
      breadcrumb: 'Layer > Flatten Image',
      description: 'Tüm katmanları tek katmana indirir.',
    ),
    Command(
      id: 'ps-grouplayers',
      name: 'GROUP LAYERS',
      shortcut: 'Ctrl+G',
      breadcrumb: 'Layer > Group Layers',
      description: 'Seçili katmanları gruplar.',
    ),
    Command(
      id: 'ps-ungroup',
      name: 'UNGROUP',
      shortcut: 'Ctrl+Shift+G',
      breadcrumb: 'Layer > Ungroup',
      description: 'Grup bağını çözer.',
    ),
    Command(
      id: 'ps-clippingmask',
      name: 'CREATE CLIPPING MASK',
      shortcut: 'Ctrl+Alt+G',
      breadcrumb: 'Layer > Create Clipping Mask',
      description: 'Kırpma maskesi oluşturur.',
    ),
    Command(
      id: 'ps-layerup',
      name: 'SELECT LAYER UP',
      shortcut: 'Alt+]',
      breadcrumb: 'Layer > Select',
      description: 'Üstteki katmanı seçer.',
    ),
    Command(
      id: 'ps-layerdown',
      name: 'SELECT LAYER DOWN',
      shortcut: 'Alt+[',
      breadcrumb: 'Layer > Select',
      description: 'Alttaki katmanı seçer.',
    ),

    // ========================================
    // BOYAMA ARAÇLARI
    // ========================================
    Command(
      id: 'ps-brush',
      name: 'BRUSH TOOL',
      shortcut: 'B',
      breadcrumb: 'Tools > Brush',
      description: 'Fırça aracı.',
    ),
    Command(
      id: 'ps-pencil',
      name: 'PENCIL TOOL',
      shortcut: 'B',
      breadcrumb: 'Tools > Pencil',
      description: 'Kalem aracı (keskin kenar).',
    ),
    Command(
      id: 'ps-eraser',
      name: 'ERASER TOOL',
      shortcut: 'E',
      breadcrumb: 'Tools > Eraser',
      description: 'Silgi aracı.',
    ),
    Command(
      id: 'ps-gradient',
      name: 'GRADIENT TOOL',
      shortcut: 'G',
      breadcrumb: 'Tools > Gradient',
      description: 'Renk geçişi aracı.',
    ),
    Command(
      id: 'ps-paintbucket',
      name: 'PAINT BUCKET',
      shortcut: 'G',
      breadcrumb: 'Tools > Paint Bucket',
      description: 'Boya kovası aracı.',
    ),
    Command(
      id: 'ps-clonestamp',
      name: 'CLONE STAMP',
      shortcut: 'S',
      breadcrumb: 'Tools > Clone Stamp',
      description: 'Kopyalama damgası aracı.',
    ),
    Command(
      id: 'ps-healing',
      name: 'HEALING BRUSH',
      shortcut: 'J',
      breadcrumb: 'Tools > Healing Brush',
      description: 'İyileştirme fırçası.',
    ),
    Command(
      id: 'ps-spotHealing',
      name: 'SPOT HEALING',
      shortcut: 'J',
      breadcrumb: 'Tools > Spot Healing',
      description: 'Nokta iyileştirme fırçası.',
    ),
    Command(
      id: 'ps-dodge',
      name: 'DODGE TOOL',
      shortcut: 'O',
      breadcrumb: 'Tools > Dodge',
      description: 'Aydınlatma aracı.',
    ),
    Command(
      id: 'ps-burn',
      name: 'BURN TOOL',
      shortcut: 'O',
      breadcrumb: 'Tools > Burn',
      description: 'Koyulaştırma aracı.',
    ),
    Command(
      id: 'ps-sponge',
      name: 'SPONGE TOOL',
      shortcut: 'O',
      breadcrumb: 'Tools > Sponge',
      description: 'Doygunluk aracı.',
    ),
    Command(
      id: 'ps-brushsize-inc',
      name: 'INCREASE BRUSH SIZE',
      shortcut: ']',
      breadcrumb: 'Brush > Size',
      description: 'Fırça boyutunu büyütür.',
    ),
    Command(
      id: 'ps-brushsize-dec',
      name: 'DECREASE BRUSH SIZE',
      shortcut: '[',
      breadcrumb: 'Brush > Size',
      description: 'Fırça boyutunu küçültür.',
    ),
    Command(
      id: 'ps-brushhard-inc',
      name: 'INCREASE HARDNESS',
      shortcut: 'Shift+]',
      breadcrumb: 'Brush > Hardness',
      description: 'Fırça sertliğini artırır.',
    ),
    Command(
      id: 'ps-brushhard-dec',
      name: 'DECREASE HARDNESS',
      shortcut: 'Shift+[',
      breadcrumb: 'Brush > Hardness',
      description: 'Fırça sertliğini azaltır.',
    ),

    // ========================================
    // RENK YÖNETİMİ
    // ========================================
    Command(
      id: 'ps-swapcolors',
      name: 'SWAP COLORS',
      shortcut: 'X',
      breadcrumb: 'Colors',
      description: 'Ön/arka plan renklerini değiştirir.',
    ),
    Command(
      id: 'ps-defaultcolors',
      name: 'DEFAULT COLORS',
      shortcut: 'D',
      breadcrumb: 'Colors',
      description: 'Varsayılan siyah/beyaz renge döner.',
    ),
    Command(
      id: 'ps-eyedropper',
      name: 'EYEDROPPER',
      shortcut: 'I',
      breadcrumb: 'Tools > Eyedropper',
      description: 'Renk seçici pipet aracı.',
    ),
    Command(
      id: 'ps-colorpicker',
      name: 'COLOR PICKER',
      shortcut: 'Alt+Backspace',
      breadcrumb: 'Window > Color Picker',
      description: 'Renk seçici penceresini açar.',
    ),

    // ========================================
    // AYARLAMALAR (ADJUSTMENTS)
    // ========================================
    Command(
      id: 'ps-levels',
      name: 'LEVELS',
      shortcut: 'Ctrl+L',
      breadcrumb: 'Image > Adjustments > Levels',
      description: 'Seviyeler ayarı penceresini açar.',
    ),
    Command(
      id: 'ps-curves',
      name: 'CURVES',
      shortcut: 'Ctrl+M',
      breadcrumb: 'Image > Adjustments > Curves',
      description: 'Eğriler ayarı penceresini açar.',
    ),
    Command(
      id: 'ps-huesaturation',
      name: 'HUE/SATURATION',
      shortcut: 'Ctrl+U',
      breadcrumb: 'Image > Adjustments > Hue/Saturation',
      description: 'Renk tonu/doygunluk ayarları.',
    ),
    Command(
      id: 'ps-colorbalance',
      name: 'COLOR BALANCE',
      shortcut: 'Ctrl+B',
      breadcrumb: 'Image > Adjustments > Color Balance',
      description: 'Renk dengesi ayarları.',
    ),
    Command(
      id: 'ps-blackwhite',
      name: 'BLACK & WHITE',
      shortcut: 'Alt+Shift+Ctrl+B',
      breadcrumb: 'Image > Adjustments > Black & White',
      description: 'Siyah beyaz dönüştürme.',
    ),
    Command(
      id: 'ps-desaturate',
      name: 'DESATURATE',
      shortcut: 'Ctrl+Shift+U',
      breadcrumb: 'Image > Adjustments > Desaturate',
      description: 'Renkleri kaldırır (gri tonlama).',
    ),
    Command(
      id: 'ps-invert',
      name: 'INVERT',
      shortcut: 'Ctrl+I',
      breadcrumb: 'Image > Adjustments > Invert',
      description: 'Renkleri tersine çevirir.',
    ),
    Command(
      id: 'ps-autotonE',
      name: 'AUTO TONE',
      shortcut: 'Ctrl+Shift+L',
      breadcrumb: 'Image > Auto Tone',
      description: 'Otomatik ton ayarı.',
    ),
    Command(
      id: 'ps-autocontrast',
      name: 'AUTO CONTRAST',
      shortcut: 'Alt+Shift+Ctrl+L',
      breadcrumb: 'Image > Auto Contrast',
      description: 'Otomatik kontrast ayarı.',
    ),
    Command(
      id: 'ps-autocolor',
      name: 'AUTO COLOR',
      shortcut: 'Ctrl+Shift+B',
      breadcrumb: 'Image > Auto Color',
      description: 'Otomatik renk düzeltme.',
    ),

    // ========================================
    // GÖRÜNÜM VE NAVİGASYON
    // ========================================
    Command(
      id: 'ps-zoomin',
      name: 'ZOOM IN',
      shortcut: 'Ctrl++',
      breadcrumb: 'View > Zoom In',
      description: 'Yakınlaştırır.',
    ),
    Command(
      id: 'ps-zoomout',
      name: 'ZOOM OUT',
      shortcut: 'Ctrl+-',
      breadcrumb: 'View > Zoom Out',
      description: 'Uzaklaştırır.',
    ),
    Command(
      id: 'ps-fitscreen',
      name: 'FIT ON SCREEN',
      shortcut: 'Ctrl+0',
      breadcrumb: 'View > Fit on Screen',
      description: 'Ekrana sığdırır.',
    ),
    Command(
      id: 'ps-actualsize',
      name: 'ACTUAL PIXELS',
      shortcut: 'Ctrl+Alt+0',
      breadcrumb: 'View > Actual Pixels',
      description: '%100 boyut görünümü.',
    ),
    Command(
      id: 'ps-handtool',
      name: 'HAND TOOL',
      shortcut: 'Spacebar',
      breadcrumb: 'Tools > Hand',
      description: 'El aracı ile kaydırma.',
    ),
    Command(
      id: 'ps-zoomtool',
      name: 'ZOOM TOOL',
      shortcut: 'Z',
      breadcrumb: 'Tools > Zoom',
      description: 'Yakınlaştırma aracı.',
    ),
    Command(
      id: 'ps-rulers',
      name: 'TOGGLE RULERS',
      shortcut: 'Ctrl+R',
      breadcrumb: 'View > Rulers',
      description: 'Cetvelleri göster/gizle.',
    ),
    Command(
      id: 'ps-grid',
      name: 'TOGGLE GRID',
      shortcut: 'Ctrl+\'',
      breadcrumb: 'View > Show > Grid',
      description: 'Izgarayı göster/gizle.',
    ),
    Command(
      id: 'ps-guides',
      name: 'TOGGLE GUIDES',
      shortcut: 'Ctrl+;',
      breadcrumb: 'View > Show > Guides',
      description: 'Kılavuzları göster/gizle.',
    ),
    Command(
      id: 'ps-lockguides',
      name: 'LOCK GUIDES',
      shortcut: 'Ctrl+Alt+;',
      breadcrumb: 'View > Lock Guides',
      description: 'Kılavuzları kilitler.',
    ),
    Command(
      id: 'ps-snaptogrid',
      name: 'SNAP TO GRID',
      shortcut: 'Ctrl+Shift+\'',
      breadcrumb: 'View > Snap To > Grid',
      description: 'Izgaraya yapışma.',
    ),

    // ========================================
    // METİN ARAÇLARI
    // ========================================
    Command(
      id: 'ps-text',
      name: 'TEXT TOOL',
      shortcut: 'T',
      breadcrumb: 'Tools > Text',
      description: 'Yatay metin aracı.',
    ),
    Command(
      id: 'ps-fontsize-inc',
      name: 'INCREASE FONT SIZE',
      shortcut: 'Ctrl+Shift+>',
      breadcrumb: 'Type > Size',
      description: 'Font boyutunu büyütür.',
    ),
    Command(
      id: 'ps-fontsize-dec',
      name: 'DECREASE FONT SIZE',
      shortcut: 'Ctrl+Shift+<',
      breadcrumb: 'Type > Size',
      description: 'Font boyutunu küçültür.',
    ),
    Command(
      id: 'ps-alignleft',
      name: 'ALIGN LEFT',
      shortcut: 'Ctrl+Shift+L',
      breadcrumb: 'Type > Align > Left',
      description: 'Metni sola hizalar.',
    ),
    Command(
      id: 'ps-aligncenter',
      name: 'ALIGN CENTER',
      shortcut: 'Ctrl+Shift+C',
      breadcrumb: 'Type > Align > Center',
      description: 'Metni ortalar.',
    ),
    Command(
      id: 'ps-alignright',
      name: 'ALIGN RIGHT',
      shortcut: 'Ctrl+Shift+R',
      breadcrumb: 'Type > Align > Right',
      description: 'Metni sağa hizalar.',
    ),
    Command(
      id: 'ps-bold',
      name: 'BOLD',
      shortcut: 'Ctrl+Shift+B',
      breadcrumb: 'Type > Bold',
      description: 'Kalın yazı yapar.',
    ),
    Command(
      id: 'ps-italic',
      name: 'ITALIC',
      shortcut: 'Ctrl+Shift+I',
      breadcrumb: 'Type > Italic',
      description: 'İtalik yazı yapar.',
    ),
    Command(
      id: 'ps-underline',
      name: 'UNDERLINE',
      shortcut: 'Ctrl+Shift+U',
      breadcrumb: 'Type > Underline',
      description: 'Altı çizili yazı yapar.',
    ),

    // ========================================
    // FİLTRELER
    // ========================================
    Command(
      id: 'ps-lastfilter',
      name: 'REPEAT LAST FILTER',
      shortcut: 'Ctrl+F',
      breadcrumb: 'Filter',
      description: 'Son filtreyi tekrarlar.',
    ),
    Command(
      id: 'ps-lastfilterdialog',
      name: 'LAST FILTER WITH DIALOG',
      shortcut: 'Ctrl+Alt+F',
      breadcrumb: 'Filter',
      description: 'Son filtreyi ayarlarıyla açar.',
    ),
    Command(
      id: 'ps-liquify',
      name: 'LIQUIFY',
      shortcut: 'Ctrl+Shift+X',
      breadcrumb: 'Filter > Liquify',
      description: 'Akışkanlaştırma filtresini açar.',
    ),
    Command(
      id: 'ps-gaussianblur',
      name: 'GAUSSIAN BLUR',
      shortcut: '-',
      breadcrumb: 'Filter > Blur > Gaussian Blur',
      description: 'Gauss bulanıklığı filtesi.',
    ),

    // ========================================
    // DİĞER ARAÇLAR
    // ========================================
    Command(
      id: 'ps-move',
      name: 'MOVE TOOL',
      shortcut: 'V',
      breadcrumb: 'Tools > Move',
      description: 'Taşıma aracı.',
    ),
    Command(
      id: 'ps-crop',
      name: 'CROP TOOL',
      shortcut: 'C',
      breadcrumb: 'Tools > Crop',
      description: 'Kırpma aracı.',
    ),
    Command(
      id: 'ps-slice',
      name: 'SLICE TOOL',
      shortcut: 'C',
      breadcrumb: 'Tools > Slice',
      description: 'Dilim aracı.',
    ),
    Command(
      id: 'ps-pen',
      name: 'PEN TOOL',
      shortcut: 'P',
      breadcrumb: 'Tools > Pen',
      description: 'Kalem aracı (yol çizimi).',
    ),
    Command(
      id: 'ps-shape',
      name: 'SHAPE TOOL',
      shortcut: 'U',
      breadcrumb: 'Tools > Rectangle',
      description: 'Şekil araçları.',
    ),
    Command(
      id: 'ps-blur',
      name: 'BLUR TOOL',
      shortcut: 'R',
      breadcrumb: 'Tools > Blur',
      description: 'Bulanıklık aracı.',
    ),
    Command(
      id: 'ps-sharpen',
      name: 'SHARPEN TOOL',
      shortcut: 'R',
      breadcrumb: 'Tools > Sharpen',
      description: 'Keskinleştirme aracı.',
    ),
    Command(
      id: 'ps-smudge',
      name: 'SMUDGE TOOL',
      shortcut: 'R',
      breadcrumb: 'Tools > Smudge',
      description: 'Bulaşma aracı.',
    ),

    // ========================================
    // HIZLI MASKE VE KANAL
    // ========================================
    Command(
      id: 'ps-quickmask',
      name: 'QUICK MASK MODE',
      shortcut: 'Q',
      breadcrumb: 'Select > Quick Mask',
      description: 'Hızlı maske modunu açar/kapatır.',
    ),
    Command(
      id: 'ps-channels',
      name: 'CHANNELS PANEL',
      shortcut: 'F7',
      breadcrumb: 'Window > Channels',
      description: 'Kanallar panelini açar.',
    ),
    Command(
      id: 'ps-layers-panel',
      name: 'LAYERS PANEL',
      shortcut: 'F7',
      breadcrumb: 'Window > Layers',
      description: 'Katmanlar panelini açar.',
    ),

    // ========================================
    // PANEL VE WORKSPACE
    // ========================================
    Command(
      id: 'ps-hide-panels',
      name: 'HIDE ALL PANELS',
      shortcut: 'Tab',
      breadcrumb: 'Window',
      description: 'Tüm panelleri gizler/gösterir.',
    ),
    Command(
      id: 'ps-hide-except-tools',
      name: 'HIDE EXCEPT TOOLS',
      shortcut: 'Shift+Tab',
      breadcrumb: 'Window',
      description: 'Araç çubuğu hariç panelleri gizler.',
    ),
    Command(
      id: 'ps-fullscreen',
      name: 'FULL SCREEN MODE',
      shortcut: 'F',
      breadcrumb: 'View > Screen Mode',
      description: 'Tam ekran modları arasında geçiş.',
    ),

    // ========================================
    // İMGE BOYUTU
    // ========================================
    Command(
      id: 'ps-imagesize',
      name: 'IMAGE SIZE',
      shortcut: 'Ctrl+Alt+I',
      breadcrumb: 'Image > Image Size',
      description: 'Görüntü boyutu penceresini açar.',
    ),
    Command(
      id: 'ps-canvassize',
      name: 'CANVAS SIZE',
      shortcut: 'Ctrl+Alt+C',
      breadcrumb: 'Image > Canvas Size',
      description: 'Tuval boyutu penceresini açar.',
    ),
  ],
);
