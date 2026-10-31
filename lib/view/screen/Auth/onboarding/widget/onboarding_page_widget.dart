import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../utils/app_colors/app_colors.dart';

class OnboardingPageWidget extends StatelessWidget {
  final Widget visual;
  final String title;
  final String description;

  const OnboardingPageWidget({
    super.key,
    required this.visual,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Visual graphic container
          visual,

          const SizedBox(height: 40),

          // Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
              letterSpacing: -0.3,
            ),
          ),

          const SizedBox(height: 14),

          // Description
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.grey_03,
              height: 1.55,
            ),
          ),
        ],
      ),
    );
  }
}

