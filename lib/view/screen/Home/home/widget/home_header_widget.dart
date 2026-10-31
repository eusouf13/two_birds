import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_images/app_images.dart';

class HomeHeaderWidget extends StatelessWidget {
  final String userName;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onProfileTap;

  const HomeHeaderWidget({
    super.key,
    this.userName = 'Alex',
    this.onNotificationTap,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Greeting & App Brand
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good evening, $userName 👋',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.grey_03,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Where to today?',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
                letterSpacing: -0.3,
              ),
            ),
          ],
        ),

        // User Avatar & Notification
        Row(
          children: [
            // Notification Bell
            GestureDetector(
              onTap: onNotificationTap,
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFF111E2A),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF1E3243), width: 1),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Icon(Icons.notifications_none_rounded, color: AppColors.white, size: 20),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 10),

            // Profile Avatar
            GestureDetector(
              onTap: onProfileTap,
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary, width: 1.5),
                ),
                child: const CircleAvatar(
                  radius: 19,
                  backgroundImage: AssetImage(AppImages.userAvatar),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

