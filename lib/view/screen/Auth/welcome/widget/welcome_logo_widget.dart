import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_images/app_images.dart';

class WelcomeLogoWidget extends StatelessWidget {
  const WelcomeLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Two Birds Brand Header (Left-aligned 'Two' & 'Birds' with Bird Icon nestled on top right)
        SizedBox(
          width: 195,
          height: 108,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // 'Two' and 'Birds' text strictly left-aligned
              Positioned(
                left: 35,
                top: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Two',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 52,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                        height: 0.94,
                        letterSpacing: -0.5,
                      ),
                    ),
                    Text(
                      'Birds',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 52,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                        height: 0.94,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
              ),

              // Vivid high-res bird logo positioned to the right of 'Two' and above 'Birds'
              Positioned(
                left: 130,
                top: -30,
                child: Image.asset(
                  AppImages.birdsLogo,
                  width: 80,
                  height: 58,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),

        // Tagline - bold white centered
        Text(
          'Same Ride. Better Company.',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
            letterSpacing: 0.2,
          ),
        ),

        const SizedBox(height: 30),

        // Subtitle - two lines centered
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'Meet people heading the same way\nwith Uber or Lyft.',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white.withValues(alpha: 0.90),
              height: 1.45,
            ),
          ),
        ),
      ],
    );
  }
}
