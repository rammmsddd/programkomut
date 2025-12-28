import 'package:flutter/material.dart';
import 'dart:math' as math;

// Base class for all command painters
abstract class CommandPainter extends CustomPainter {
  final Color color;
  final bool isDark;

  CommandPainter({required this.color, required this.isDark});

  Paint get strokePaint => Paint()
    ..color = color
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.5
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round;

  Paint get fillPaint => Paint()
    ..color = color.withOpacity(0.2)
    ..style = PaintingStyle.fill;

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ========== DRAWING COMMANDS ==========

class LinePainter extends CommandPainter {
  LinePainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
      Offset(size.width * 0.15, size.height * 0.15),
      Offset(size.width * 0.85, size.height * 0.85),
      strokePaint,
    );
  }
}

class CirclePainter extends CommandPainter {
  CirclePainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width * 0.35,
      strokePaint,
    );
  }
}

class RectanglePainter extends CommandPainter {
  RectanglePainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.15,
        size.height * 0.15,
        size.width * 0.7,
        size.height * 0.7,
      ),
      strokePaint,
    );
  }
}

class ArcPainter extends CommandPainter {
  ArcPainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(
      size.width * 0.1,
      size.height * 0.1,
      size.width * 0.8,
      size.height * 0.8,
    );
    canvas.drawArc(rect, -math.pi / 4, math.pi, false, strokePaint);
  }
}

class PolygonPainter extends CommandPainter {
  PolygonPainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.35;
    final sides = 6;

    for (int i = 0; i <= sides; i++) {
      final angle = (i * 2 * math.pi / sides) - math.pi / 2;
      final x = center.dx + radius * math.cos(angle);
      final y = center.dy + radius * math.sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, strokePaint);
  }
}

class EllipsePainter extends CommandPainter {
  EllipsePainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(
      Rect.fromLTWH(
        size.width * 0.1,
        size.height * 0.2,
        size.width * 0.8,
        size.height * 0.6,
      ),
      strokePaint,
    );
  }
}

class SplinePainter extends CommandPainter {
  SplinePainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width * 0.1, size.height * 0.7);
    path.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.1,
      size.width * 0.5,
      size.height * 0.5,
    );
    path.quadraticBezierTo(
      size.width * 0.7,
      size.height * 0.9,
      size.width * 0.9,
      size.height * 0.3,
    );
    canvas.drawPath(path, strokePaint);
  }
}

class PolylinePainter extends CommandPainter {
  PolylinePainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width * 0.1, size.height * 0.7);
    path.lineTo(size.width * 0.3, size.height * 0.3);
    path.lineTo(size.width * 0.6, size.height * 0.5);
    path.lineTo(size.width * 0.9, size.height * 0.2);
    canvas.drawPath(path, strokePaint);
  }
}

// ========== MODIFY COMMANDS ==========

class MovePainter extends CommandPainter {
  MovePainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width * 0.2, size.height * 0.5);
    path.lineTo(size.width * 0.7, size.height * 0.5);

    // Arrowhead
    path.moveTo(size.width * 0.55, size.height * 0.35);
    path.lineTo(size.width * 0.7, size.height * 0.5);
    path.lineTo(size.width * 0.55, size.height * 0.65);

    canvas.drawPath(path, strokePaint);
  }
}

class RotatePainter extends CommandPainter {
  RotatePainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(
      size.width * 0.15,
      size.height * 0.15,
      size.width * 0.7,
      size.height * 0.7,
    );

    canvas.drawArc(rect, -math.pi / 2, math.pi * 1.5, false, strokePaint);

    final path = Path();
    path.moveTo(size.width * 0.5, size.height * 0.15);
    path.lineTo(size.width * 0.4, size.height * 0.05);
    path.moveTo(size.width * 0.5, size.height * 0.15);
    path.lineTo(size.width * 0.6, size.height * 0.05);
    canvas.drawPath(path, strokePaint);
  }
}

class ScalePainter extends CommandPainter {
  ScalePainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final length = size.width * 0.3;

    final path = Path();
    // Top-right arrow
    path.moveTo(center.dx, center.dy);
    path.lineTo(center.dx + length, center.dy - length);
    path.moveTo(center.dx + length * 0.7, center.dy - length * 0.5);
    path.lineTo(center.dx + length, center.dy - length);
    path.lineTo(center.dx + length * 0.5, center.dy - length * 0.7);

    // Bottom-left arrow
    path.moveTo(center.dx, center.dy);
    path.lineTo(center.dx - length, center.dy + length);
    path.moveTo(center.dx - length * 0.7, center.dy + length * 0.5);
    path.lineTo(center.dx - length, center.dy + length);
    path.lineTo(center.dx - length * 0.5, center.dy + length * 0.7);

