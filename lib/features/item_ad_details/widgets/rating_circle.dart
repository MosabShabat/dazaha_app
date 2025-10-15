import 'dart:math' as math;
import '../../../core/constant/exports_widgets.dart';
import '../../../core/constant/exports_libraries.dart';

class RatingCircle extends StatelessWidget {
  final int rating; // 0..100

  const RatingCircle({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    final double r = 30.w;
    return SizedBox(
      width: r * 2,
      height: r * 2,
      child: CustomPaint(
        // ارسم فوق الـ CircleAvatar بدل خلفه
        foregroundPainter: _CircleBorderPainter(
          rating: rating.toDouble().clamp(0, 100),
          activeColor: context.colorsCustom.TealGreenSecondary,
          inactiveColor: context.colorsCustom.CardBorder,
          strokeWidth: 4.w,
        ),
        child: CircleAvatar(
          backgroundColor: context.colorsCustom.surfacePrimaryWhite,
          radius: r,
          child: Text(
            '${rating.clamp(0, 100)}%',
            style: context.textStyles.bodyMedium.medium.copyWith(
              color: context.colorsCustom.TextPrimary,
            ),
          ),
        ),
      ),
    );
  }
}

class _CircleBorderPainter extends CustomPainter {
  final double rating;         // 0..100
  final Color activeColor;     // اللون الفعّال
  final Color inactiveColor;   // اللون الخلفي
  final double strokeWidth;

  _CircleBorderPainter({
    required this.rating,
    required this.activeColor,
    required this.inactiveColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - strokeWidth / 2;

    final startAngle = -math.pi / 2;               // من الأعلى
    final sweepAngle = (rating / 100) * 2 * math.pi;

    final paintBg = Paint()
      ..isAntiAlias = true
      ..color = inactiveColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;                // خلفية كاملة بدون نهايات مدورة

    final paintActive = Paint()
      ..isAntiAlias = true
      ..color = activeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;               // نهايات ناعمة

    // الخلفية (الدائرة الكاملة)
    canvas.drawCircle(center, radius, paintBg);

    // الجزء الفعّال (حسب النسبة)
    if (sweepAngle > 0) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paintActive,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
