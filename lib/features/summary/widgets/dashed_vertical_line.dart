
import 'package:dazaha_app/core/constant/exports_libraries.dart';

class DashedVerticalLine extends StatelessWidget {
  final double height;
  final double dashHeight;
  final double dashGap;
  final Color color;

  const DashedVerticalLine({
    Key? key,
    required this.height,
    this.dashHeight = 4,
    this.dashGap = 4,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(1, height),
      painter: _DashedLinePainter(
        dashHeight: dashHeight,
        dashGap: dashGap,
        color: color,
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final double dashHeight;
  final double dashGap;
  final Color color;

  _DashedLinePainter({
    required this.dashHeight,
    required this.dashGap,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashGap;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
