import 'package:dazaha_app/core/constant/exports_libraries.dart';

class JaggedEdgePainter extends CustomPainter {
  final Color color;
  final bool isTop; // To draw jagged edge at top or bottom

  JaggedEdgePainter(this.color, {required this.isTop});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    if (isTop) {
      // Draw top jagged edge
      path.moveTo(0, size.height); // Start from bottom-left of the paint area
      final double toothWidth = 8.5.w; // Adjust as needed
      final double toothHeight = 7.h; // Adjust as needed

      for (double i = 0; i < size.width; i += toothWidth) {
        if ((i / toothWidth).toInt() % 2 == 0) {
          path.lineTo(i + toothWidth / 2, size.height - toothHeight);
        } else {
          path.lineTo(i + toothWidth / 2, size.height);
        }
      }
      path.lineTo(size.width, size.height); // End at bottom-right
      path.lineTo(size.width, 0); // Go up to top-right
      path.lineTo(0, 0); // Go across to top-left
      path.close(); // Close the path
    } else {
      // Draw bottom jagged edge (similar logic, but inverted)
      path.moveTo(0, 0); // Start from top-left of the paint area
      final double toothWidth = 10.w; // Adjust as needed
      final double toothHeight = 4.h; // Adjust as needed

      for (double i = 0; i < size.width; i += toothWidth) {
        if ((i / toothWidth).toInt() % 2 == 0) {
          path.lineTo(i + toothWidth / 2, toothHeight);
        } else {
          path.lineTo(i + toothWidth / 2, 0);
        }
      }
      path.lineTo(size.width, 0); // End at top-right
      path.lineTo(size.width, size.height); // Go down to bottom-right
      path.lineTo(0, size.height); // Go across to bottom-left
      path.close(); // Close the path
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // Only repaint if properties change
  }
}
