import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'painters/command_painters.dart' as cmd;

class CommandIcon extends StatelessWidget {
  final String commandName;
  final String programName;
  final double size;
  final bool isDark;

  const CommandIcon({
    super.key,
    required this.commandName,
    required this.programName,
    this.size = 40,
    this.isDark = false,
  });

  CustomPainter _getPainterForCommand() {
    final name = commandName.toLowerCase();
    final color = _getProgramColor();

    // Drawing commands
    if (name.contains('line') || name == 'l') {
      return cmd.LinePainter(color: color, isDark: isDark);
    }
    if (name.contains('circle') || name == 'c') {
      return cmd.CirclePainter(color: color, isDark: isDark);
    }
    if (name.contains('rectangle') || name.contains('rect')) {
      return cmd.RectanglePainter(color: color, isDark: isDark);
    }
    if (name.contains('arc')) {
      return cmd.ArcPainter(color: color, isDark: isDark);
    }
    if (name.contains('polygon')) {
      return cmd.PolygonPainter(color: color, isDark: isDark);
    }
    if (name.contains('ellipse')) {
      return cmd.EllipsePainter(color: color, isDark: isDark);
    }
    if (name.contains('spline')) {
      return cmd.SplinePainter(color: color, isDark: isDark);
    }
    if (name.contains('polyline') || name.contains('pline')) {
      return cmd.PolylinePainter(color: color, isDark: isDark);
    }

    // Modify commands
    if (name.contains('move') || name == 'm') {
      return cmd.MovePainter(color: color, isDark: isDark);
    }
    if (name.contains('copy') || name == 'co') {
      return cmd.CopyPainter(color: color, isDark: isDark);
    }
    if (name.contains('rotate') || name == 'ro') {
      return cmd.RotatePainter(color: color, isDark: isDark);
    }
    if (name.contains('scale') || name == 'sc') {
      return cmd.ScalePainter(color: color, isDark: isDark);
    }
    if (name.contains('mirror')) {
      return cmd.MirrorPainter(color: color, isDark: isDark);
    }
    if (name.contains('offset')) {
      return cmd.OffsetPainter(color: color, isDark: isDark);
    }
    if (name.contains('trim') || name.contains('extend')) {
      return cmd.TrimPainter(color: color, isDark: isDark);
    }

    // 3D commands
    if (name.contains('box') || name.contains('cube')) {
      return cmd.BoxPainter(color: color, isDark: isDark);
    }
    if (name.contains('sphere')) {
      return cmd.SpherePainter(color: color, isDark: isDark);
    }
    if (name.contains('cylinder')) {
      return cmd.CylinderPainter(color: color, isDark: isDark);
    }
    if (name.contains('extrude')) {
      return cmd.ExtrudePainter(color: color, isDark: isDark);
    }

    // Text & Annotation
    if (name.contains('text') || name == 't') {
      return cmd.TextCommandPainter(color: color, isDark: isDark);
    }
    if (name.contains('dimension') || name.contains('dim')) {
      return cmd.DimensionPainter(color: color, isDark: isDark);
    }

    // File operations
    if (name.contains('new') || name == 'new') {
      return cmd.NewPainter(color: color, isDark: isDark);
    }
    if (name.contains('save')) {
      return cmd.SavePainter(color: color, isDark: isDark);
    }
    if (name.contains('open')) {
      return cmd.OpenPainter(color: color, isDark: isDark);
    }
    if (name.contains('print')) {
      return cmd.PrintPainter(color: color, isDark: isDark);
    }
    if (name.contains('export')) {
      return cmd.ExportPainter(color: color, isDark: isDark);
    }

    // View commands
    if (name.contains('zoom')) {
      return cmd.ZoomPainter(color: color, isDark: isDark);
    }
    if (name.contains('pan')) {
      return cmd.PanPainter(color: color, isDark: isDark);
    }
    if (name.contains('render')) {
      return cmd.RenderPainter(color: color, isDark: isDark);
    }

    // Edit operations
    if (name.contains('undo') || name == 'u') {
      return cmd.UndoPainter(color: color, isDark: isDark);
    }
    if (name.contains('redo')) {
      return cmd.RedoPainter(color: color, isDark: isDark);
    }
    if (name.contains('delete')) {
      return cmd.DeletePainter(color: color, isDark: isDark);
    }
    if (name.contains('erase')) {
      return cmd.ErasePainter(color: color, isDark: isDark);
    }

    // Layer & Properties
    if (name.contains('layer')) {
      return cmd.LayerPainter(color: color, isDark: isDark);
    }
    if (name.contains('properties') || name.contains('prop')) {
      return cmd.PropertiesPainter(color: color, isDark: isDark);
    }
    if (name.contains('color') || name.contains('colour')) {
      return cmd.ColorPainter(color: color, isDark: isDark);
    }

    // Selection & Group
    if (name.contains('select')) {
      return cmd.SelectPainter(color: color, isDark: isDark);
    }
    if (name.contains('group')) {
      return cmd.GroupPainter(color: color, isDark: isDark);
    }

    // Default fallback - use generic geometric shape
    return cmd.FallbackPainter(color: color, isDark: isDark);
  }

  Color _getProgramColor() {
    switch (programName.toLowerCase()) {
      case 'autocad':
        return const Color(0xFFE53935);
      case 'blender':
        return const Color(0xFFFF6D00);
      case 'photoshop':
        return const Color(0xFF00A0E3);
      case 'illustrator':
        return const Color(0xFFFF9A00);
      case 'sketchup':
        return const Color(0xFF005F9E);
      case 'revit':
        return const Color(0xFF134EA2);
      case '3ds max':
        return const Color(0xFF00897B);
      case 'maya':
        return const Color(0xFF0ABAB5);
      default:
        return AppColors.accentBlue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final programColor = _getProgramColor();
    final painter = _getPainterForCommand();

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            programColor.withOpacity(0.15),
            programColor.withOpacity(0.08),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(size * 0.25),
        border: Border.all(color: programColor.withOpacity(0.3), width: 1),
      ),
      child: CustomPaint(size: Size(size, size), painter: painter),
    );
  }
}
