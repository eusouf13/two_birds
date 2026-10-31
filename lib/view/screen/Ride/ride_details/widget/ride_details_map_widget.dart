import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_images/app_images.dart';

class RideDetailsMapWidget extends StatelessWidget {
  final String serviceType;
  final double height;

  const RideDetailsMapWidget({
    super.key,
    this.serviceType = 'UberX',
    this.height = 210,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFF101E2B),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF1E3243), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.35),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Background Dark Map
          Positioned.fill(
            child: Image.asset(
              AppImages.darkMap,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: const Color(0xFF0F1A24),
              ),
            ),
          ),

          // Subtle gradient overlay for map contrast
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.45),
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.45),
                  ],
                ),
              ),
            ),
          ),

          // Custom Route Painter with Yellow origin pin and Red destination pin
          Positioned.fill(
            child: CustomPaint(
              painter: _RideDetailsRoutePainter(),
            ),
          ),

          // Top Left Service Badge (e.g. UberX)
          Positioned(
            top: 14,
            left: 14,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.82),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
              ),
              child: Text(
                serviceType,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RideDetailsRoutePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Points matching the screenshot route
    final start = Offset(size.width * 0.16, size.height * 0.72);
    final p1 = Offset(size.width * 0.26, size.height * 0.68);
    final p2 = Offset(size.width * 0.46, size.height * 0.82);
    final p3 = Offset(size.width * 0.58, size.height * 0.56);
    final p4 = Offset(size.width * 0.70, size.height * 0.52);
    final end = Offset(size.width * 0.78, size.height * 0.22);

    final path = Path()
      ..moveTo(start.dx, start.dy)
      ..lineTo(p1.dx, p1.dy)
      ..lineTo(p2.dx, p2.dy)
      ..lineTo(p3.dx, p3.dy)
      ..lineTo(p4.dx, p4.dy)
      ..lineTo(end.dx, end.dy);

    // Glow Shadow
    final glowPaint = Paint()
      ..color = const Color(0xFF2DD4BF).withValues(alpha: 0.35)
      ..strokeWidth = 9
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;
    canvas.drawPath(path, glowPaint);

    // Main Route Line (Cyan / Mint gradient look)
    final linePaint = Paint()
      ..color = const Color(0xFF2DD4BF)
      ..strokeWidth = 4.2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;
    canvas.drawPath(path, linePaint);

    // Draw Yellow / Orange Start Pin with circle
    final yellowGlow = Paint()
      ..color = const Color(0xFFFFB800).withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(start, 12, yellowGlow);

    final yellowOuter = Paint()
      ..color = const Color(0xFFFFB800)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(start, 7, yellowOuter);

    final yellowInner = Paint()
      ..color = const Color(0xFF1E2833)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(start, 3.2, yellowInner);

    // Draw Red Dropoff Location Pin at end point
    _drawLocationPin(canvas, end, const Color(0xFFFF4D4F));
  }

  void _drawLocationPin(Canvas canvas, Offset point, Color color) {
    // Pin shadow
    canvas.drawCircle(
      Offset(point.dx, point.dy + 8),
      6,
      Paint()
        ..color = Colors.black.withValues(alpha: 0.4)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),
    );

    // Teardrop marker
    final pinPath = Path();
    final r = 9.0;
    final center = Offset(point.dx, point.dy - 6);

    pinPath.addArc(
      Rect.fromCircle(center: center, radius: r),
      3.14159 * 0.75,
      3.14159 * 1.5,
    );
    pinPath.lineTo(point.dx, point.dy + 4);
    pinPath.close();

    final pinPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawPath(pinPath, pinPaint);

    // White dot inside pin
    canvas.drawCircle(
      center,
      3.2,
      Paint()..color = Colors.white,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

