import 'dart:math';
import 'package:flutter/material.dart';

class ConfettiPainterWidget extends StatelessWidget {
  final Widget child;

  const ConfettiPainterWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ConfettiPainter(),
      child: child,
    );
  }
}

class _ConfettiPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * 0.36);
    final random = Random(42); // Deterministic seed matching screenshot

    final colors = [
      const Color(0xFF2DD4BF), // Cyan
      const Color(0xFFFB923C), // Orange
      const Color(0xFFFDE047), // Yellow
      const Color(0xFF38BDF8), // Sky Blue
      const Color(0xFFF43F5E), // Rose
      const Color(0xFFA78BFA), // Violet
    ];

    // Radial confetti bursts around the profile avatars
    const int count = 28;
    for (int i = 0; i < count; i++) {
      final angle = (i * (2 * pi / count)) + (random.nextDouble() * 0.2 - 0.1);
      final radius = 125.0 + (random.nextDouble() * 55.0);
      final x = center.dx + cos(angle) * radius;
      final y = center.dy + sin(angle) * radius;

      final color = colors[i % colors.length];
      final paint = Paint()
        ..color = color
        ..strokeWidth = 3.2
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke;

      // Draw little confetti sticks angled radially
      final length = 8.0 + random.nextDouble() * 7.0;
      final tilt = angle + (random.nextDouble() * 0.6 - 0.3);
      final dx = cos(tilt) * length;
      final dy = sin(tilt) * length;

      canvas.drawLine(
        Offset(x - dx / 2, y - dy / 2),
        Offset(x + dx / 2, y + dy / 2),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

