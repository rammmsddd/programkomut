import 'package:flutter/material.dart';
import '../../models/program.dart';
import '../../models/command.dart';

final Program rhinoProgram = Program(
  id: 'rhino',
  name: 'Rhino',
  brandColor: const Color(0xFF8B8B8B),
  commands: [
    // Curves
    Command(
      id: 'rh-line',
      name: 'LINE',
      shortcut: 'Line',
      breadcrumb: 'Curve > Line',
      description: 'Düz çizgi çizer.',
    ),
    Command(
      id: 'rh-polyline',
      name: 'POLYLINE',
      shortcut: 'Polyline',
      breadcrumb: 'Curve > Polyline',
      description: 'Çoklu çizgi.',
    ),
    Command(
      id: 'rh-circle',
      name: 'CIRCLE',
      shortcut: 'Circle',
      breadcrumb: 'Curve > Circle',
      description: 'Daire çizer.',
    ),
    Command(
      id: 'rh-arc',
      name: 'ARC',
      shortcut: 'Arc',
      breadcrumb: 'Curve > Arc',
      description: 'Yay çizer.',
    ),
    Command(
      id: 'rh-curve',
      name: 'CURVE',
      shortcut: 'Curve',
      breadcrumb: 'Curve > Free-form',
      description: 'Serbest eğri.',
    ),

    // Surface
    Command(
      id: 'rh-loft',
      name: 'LOFT',
      shortcut: 'Loft',
      breadcrumb: 'Surface > Loft',
      description: 'Eğriler arası yüzey.',
    ),
    Command(
      id: 'rh-sweep1',
      name: 'SWEEP 1 RAIL',
      shortcut: 'Sweep1',
      breadcrumb: 'Surface > Sweep 1',
      description: 'Tek ray süpürme.',
    ),
    Command(
      id: 'rh-sweep2',
      name: 'SWEEP 2 RAIL',
      shortcut: 'Sweep2',
      breadcrumb: 'Surface > Sweep 2',
      description: 'İki ray süpürme.',
    ),
    Command(
      id: 'rh-revolve',
      name: 'REVOLVE',
      shortcut: 'Revolve',
      breadcrumb: 'Surface > Revolve',
      description: 'Döndürerek yüzey.',
    ),
    Command(
      id: 'rh-extrude',
      name: 'EXTRUDE',
      shortcut: 'ExtrudeCrv',
      breadcrumb: 'Surface > Extrude',
      description: 'Eğriyi uzatır.',
    ),

    // Solid
    Command(
      id: 'rh-box',
      name: 'BOX',
      shortcut: 'Box',
      breadcrumb: 'Solid > Box',
      description: 'Kutu oluşturur.',
    ),
    Command(
      id: 'rh-sphere',
      name: 'SPHERE',
      shortcut: 'Sphere',
      breadcrumb: 'Solid > Sphere',
      description: 'Küre oluşturur.',
    ),
    Command(
      id: 'rh-cylinder',
      name: 'CYLINDER',
      shortcut: 'Cylinder',
      breadcrumb: 'Solid > Cylinder',
      description: 'Silindir oluşturur.',
    ),

    // Transform
    Command(
      id: 'rh-move',
      name: 'MOVE',
      shortcut: 'Move',
      breadcrumb: 'Transform > Move',
      description: 'Taşır.',
    ),
    Command(
      id: 'rh-copy',
      name: 'COPY',
      shortcut: 'Copy',
      breadcrumb: 'Transform > Copy',
      description: 'Kopyalar.',
    ),
    Command(
      id: 'rh-rotate',
      name: 'ROTATE',
      shortcut: 'Rotate',
      breadcrumb: 'Transform > Rotate',
      description: 'Döndürür.',
    ),
    Command(
      id: 'rh-scale',
      name: 'SCALE',
      shortcut: 'Scale',
      breadcrumb: 'Transform > Scale',
      description: 'Ölçeklendirir.',
    ),
    Command(
      id: 'rh-mirror',
      name: 'MIRROR',
      shortcut: 'Mirror',
      breadcrumb: 'Transform > Mirror',
      description: 'Aynalar.',
    ),
    Command(
      id: 'rh-array',
      name: 'ARRAY',
      shortcut: 'Array',
      breadcrumb: 'Transform > Array',
      description: 'Dizi oluşturur.',
    ),

    // Edit
    Command(
      id: 'rh-join',
      name: 'JOIN',
      shortcut: 'Join',
      breadcrumb: 'Edit > Join',
      description: 'Birleştirir.',
    ),
    Command(
      id: 'rh-trim',
      name: 'TRIM',
      shortcut: 'Trim',
      breadcrumb: 'Edit > Trim',
      description: 'Kırpar.',
    ),
    Command(
      id: 'rh-split',
      name: 'SPLIT',
      shortcut: 'Split',
      breadcrumb: 'Edit > Split',
      description: 'Böler.',
    ),
    Command(
      id: 'rh-offset',
      name: 'OFFSET',
      shortcut: 'Offset',
      breadcrumb: 'Curve > Offset',
      description: 'Kaydırır.',
    ),
    Command(
      id: 'rh-fillet',
      name: 'FILLET',
      shortcut: 'Fillet',
      breadcrumb: 'Curve > Fillet',
      description: 'Köşe yuvarlatır.',
    ),

    // View
    Command(
      id: 'rh-zoom',
      name: 'ZOOM EXTENTS',
      shortcut: 'ZE',
      breadcrumb: 'View > Zoom > Extents',
      description: 'Tümünü gösterir.',
    ),
    Command(
      id: 'rh-top',
      name: 'TOP VIEW',
      shortcut: 'F2',
      breadcrumb: 'View > Set View > Top',
      description: 'Üstten görünüm.',
    ),
    Command(
      id: 'rh-front',
      name: 'FRONT VIEW',
      shortcut: 'F1',
      breadcrumb: 'View > Set View > Front',
      description: 'Önden görünüm.',
    ),
    Command(
      id: 'rh-right',
      name: 'RIGHT VIEW',
      shortcut: 'F3',
      breadcrumb: 'View > Set View > Right',
      description: 'Sağdan görünüm.',
    ),

    // Layers
    Command(
      id: 'rh-layer',
      name: 'LAYER',
      shortcut: 'Layer',
      breadcrumb: 'Edit > Layers',
      description: 'Katman yönetimi.',
    ),
  ],
);