    canvas.drawPath(path, strokePaint);
  }
}

class MirrorPainter extends CommandPainter {
  MirrorPainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width * 0.2, size.height * 0.3);
    path.lineTo(size.width * 0.2, size.height * 0.7);
    path.lineTo(size.width * 0.4, size.height * 0.7);

    path.moveTo(size.width * 0.5, size.height * 0.2);
    path.lineTo(size.width * 0.5, size.height * 0.8);

    path.moveTo(size.width * 0.8, size.height * 0.3);
    path.lineTo(size.width * 0.8, size.height * 0.7);
    path.lineTo(size.width * 0.6, size.height * 0.7);

    canvas.drawPath(path, strokePaint);
  }
}

class OffsetPainter extends CommandPainter {
  OffsetPainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
      Offset(size.width * 0.2, size.height * 0.35),
      Offset(size.width * 0.8, size.height * 0.35),
      strokePaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.2, size.height * 0.65),
      Offset(size.width * 0.8, size.height * 0.65),
      strokePaint,
    );
  }
}

class TrimPainter extends CommandPainter {
  TrimPainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width * 0.1, size.height * 0.5);
    path.lineTo(size.width * 0.4, size.height * 0.5);
    path.moveTo(size.width * 0.6, size.height * 0.5);
    path.lineTo(size.width * 0.9, size.height * 0.5);

    path.moveTo(size.width * 0.5, size.height * 0.1);
    path.lineTo(size.width * 0.5, size.height * 0.9);

    canvas.drawPath(path, strokePaint);
  }
}

class CopyPainter extends CommandPainter {
  CopyPainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.15,
        size.height * 0.15,
        size.width * 0.5,
        size.height * 0.5,
      ),
      strokePaint,
    );
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.35,
        size.height * 0.35,
        size.width * 0.5,
        size.height * 0.5,
      ),
      strokePaint,
    );
  }
}

// ========== TEXT & ANNOTATION ==========

class TextCommandPainter extends CommandPainter {
  TextCommandPainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: 'T',
        style: TextStyle(
          color: color,
          fontSize: size.width * 0.6,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        (size.width - textPainter.width) / 2,
        (size.height - textPainter.height) / 2,
      ),
    );
  }
}

class DimensionPainter extends CommandPainter {
  DimensionPainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width * 0.2, size.height * 0.5);
    path.lineTo(size.width * 0.8, size.height * 0.5);

    path.moveTo(size.width * 0.25, size.height * 0.45);
    path.lineTo(size.width * 0.2, size.height * 0.5);
    path.lineTo(size.width * 0.25, size.height * 0.55);

    path.moveTo(size.width * 0.75, size.height * 0.45);
    path.lineTo(size.width * 0.8, size.height * 0.5);
    path.lineTo(size.width * 0.75, size.height * 0.55);

    path.moveTo(size.width * 0.2, size.height * 0.3);
    path.lineTo(size.width * 0.2, size.height * 0.7);
    path.moveTo(size.width * 0.8, size.height * 0.3);
    path.lineTo(size.width * 0.8, size.height * 0.7);

    canvas.drawPath(path, strokePaint);
  }
}

// ========== 3D COMMANDS ==========

class BoxPainter extends CommandPainter {
  BoxPainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width * 0.25, size.height * 0.4);
    path.lineTo(size.width * 0.25, size.height * 0.75);
    path.lineTo(size.width * 0.6, size.height * 0.75);
    path.lineTo(size.width * 0.6, size.height * 0.4);
    path.close();

    path.moveTo(size.width * 0.25, size.height * 0.4);
    path.lineTo(size.width * 0.45, size.height * 0.25);
    path.lineTo(size.width * 0.8, size.height * 0.25);
    path.lineTo(size.width * 0.6, size.height * 0.4);

    path.moveTo(size.width * 0.6, size.height * 0.4);
    path.lineTo(size.width * 0.8, size.height * 0.25);
    path.lineTo(size.width * 0.8, size.height * 0.6);
    path.lineTo(size.width * 0.6, size.height * 0.75);

    canvas.drawPath(path, strokePaint);
  }
}

class SpherePainter extends CommandPainter {
  SpherePainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.35;

    canvas.drawCircle(center, radius, strokePaint);

    canvas.drawOval(
      Rect.fromCenter(center: center, width: radius * 2, height: radius * 0.6),
      strokePaint,
    );

    canvas.drawOval(
      Rect.fromCenter(center: center, width: radius * 0.6, height: radius * 2),
      strokePaint,
    );
  }
}

