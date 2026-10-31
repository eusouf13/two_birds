import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_images/app_images.dart';

class RideMapPreviewWidget extends StatelessWidget {
  final String title;
  final double height;

  const RideMapPreviewWidget({
    super.key,
    this.title = 'Where are you going?',
    this.height = 400,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFF111E2A),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF1E3243), width: 1),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Background map
          Positioned.fill(
            child: Image.asset(
              AppImages.darkMap,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return CustomPaint(painter: _FallbackMapPainter());
              },
            ),
          ),

          // Dark gradient scrim overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.6),
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.4),
                  ],
                ),
              ),
            ),
          ),

          // Route Line & Pins Overlay
          Positioned.fill(child: CustomPaint(painter: _RouteLinePainter())),

          // Title
          Positioned(
            top: 18,
            left: 18,
            right: 18,
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 19,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
                letterSpacing: -0.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RouteLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Start pin at (w*0.35, h*0.68)
    final start = Offset(size.width * 0.35, size.height * 0.68);
    // Waypoint 1
    final wp1 = Offset(size.width * 0.52, size.height * 0.64);
    // Waypoint 2
    final wp2 = Offset(size.width * 0.62, size.height * 0.48);
    // End pin at (w*0.82, h*0.32)
    final end = Offset(size.width * 0.82, size.height * 0.32);

    // Glowing shadow for path
    final glowPaint = Paint()
      ..color = const Color(0xFF2DD4BF).withValues(alpha: 0.35)
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final routePaint = Paint()
      ..color = const Color(0xFF2DD4BF)
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(start.dx, start.dy);
    path.lineTo(wp1.dx, wp1.dy);
    path.lineTo(wp2.dx, wp2.dy);
    path.lineTo(end.dx, end.dy);

    canvas.drawPath(path, glowPaint);
    canvas.drawPath(path, routePaint);

    // Draw Start Pin (pickup)
    _drawPin(canvas, start, const Color(0xFF2DD4BF));

    // Draw End Pin (destination)
    _drawPin(canvas, end, const Color(0xFF2DD4BF));
  }

  void _drawPin(Canvas canvas, Offset offset, Color color) {
    final outerPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final innerPaint = Paint()
      ..color = const Color(0xFF09141E)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(offset, 8, outerPaint);
    canvas.drawCircle(offset, 4, innerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _FallbackMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bgPaint = Paint()..color = const Color(0xFF0C1722);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgPaint);

    final roadPaint = Paint()
      ..color = const Color(0xFF182837)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final majorRoadPaint = Paint()
      ..color = const Color(0xFF203447)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    // Grid lines resembling street networks
    for (double y = 20; y < size.height; y += 35) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y + 10), roadPaint);
    }
    for (double x = 20; x < size.width; x += 45) {
      canvas.drawLine(Offset(x, 0), Offset(x - 20, size.height), roadPaint);
    }

    // Diagonal major avenue
    canvas.drawLine(
      Offset(0, size.height * 0.8),
      Offset(size.width, size.height * 0.2),
      majorRoadPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
