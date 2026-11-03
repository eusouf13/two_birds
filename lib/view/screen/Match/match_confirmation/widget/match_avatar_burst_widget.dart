import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_images/app_images.dart';

class MatchAvatarBurstWidget extends StatelessWidget {
  final String userImage;
  final String matchImage;
  final String matchName;

  const MatchAvatarBurstWidget({
    super.key,
    this.userImage = AppImages.userAvatar,
    this.matchImage = AppImages.sarah,
    this.matchName = 'Jasmine',
  });

  @override
  Widget build(BuildContext context) {
    const double avatarRadius = 54;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Overlapping Avatars with Center Cyan Heart Badge & Radiating Sparks
        SizedBox(
          width: 250,
          height: 140,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              // Radiating Cyan Sparks / Burst Accents
              // Top Left Spark
              Positioned(
                top: 8,
                left: 18,
                child: Transform.rotate(
                  angle: -0.6,
                  child: Container(
                    width: 14,
                    height: 3.5,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
              // Top Right Spark
              Positioned(
                top: 8,
                right: 18,
                child: Transform.rotate(
                  angle: 0.6,
                  child: Container(
                    width: 14,
                    height: 3.5,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
              // Mid Left Spark
              Positioned(
                bottom: 24,
                left: 8,
                child: Transform.rotate(
                  angle: 0.7,
                  child: Container(
                    width: 16,
                    height: 3.5,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
              // Mid Right Spark
              Positioned(
                bottom: 24,
                right: 8,
                child: Transform.rotate(
                  angle: -0.7,
                  child: Container(
                    width: 16,
                    height: 3.5,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),

              // Left Avatar (Jasmine)
              Positioned(
                left: 20,
                child: _buildAvatar(matchImage, avatarRadius),
              ),

              // Right Avatar (User / Alex)
              Positioned(
                right: 20,
                child: _buildAvatar(userImage, avatarRadius),
              ),

              // Center Cyan Heart Badge (Screenshot 1)
              Positioned(
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.background,
                      width: 3.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.4),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.favorite_rounded,
                      color: Color(0xFF042F2C),
                      size: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 28),

        // Headline: "It's a Match!"
        Text(
          "It's a Match!",
          style: GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
            letterSpacing: -0.4,
          ),
        ),

        const SizedBox(height: 10),

        // Subtitle (Screenshot 1 layout)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Text(
            'You and $matchName are headed the same way and share 3 interests: Travel, Music, Fitness.',
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
        border: Border.all(color: Colors.white, width: 3.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.45),
            blurRadius: 14,
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