class CylinderPainter extends CommandPainter {
  CylinderPainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(
      Rect.fromLTWH(
        size.width * 0.2,
        size.height * 0.15,
        size.width * 0.6,
        size.height * 0.2,
      ),
      strokePaint,
    );

    canvas.drawLine(
      Offset(size.width * 0.2, size.height * 0.25),
      Offset(size.width * 0.2, size.height * 0.75),
      strokePaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.8, size.height * 0.25),
      Offset(size.width * 0.8, size.height * 0.75),
      strokePaint,
    );

    canvas.drawOval(
      Rect.fromLTWH(
        size.width * 0.2,
        size.height * 0.65,
        size.width * 0.6,
        size.height * 0.2,
      ),
      strokePaint,
    );
  }
}

// ========== FILE OPERATIONS ==========

class SavePainter extends CommandPainter {
  SavePainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width * 0.2, size.height * 0.15);
    path.lineTo(size.width * 0.7, size.height * 0.15);
    path.lineTo(size.width * 0.85, size.height * 0.3);
    path.lineTo(size.width * 0.85, size.height * 0.85);
    path.lineTo(size.width * 0.2, size.height * 0.85);
    path.close();

    path.moveTo(size.width * 0.3, size.height * 0.15);
    path.lineTo(size.width * 0.3, size.height * 0.35);
    path.lineTo(size.width * 0.6, size.height * 0.35);
    path.lineTo(size.width * 0.6, size.height * 0.15);

    canvas.drawPath(path, strokePaint);
  }
}

class OpenPainter extends CommandPainter {
  OpenPainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width * 0.15, size.height * 0.35);
    path.lineTo(size.width * 0.15, size.height * 0.75);
    path.lineTo(size.width * 0.85, size.height * 0.75);
    path.lineTo(size.width * 0.85, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.25);
    path.lineTo(size.width * 0.4, size.height * 0.35);
    path.close();

    canvas.drawPath(path, strokePaint);
  }
}

class NewPainter extends CommandPainter {
  NewPainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width * 0.25, size.height * 0.15);
    path.lineTo(size.width * 0.6, size.height * 0.15);
    path.lineTo(size.width * 0.75, size.height * 0.3);
    path.lineTo(size.width * 0.75, size.height * 0.85);
    path.lineTo(size.width * 0.25, size.height * 0.85);
    path.close();

    path.moveTo(size.width * 0.5, size.height * 0.4);
    path.lineTo(size.width * 0.5, size.height * 0.7);
    path.moveTo(size.width * 0.35, size.height * 0.55);
    path.lineTo(size.width * 0.65, size.height * 0.55);

    canvas.drawPath(path, strokePaint);
  }
}

class PrintPainter extends CommandPainter {
  PrintPainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width * 0.3, size.height * 0.15);
    path.lineTo(size.width * 0.7, size.height * 0.15);
    path.lineTo(size.width * 0.7, size.height * 0.35);

    path.moveTo(size.width * 0.2, size.height * 0.35);
    path.lineTo(size.width * 0.8, size.height * 0.35);
    path.lineTo(size.width * 0.8, size.height * 0.6);
    path.lineTo(size.width * 0.2, size.height * 0.6);
    path.close();

    path.moveTo(size.width * 0.3, size.height * 0.6);
    path.lineTo(size.width * 0.3, size.height * 0.85);
    path.lineTo(size.width * 0.7, size.height * 0.85);
    path.lineTo(size.width * 0.7, size.height * 0.6);

    canvas.drawPath(path, strokePaint);
  }
}

class ExportPainter extends CommandPainter {
  ExportPainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width * 0.5, size.height * 0.2);
    path.lineTo(size.width * 0.5, size.height * 0.7);

    path.moveTo(size.width * 0.35, size.height * 0.35);
    path.lineTo(size.width * 0.5, size.height * 0.2);
    path.lineTo(size.width * 0.65, size.height * 0.35);

    path.moveTo(size.width * 0.2, size.height * 0.8);
    path.lineTo(size.width * 0.8, size.height * 0.8);

    canvas.drawPath(path, strokePaint);
  }
}

// ========== VIEW COMMANDS ==========

class ZoomPainter extends CommandPainter {
  ZoomPainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      Offset(size.width * 0.45, size.height * 0.45),
      size.width * 0.25,
      strokePaint,
    );

    final path = Path();
    path.moveTo(size.width * 0.6, size.height * 0.6);
    path.lineTo(size.width * 0.8, size.height * 0.8);
    canvas.drawPath(path, strokePaint);

    path.moveTo(size.width * 0.45, size.height * 0.35);
    path.lineTo(size.width * 0.45, size.height * 0.55);
    path.moveTo(size.width * 0.35, size.height * 0.45);
    path.lineTo(size.width * 0.55, size.height * 0.45);
    canvas.drawPath(path, strokePaint);
  }
}

