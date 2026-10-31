import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../utils/app_colors/app_colors.dart';

class RegisterHeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const RegisterHeaderWidget({
    super.key,
    this.title = 'Create Account',
    this.subtitle = 'Join Two Birds and connect with riders today.',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.grey_03,
          ),
        ),
      ],
    );
  }
}

