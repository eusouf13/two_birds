import 'package:flutter/material.dart';
import '../../../../../utils/app_images/app_images.dart';

class WelcomeBackgroundWidget extends StatelessWidget {
  final Widget child;

  const WelcomeBackgroundWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background Image with dark twilight tone blend
        Image.asset(
          AppImages.welcomeBg,
          fit: BoxFit.cover,
          color: const Color(0xFF0B1724).withValues(alpha: 0.30),
          colorBlendMode: BlendMode.darken,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF09121B),
                    Color(0xFF142433),
                    Color(0xFF221E2C),
                    Color(0xFF070E16),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            );
          },
        ),

        // Deep dark gradient overlay matching the 2nd screenshot
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFF07111A).withValues(alpha: 0.75), // Top dark vignette
                const Color(0xFF0A1622).withValues(alpha: 0.42), // Upper sky tint
                const Color(0xFF0A1622).withValues(alpha: 0.48), // Middle text backdrop
                const Color(0xFF060E15).withValues(alpha: 0.78), // Water & skyline dimming
                const Color(0xFF03070B).withValues(alpha: 0.96), // Bottom tree & button area
              ],
              stops: const [0.0, 0.22, 0.52, 0.78, 1.0],
            ),
          ),
        ),

        // Radial subtle vignette for edge darkening
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center,
              radius: 1.1,
              colors: [
                Colors.transparent,
                Colors.black.withValues(alpha: 0.35),
                Colors.black.withValues(alpha: 0.70),
              ],
              stops: const [0.4, 0.75, 1.0],
            ),
          ),
        ),

        // Foreground content
        SafeArea(
          child: child,
        ),
      ],
    );
  }
}