class PanPainter extends CommandPainter {
  PanPainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    final length = size.width * 0.25;

    path.moveTo(center.dx, center.dy - length);
    path.lineTo(center.dx, center.dy);
    path.moveTo(center.dx, center.dy + length);
    path.lineTo(center.dx, center.dy);
    path.moveTo(center.dx - length, center.dy);
    path.lineTo(center.dx, center.dy);
    path.moveTo(center.dx + length, center.dy);
    path.lineTo(center.dx, center.dy);

    canvas.drawPath(path, strokePaint);
  }
}

// ========== EDIT OPERATIONS ==========

class UndoPainter extends CommandPainter {
  UndoPainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final rect = Rect.fromLTWH(
      size.width * 0.2,
      size.height * 0.3,
      size.width * 0.6,
      size.height * 0.4,
    );
    path.addArc(rect, math.pi * 0.5, math.pi);

    path.moveTo(size.width * 0.2, size.height * 0.5);
    path.lineTo(size.width * 0.3, size.height * 0.4);
    path.moveTo(size.width * 0.2, size.height * 0.5);
    path.lineTo(size.width * 0.3, size.height * 0.6);

    canvas.drawPath(path, strokePaint);
  }
}

class RedoPainter extends CommandPainter {
  RedoPainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final rect = Rect.fromLTWH(
      size.width * 0.2,
      size.width * 0.3,
      size.width * 0.6,
      size.height * 0.4,
    );
    path.addArc(rect, -math.pi * 0.5, -math.pi);

    path.moveTo(size.width * 0.8, size.height * 0.5);
    path.lineTo(size.width * 0.7, size.height * 0.4);
    path.moveTo(size.width * 0.8, size.height * 0.5);
    path.lineTo(size.width * 0.7, size.height * 0.6);

    canvas.drawPath(path, strokePaint);
  }
}

class DeletePainter extends CommandPainter {
  DeletePainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width * 0.25, size.height * 0.25);
    path.lineTo(size.width * 0.75, size.height * 0.75);
    path.moveTo(size.width * 0.75, size.height * 0.25);
    path.lineTo(size.width * 0.25, size.height * 0.75);

    canvas.drawPath(path, strokePaint);
  }
}

class ErasePainter extends CommandPainter {
  ErasePainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width * 0.2, size.height * 0.6);
    path.lineTo(size.width * 0.4, size.height * 0.3);
    path.lineTo(size.width * 0.8, size.height * 0.3);
    path.lineTo(size.width * 0.6, size.height * 0.6);
    path.close();

    path.moveTo(size.width * 0.3, size.height * 0.45);
    path.lineTo(size.width * 0.7, size.height * 0.45);

    canvas.drawPath(path, strokePaint);
  }
}

// ========== LAYER & PROPERTIES ==========

class LayerPainter extends CommandPainter {
  LayerPainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.2,
        size.height * 0.5,
        size.width * 0.6,
        size.height * 0.15,
      ),
      strokePaint,
    );
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.25,
        size.height * 0.4,
        size.width * 0.6,
        size.height * 0.15,
      ),
      strokePaint,
    );
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.3,
        size.height * 0.3,
        size.width * 0.6,
        size.height * 0.15,
      ),
      strokePaint,
    );
  }
}

class PropertiesPainter extends CommandPainter {
  PropertiesPainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final outerRadius = size.width * 0.35;
    final innerRadius = size.width * 0.2;
    final teeth = 6;

    final path = Path();
    for (int i = 0; i < teeth * 2; i++) {
      final angle = (i * math.pi / teeth) - math.pi / 2;
      final radius = i.isEven ? outerRadius : innerRadius;
      final x = center.dx + radius * math.cos(angle);
      final y = center.dy + radius * math.sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    canvas.drawPath(path, strokePaint);
    canvas.drawCircle(center, innerRadius * 0.6, strokePaint);
  }
}

class ColorPainter extends CommandPainter {
  ColorPainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final paletteRect = Rect.fromLTWH(
      size.width * 0.15,
      size.height * 0.25,
      size.width * 0.7,
      size.height * 0.5,
    );

    canvas.drawOval(paletteRect, strokePaint);

    final wellRadius = size.width * 0.08;
    canvas.drawCircle(
      Offset(size.width * 0.35, size.height * 0.4),
      wellRadius,
      strokePaint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.65, size.height * 0.4),
      wellRadius,
      strokePaint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.6),
      wellRadius,
      strokePaint,
    );
  }
}

