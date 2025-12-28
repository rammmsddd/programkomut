import 'package:flutter/material.dart';
import '../../models/program.dart';
import '../../models/command.dart';

final Program sketchupProgram = Program(
  id: 'sketchup',
  name: 'SketchUp',
  brandColor: const Color(0xFF005F9E),
  commands: [
    // ========================================
    // DOSYA İŞLEMLERİ
    // ========================================
    Command(
      id: 'sk-new',
      name: 'NEW',
      shortcut: 'Ctrl+N',
      breadcrumb: 'File > New',
      description: 'Yeni proje oluşturur.',
    ),
    Command(
      id: 'sk-open',
      name: 'OPEN',
      shortcut: 'Ctrl+O',
      breadcrumb: 'File > Open',
      description: 'Dosya açar.',
    ),
    Command(
      id: 'sk-save',
      name: 'SAVE',
      shortcut: 'Ctrl+S',
      breadcrumb: 'File > Save',
      description: 'Projeyi kaydeder.',
    ),
    Command(
      id: 'sk-undo',
      name: 'UNDO',
      shortcut: 'Ctrl+Z',
      breadcrumb: 'Edit > Undo',
      description: 'Geri alır.',
    ),
    Command(
      id: 'sk-redo',
      name: 'REDO',
      shortcut: 'Ctrl+Y',
      breadcrumb: 'Edit > Redo',
      description: 'Tekrar yapar.',
    ),

    // ========================================
    // ÇİZİM ARAÇLARI
    // ========================================
    Command(
      id: 'sk-line',
      name: 'LINE',
      shortcut: 'L',
      breadcrumb: 'Draw > Line',
      description: 'Çizgi çizer.',
    ),
    Command(
      id: 'sk-rectangle',
      name: 'RECTANGLE',
      shortcut: 'R',
      breadcrumb: 'Draw > Rectangle',
      description: 'Dikdörtgen çizer.',
    ),
    Command(
      id: 'sk-circle',
      name: 'CIRCLE',
      shortcut: 'C',
      breadcrumb: 'Draw > Circle',
      description: 'Daire çizer.',
    ),
    Command(
      id: 'sk-arc',
      name: 'ARC',
      shortcut: 'A',
      breadcrumb: 'Draw > Arc',
      description: 'Yay çizer.',
    ),
    Command(
      id: 'sk-polygon',
      name: 'POLYGON',
      shortcut: 'P+G',
      breadcrumb: 'Draw > Polygon',
      description: 'Çokgen çizer.',
    ),
    Command(
      id: 'sk-freehand',
      name: 'FREEHAND',
      shortcut: 'F+H',
      breadcrumb: 'Draw > Freehand',
      description: 'Serbest çizim yapar.',
    ),

    // ========================================
    // 3D ARAÇLARI
    // ========================================
    Command(
      id: 'sk-push',
      name: 'PUSH/PULL',
      shortcut: 'P',
      breadcrumb: 'Tools > Push/Pull',
      description: 'Yüzeyleri iter veya çeker.',
    ),
    Command(
      id: 'sk-followme',
      name: 'FOLLOW ME',
      shortcut: 'F+M',
      breadcrumb: 'Tools > Follow Me',
      description: 'Yol boyunca profil oluşturur.',
    ),
    Command(
      id: 'sk-offset',
      name: 'OFFSET',
      shortcut: 'F',
      breadcrumb: 'Tools > Offset',
      description: 'Kenarları iç/dış kaydırır.',
    ),

    // ========================================
    // DÜZENLEME
    // ========================================
    Command(
      id: 'sk-move',
      name: 'MOVE',
      shortcut: 'M',
      breadcrumb: 'Tools > Move',
      description: 'Nesneleri taşır.',
    ),
    Command(
      id: 'sk-rotate',
      name: 'ROTATE',
      shortcut: 'Q',
      breadcrumb: 'Tools > Rotate',
      description: 'Nesneleri döndürür.',
    ),
    Command(
      id: 'sk-scale',
      name: 'SCALE',
      shortcut: 'S',
      breadcrumb: 'Tools > Scale',
      description: 'Nesneleri ölçekler.',
    ),
    Command(
      id: 'sk-eraser',
      name: 'ERASER',
      shortcut: 'E',
      breadcrumb: 'Tools > Eraser',
      description: 'Kenar veya yüz siler.',
    ),
    Command(
      id: 'sk-tape',
      name: 'TAPE MEASURE',
      shortcut: 'T',
      breadcrumb: 'Tools > Tape Measure',
      description: 'Mesafe ölçer.',
    ),
    Command(
      id: 'sk-protractor',
      name: 'PROTRACTOR',
      shortcut: 'P+R',
      breadcrumb: 'Tools > Protractor',
      description: 'Açı ölçer.',
    ),
    Command(
      id: 'sk-paintbucket',
      name: 'PAINT BUCKET',
      shortcut: 'B',
      breadcrumb: 'Tools > Paint Bucket',
      description: 'Materyal uygular.',
    ),

    // ========================================
    // SEÇİM VE GÖRÜNÜM
    // ========================================
    Command(
      id: 'sk-select',
      name: 'SELECT',
      shortcut: 'Spacebar',
      breadcrumb: 'Tools > Select',
      description: 'Seçim aracı.',
    ),
    Command(
      id: 'sk-selectall',
      name: 'SELECT ALL',
      shortcut: 'Ctrl+A',
      breadcrumb: 'Edit > Select All',
      description: 'Tümünü seçer.',
    ),
    Command(
      id: 'sk-delete',
      name: 'DELETE',
      shortcut: 'Delete',
      breadcrumb: 'Edit > Delete',
      description: 'Seçili öğeleri siler.',
    ),
    Command(
      id: 'sk-orbit',
      name: 'ORBIT',
      shortcut: 'O',
      breadcrumb: 'Camera > Orbit',
      description: 'Kamera döndürme.',
    ),
    Command(
      id: 'sk-pan',
      name: 'PAN',
      shortcut: 'H',
      breadcrumb: 'Camera > Pan',
      description: 'Kamera kaydırma.',
    ),
    Command(
      id: 'sk-zoom',
      name: 'ZOOM',
      shortcut: 'Z',
      breadcrumb: 'Camera > Zoom',
      description: 'Yakınlaştır/uzaklaştır.',
    ),
    Command(
      id: 'sk-zoomextents',
      name: 'ZOOM EXTENTS',
      shortcut: 'Shift+Z',
      breadcrumb: 'Camera > Zoom Extents',
      description: 'Tüm modeli gösterir.',
    ),
    Command(
      id: 'sk-zoomwindow',
      name: 'ZOOM WINDOW',
      shortcut: 'Ctrl+Shift+Z',
      breadcrumb: 'Camera > Zoom Window',
      description: 'Pencere yakınlaştırma.',
    ),

    // ========================================
    // COMPONENT & GROUP
    // ========================================
    Command(
      id: 'sk-makecomponent',
      name: 'MAKE COMPONENT',
      shortcut: 'G',
      breadcrumb: 'Edit > Make Component',
      description: 'Component oluşturur.',
    ),
    Command(
      id: 'sk-makegroup',
      name: 'MAKE GROUP',
      shortcut: 'Ctrl+G',
      breadcrumb: 'Edit > Make Group',
      description: 'Grup oluşturur.',
    ),
    Command(
      id: 'sk-explode',
      name: 'EXPLODE',
      shortcut: 'Ctrl+Shift+G',
      breadcrumb: 'Edit > Explode',
      description: 'Grup/component dağıtır.',
    ),
    Command(
      id: 'sk-editcomponent',
      name: 'EDIT COMPONENT',
      shortcut: 'Enter',
      breadcrumb: 'Edit > Component',
      description: 'Component düzenleme moduna girer.',
    ),
    Command(
      id: 'sk-exitcomponent',
      name: 'EXIT COMPONENT',
      shortcut: 'Esc',
      breadcrumb: 'Edit > Close Group',
      description: 'Component düzenlemeden çıkar.',
    ),

    // ========================================
    // GÖRÜNÜMLERviewS
    // ========================================
    Command(
      id: 'sk-topview',
      name: 'TOP VIEW',
      shortcut: 'Ctrl+1',
      breadcrumb: 'Camera > Standard > Top',
      description: 'Üstten görünüm.',
    ),
    Command(
      id: 'sk-frontview',
      name: 'FRONT VIEW',
      shortcut: 'Ctrl+2',
      breadcrumb: 'Camera > Standard > Front',
      description: 'Önden görünüm.',
    ),
    Command(
      id: 'sk-rightview',
      name: 'RIGHT VIEW',
      shortcut: 'Ctrl+3',
      breadcrumb: 'Camera > Standard > Right',
      description: 'Sağdan görünüm.',
    ),
    Command(
      id: 'sk-isoview',
      name: 'ISO VIEW',
      shortcut: 'Ctrl+4',
      breadcrumb: 'Camera > Standard > Iso',
      description: 'İzometrik görünüm.',
    ),
    Command(
      id: 'sk-wireframe',
      name: 'WIREFRAME',
      shortcut: 'Ctrl+1',
      breadcrumb: 'View > Face Style > Wireframe',
      description: 'Wireframe modu.',
    ),
    Command(
      id: 'sk-shaded',
      name: 'SHADED',
      shortcut: 'Ctrl+2',
      breadcrumb: 'View > Face Style > Shaded',
      description: 'Gölgeli görünüm.',
    ),
    Command(
      id: 'sk-textured',
      name: 'SHADED WITH TEXTURES',
      shortcut: 'Ctrl+3',
      breadcrumb: 'View > Face Style > Shaded with Textures',
      description: 'Dokulu gölgeli görünüm.',
    ),

    // ========================================
    // GİZLEME & GÖRÜNÜRLÜKShow/Hide
    // ========================================
    Command(
      id: 'sk-hide',
      name: 'HIDE',
      shortcut: 'Ctrl+H',
      breadcrumb: 'Edit > Hide',
      description: 'Seçili nesneleri gizler.',
    ),
    Command(
      id: 'sk-unhideall',
      name: 'UNHIDE ALL',
      shortcut: 'Shift+H',
      breadcrumb: 'Edit > Unhide > All',
      description: 'Tüm gizli nesneleri gösterir.',
    ),
    Command(
      id: 'sk-hiderest',
      name: 'HIDE REST OF MODEL',
      shortcut: 'Ctrl+K',
      breadcrumb: 'Edit > Hide Rest',
      description: 'Seçili hariç geri kalanları gizler.',
    ),

    // ========================================
    // LOCK & UNLOCK
    // ========================================
    Command(
      id: 'sk-lock',
      name: 'LOCK',
      shortcut: 'Ctrl+L',
      breadcrumb: 'Edit > Lock',
      description: 'Seçili nesneleri kilitler.',
    ),
    Command(
      id: 'sk-unlockall',
      name: 'UNLOCK ALL',
      shortcut: 'Ctrl+Shift+L',
      breadcrumb: 'Edit > Unlock > All',
      description: 'Tüm kilitli nesneleri açar.',
    ),

    // ========================================
    // X-RAY MODEray & Hidden Geometry
    // ========================================
    Command(
      id: 'sk-xray',
      name: 'X-RAY MODE',
      shortcut: 'Ctrl+X',
      breadcrumb: 'View > X-Ray',
      description: 'X-Ray modunu açar/kapatır.',
    ),
    Command(
      id: 'sk-hiddengeometry',
      name: 'HIDDEN GEOMETRY',
      shortcut: 'Ctrl+G',
      breadcrumb: 'View > Hidden Geometry',
      description: 'Gizli geometriyi gösterir.',
    ),

    // ========================================
    // SECTION PLANESection
    // ========================================
    Command(
      id: 'sk-sectionplane',
      name: 'SECTION PLANE',
      shortcut: 'Alt+/+S',
      breadcrumb: 'Tools > Section Plane',
      description: 'Kesit düzlemi oluşturur.',
    ),
    Command(
      id: 'sk-sectioncuts',
      name: 'SECTION CUTS',
      shortcut: 'Alt+/+C',
      breadcrumb: 'View > Section Cuts',
      description: 'Kesitleri gösterir.',
    ),

    // ========================================
    // TEXT & DIMENSIONStext & Dimensions
    // ========================================
    Command(
      id: 'sk-text',
      name: '3D TEXT',
      shortcut: 'Alt+/+T',
      breadcrumb: 'Tools > 3D Text',
      description: '3D metin oluşturur.',
    ),
    Command(
      id: 'sk-dimension',
      name: 'DIMENSION',
      shortcut: 'Alt+/+D',
      breadcrumb: 'Tools > Dimension',
      description: 'Ölçü koyar.',
    ),

    // ========================================
    // AXES & INFERENCE
    // ========================================
    Command(
      id: 'sk-lockred',
      name: 'LOCK TO RED AXIS',
      shortcut: 'Left Arrow',
      breadcrumb: 'Move > Lock Axis',
      description: 'Kırmızı eksene kilitler.',
    ),
    Command(
      id: 'sk-lockgreen',
      name: 'LOCK TO GREEN AXIS',
      shortcut: 'Right Arrow',
      breadcrumb: 'Move > Lock Axis',
      description: 'Yeşil eksene kilitler.',
    ),
    Command(
      id: 'sk-lockblue',
      name: 'LOCK TO BLUE AXIS',
      shortcut: 'Up Arrow',
      breadcrumb: 'Move > Lock Axis',
      description: 'Mavi eksene kilitler.',
    ),

    // ========================================
    // SOFTEN/SMOOTH
    // ========================================
    Command(
      id: 'sk-soften',
      name: 'SOFTEN EDGES',
      shortcut: 'Window > Soften Edges',
      breadcrumb: 'Window > Soften Edges',
      description: 'Kenarları yumuşatır.',
    ),

    // ========================================
    // SCENES
    // ========================================
    Command(
      id: 'sk-addscene',
      name: 'ADD SCENE',
      shortcut: 'Window > Scenes > +',
      breadcrumb: 'Window > Scenes',
      description: 'Yeni sahne ekler.',
    ),
    Command(
      id: 'sk-updatescene',
      name: 'UPDATE SCENE',
      shortcut: 'Window > Scenes > Update',
      breadcrumb: 'Window > Scenes > Update',
      description: 'Sahneyi günceller.',
    ),

    // ========================================
    // STYLES
    // ========================================
    Command(
      id: 'sk-styles',
      name: 'STYLES',
      shortcut: 'Window > Styles',
      breadcrumb: 'Window > Styles',
      description: 'Stil penceresinicin açar.',
    ),
  ],
);
