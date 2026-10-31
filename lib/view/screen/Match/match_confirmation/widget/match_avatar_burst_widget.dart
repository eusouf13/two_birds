import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_images/app_images.dart';
import '../../../../../utils/app_strings/app_strings.dart';

class MatchAvatarBurstWidget extends StatelessWidget {
  final String userImage;
  final String matchImage;

  const MatchAvatarBurstWidget({
    super.key,
    this.userImage = AppImages.userAvatar,
    this.matchImage = AppImages.sarah,
  });

  @override
  Widget build(BuildContext context) {
    const double avatarRadius = 54;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Overlapping Avatars
        SizedBox(
          width: 210,
          height: 120,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Left Avatar (Sarah)
              Positioned(
                left: 10,
                child: _buildAvatar(matchImage, avatarRadius),
              ),

              // Right Avatar (User)
              Positioned(
                right: 10,
                child: _buildAvatar(userImage, avatarRadius),
              ),
            ],
          ),
        ),

        const SizedBox(height: 32),

        // Headline
        Text(
          AppStrings.itsAMatch,
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
            letterSpacing: -0.3,
          ),
        ),

        const SizedBox(height: 12),

        // Subtitle
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            AppStrings.matchSubtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.grey_03,
              height: 1.45,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar(String imagePath, double radius) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.white, width: 3.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: const Color(0xFF1B2F3F),
        backgroundImage: AssetImage(imagePath),
        onBackgroundImageError: (exception, stackTrace) {},
      ),
    );
  }
}