// ========== RENDER & 3D OPERATIONS ==========

class RenderPainter extends CommandPainter {
  RenderPainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final innerRadius = size.width * 0.15;
    final outerRadius = size.width * 0.35;

    canvas.drawCircle(center, innerRadius, strokePaint);

    final path = Path();
    for (int i = 0; i < 8; i++) {
      final angle = i * math.pi / 4;
      final innerX = center.dx + innerRadius * math.cos(angle);
      final innerY = center.dy + innerRadius * math.sin(angle);
      final outerX = center.dx + outerRadius * math.cos(angle);
      final outerY = center.dy + outerRadius * math.sin(angle);

      path.moveTo(innerX, innerY);
      path.lineTo(outerX, outerY);
    }
    canvas.drawPath(path, strokePaint);
  }
}

class ExtrudePainter extends CommandPainter {
  ExtrudePainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    // 2D shape
    path.moveTo(size.width * 0.15, size.height * 0.4);
    path.lineTo(size.width * 0.15, size.height * 0.7);
    path.lineTo(size.width * 0.35, size.height * 0.7);
    path.lineTo(size.width * 0.35, size.height * 0.4);
    path.close();

    // Arrow
    path.moveTo(size.width * 0.4, size.height * 0.55);
    path.lineTo(size.width * 0.5, size.height * 0.55);
    path.moveTo(size.width * 0.45, size.height * 0.5);
    path.lineTo(size.width * 0.5, size.height * 0.55);
    path.lineTo(size.width * 0.45, size.height * 0.6);

    // 3D shape
    path.moveTo(size.width * 0.55, size.height * 0.4);
    path.lineTo(size.width * 0.55, size.height * 0.7);
    path.lineTo(size.width * 0.75, size.height * 0.7);
    path.lineTo(size.width * 0.75, size.height * 0.4);
    path.close();

    path.moveTo(size.width * 0.55, size.height * 0.4);
    path.lineTo(size.width * 0.65, size.height * 0.3);
    path.lineTo(size.width * 0.85, size.height * 0.3);
    path.lineTo(size.width * 0.75, size.height * 0.4);

    path.moveTo(size.width * 0.75, size.height * 0.4);
    path.lineTo(size.width * 0.85, size.height * 0.3);
    path.lineTo(size.width * 0.85, size.height * 0.6);
    path.lineTo(size.width * 0.75, size.height * 0.7);

    canvas.drawPath(path, strokePaint);
  }
}

// ========== SELECTION ==========

class SelectPainter extends CommandPainter {
  SelectPainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width * 0.2, size.height * 0.2);
    path.lineTo(size.width * 0.8, size.height * 0.2);
    path.lineTo(size.width * 0.8, size.height * 0.8);
    path.lineTo(size.width * 0.2, size.height * 0.8);
    path.close();

    canvas.drawPath(path, strokePaint);

    final handleSize = size.width * 0.05;
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width * 0.2, size.height * 0.2),
        width: handleSize,
        height: handleSize,
      ),
      Paint()
        ..color = color
        ..style = PaintingStyle.fill,
    );
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width * 0.8, size.height * 0.8),
        width: handleSize,
        height: handleSize,
      ),
      Paint()
        ..color = color
        ..style = PaintingStyle.fill,
    );
  }
}

class GroupPainter extends CommandPainter {
  GroupPainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      Offset(size.width * 0.35, size.height * 0.35),
      size.width * 0.15,
      strokePaint,
    );

    final path = Path();
    path.moveTo(size.width * 0.5, size.height * 0.5);
    path.lineTo(size.width * 0.8, size.height * 0.5);
    path.lineTo(size.width * 0.8, size.height * 0.8);
    path.lineTo(size.width * 0.5, size.height * 0.8);
    path.close();

    path.moveTo(size.width * 0.15, size.height * 0.15);
    path.lineTo(size.width * 0.85, size.height * 0.15);
    path.lineTo(size.width * 0.85, size.height * 0.85);
    path.lineTo(size.width * 0.15, size.height * 0.85);
    path.close();

    canvas.drawPath(path, strokePaint);
  }
}

// ========== GENERIC FALLBACK ==========

class FallbackPainter extends CommandPainter {
  FallbackPainter({required super.color, required super.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.25,
        size.height * 0.25,
        size.width * 0.5,
        size.height * 0.5,
      ),
      strokePaint,
    );

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width * 0.1,
      Paint()
        ..color = color
        ..style = PaintingStyle.fill,
    );
  }
}
