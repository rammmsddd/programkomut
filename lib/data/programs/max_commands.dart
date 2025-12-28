import 'package:flutter/material.dart';
import '../../models/program.dart';
import '../../models/command.dart';

final Program maxProgram = Program(
  id: '3dsmax',
  name: '3ds Max',
  brandColor: const Color(0xFF00A88F),
  commands: [
    // Transform
    Command(
      id: 'max-move',
      name: 'MOVE',
      shortcut: 'W',
      breadcrumb: 'Tools > Move',
      description: 'Nesneleri taşır.',
    ),
    Command(
      id: 'max-rotate',
      name: 'ROTATE',
      shortcut: 'E',
      breadcrumb: 'Tools > Rotate',
      description: 'Nesneleri döndürür.',
    ),
    Command(
      id: 'max-scale',
      name: 'SCALE',
      shortcut: 'R',
      breadcrumb: 'Tools > Scale',
      description: 'Nesneleri ölçeklendirir.',
    ),
    Command(
      id: 'max-select',
      name: 'SELECT',
      shortcut: 'Q',
      breadcrumb: 'Tools > Select',
      description: 'Seçim aracı.',
    ),

    // Selection
    Command(
      id: 'max-selectall',
      name: 'SELECT ALL',
      shortcut: 'Ctrl+A',
      breadcrumb: 'Edit > Select All',
      description: 'Tümünü seçer.',
    ),
    Command(
      id: 'max-selectnone',
      name: 'SELECT NONE',
      shortcut: 'Ctrl+D',
      breadcrumb: 'Edit > Select None',
      description: 'Seçimi kaldırır.',
    ),
    Command(
      id: 'max-selectinvert',
      name: 'SELECT INVERT',
      shortcut: 'Ctrl+I',
      breadcrumb: 'Edit > Select Invert',
      description: 'Seçimi tersine çevirir.',
    ),
    Command(
      id: 'max-selectbyname',
      name: 'SELECT BY NAME',
      shortcut: 'H',
      breadcrumb: 'Edit > Select By Name',
      description: 'İsimle seçer.',
    ),

    // View
    Command(
      id: 'max-maxviewport',
      name: 'MAXIMIZE VIEWPORT',
      shortcut: 'Alt+W',
      breadcrumb: 'View > Maximize Viewport',
      description: 'Viewport\'u büyütür.',
    ),
    Command(
      id: 'max-wireframe',
      name: 'WIREFRAME',
      shortcut: 'F3',
      breadcrumb: 'View > Wireframe',
      description: 'Wireframe görünümü.',
    ),
    Command(
      id: 'max-edgedfaces',
      name: 'EDGED FACES',
      shortcut: 'F4',
      breadcrumb: 'View > Edged Faces',
      description: 'Kenar çizgilerini gösterir.',
    ),
    Command(
      id: 'max-smooth',
      name: 'SMOOTH+HIGHLIGHTS',
      shortcut: 'F3',
      breadcrumb: 'View > Smooth',
      description: 'Pürüzsüz görünüm.',
    ),
    Command(
      id: 'max-grid',
      name: 'TOGGLE GRID',
      shortcut: 'G',
      breadcrumb: 'View > Grid',
      description: 'Izgarayı aç/kapat.',
    ),
    Command(
      id: 'max-zoomextents',
      name: 'ZOOM EXTENTS',
      shortcut: 'Z',
      breadcrumb: 'View > Zoom Extents',
      description: 'Tümünü gösterir.',
    ),
    Command(
      id: 'max-zoomselected',
      name: 'ZOOM TO SELECTED',
      shortcut: 'Ctrl+Shift+Z',
      breadcrumb: 'View > Zoom Selected',
      description: 'Seçileni yakınlaştırır.',
    ),

    // Camera Views
    Command(
      id: 'max-top',
      name: 'TOP VIEW',
      shortcut: 'T',
      breadcrumb: 'View > Top',
      description: 'Üstten görünüm.',
    ),
    Command(
      id: 'max-front',
      name: 'FRONT VIEW',
      shortcut: 'F',
      breadcrumb: 'View > Front',
      description: 'Önden görünüm.',
    ),
    Command(
      id: 'max-left',
      name: 'LEFT VIEW',
      shortcut: 'L',
      breadcrumb: 'View > Left',
      description: 'Soldan görünüm.',
    ),
    Command(
      id: 'max-perspective',
      name: 'PERSPECTIVE',
      shortcut: 'P',
      breadcrumb: 'View > Perspective',
      description: 'Perspektif görünüm.',
    ),
    Command(
      id: 'max-camera',
      name: 'CAMERA',
      shortcut: 'C',
      breadcrumb: 'View > Camera',
      description: 'Kamera görünümü.',
    ),

    // Edit
    Command(
      id: 'max-undo',
      name: 'UNDO',
      shortcut: 'Ctrl+Z',
      breadcrumb: 'Edit > Undo',
      description: 'Geri alır.',
    ),
    Command(
      id: 'max-redo',
      name: 'REDO',
      shortcut: 'Ctrl+Y',
      breadcrumb: 'Edit > Redo',
      description: 'Tekrar yapar.',
    ),
    Command(
      id: 'max-clone',
      name: 'CLONE',
      shortcut: 'Ctrl+V',
      breadcrumb: 'Edit > Clone',
      description: 'Kopyalar.',
    ),
    Command(
      id: 'max-delete',
      name: 'DELETE',
      shortcut: 'Delete',
      breadcrumb: 'Edit > Delete',
      description: 'Siler.',
    ),
    Command(
      id: 'max-hide',
      name: 'HIDE SELECTED',
      shortcut: 'Alt+H',
      breadcrumb: 'Display > Hide Selected',
      description: 'Seçileni gizler.',
    ),
    Command(
      id: 'max-unhideall',
      name: 'UNHIDE ALL',
      shortcut: 'Alt+Shift+H',
      breadcrumb: 'Display > Unhide All',
      description: 'Tümünü gösterir.',
    ),
    Command(
      id: 'max-freeze',
      name: 'FREEZE SELECTED',
      shortcut: 'Freeze',
      breadcrumb: 'Display > Freeze',
      description: 'Seçileni dondurur.',
    ),

    // Modifier
    Command(
      id: 'max-editpoly',
      name: 'EDIT POLY',
      shortcut: 'E > Edit Poly',
      breadcrumb: 'Modify > Edit Poly',
      description: 'Polygon düzenleme.',
    ),
    Command(
      id: 'max-turbosmooth',
      name: 'TURBOSMOOTH',
      shortcut: 'Modifier > Turbosmooth',
      breadcrumb: 'Modify > Turbosmooth',
      description: 'Mesh pürüzsüzleştirme.',
    ),
    Command(
      id: 'max-symmetry',
      name: 'SYMMETRY',
      shortcut: 'Modifier > Symmetry',
      breadcrumb: 'Modify > Symmetry',
      description: 'Simetri modifier.',
    ),

    // Rendering
    Command(
      id: 'max-render',
      name: 'RENDER',
      shortcut: 'F9',
      breadcrumb: 'Rendering > Render',
      description: 'Render yapar.',
    ),
    Command(
      id: 'max-rendersetup',
      name: 'RENDER SETUP',
      shortcut: 'F10',
      breadcrumb: 'Rendering > Render Setup',
      description: 'Render ayarları.',
    ),
    Command(
      id: 'max-quickrender',
      name: 'QUICK RENDER',
      shortcut: 'Shift+Q',
      breadcrumb: 'Rendering > Quick Render',
      description: 'Hızlı render.',
    ),
    Command(
      id: 'max-materialeditor',
      name: 'MATERIAL EDITOR',
      shortcut: 'M',
      breadcrumb: 'Rendering > Material Editor',
      description: 'Materyal editörü.',
    ),
    Command(
      id: 'max-rendertotexture',
      name: 'RENDER TO TEXTURE',
      shortcut: '0',
      breadcrumb: 'Rendering > Render To Texture',
      description: 'Texture\'a render.',
    ),

    // Animation
    Command(
      id: 'max-autokey',
      name: 'AUTO KEY',
      shortcut: 'N',
      breadcrumb: 'Animation > Auto Key',
      description: 'Otomatik keyframe.',
    ),
    Command(
      id: 'max-setkey',
      name: 'SET KEY',
      shortcut: 'K',
      breadcrumb: 'Animation > Set Key',
      description: 'Keyframe ayarlar.',
    ),

    // Snap
    Command(
      id: 'max-snap',
      name: 'SNAP TOGGLE',
      shortcut: 'S',
      breadcrumb: 'Tools > Snap',
      description: 'Snap modunu aç/kapat.',
    ),
    Command(
      id: 'max-angle-snap',
      name: 'ANGLE SNAP',
      shortcut: 'A',
      breadcrumb: 'Tools > Angle Snap',
      description: 'Açı snap modu.',
    ),

    // Isolate
    Command(
      id: 'max-isolate',
      name: 'ISOLATE SELECTION',
      shortcut: 'Alt+Q',
      breadcrumb: 'Tools > Isolate',
      description: 'Seçimi izole eder.',
    ),

    // Misc
    Command(
      id: 'max-expertmode',
      name: 'EXPERT MODE',
      shortcut: 'Ctrl+X',
      breadcrumb: 'Views > Expert Mode',
      description: 'Uzman modu (panelleri gizler).',
    ),
    Command(
      id: 'max-transformgizmo',
      name: 'TRANSFORM GIZMO',
      shortcut: 'X',
      breadcrumb: 'Views > Show Transform Gizmo',
      description: 'Transform gizmo göster/gizle.',
    ),
  ],
);
