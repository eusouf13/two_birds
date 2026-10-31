import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/app_colors/app_colors.dart';

class SafetyVerificationScreen extends StatelessWidget {
  const SafetyVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.white, size: 18),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Safety & Verification',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Column(
          children: [
            // Group 1: Verifications (Phone, Photo)
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF111E2A),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF1E3243), width: 1),
              ),
              child: Column(
                children: [
                  _buildVerificationTile(
                    icon: Icons.phone_android_rounded,
                    title: 'Verified Phone',
                    subtitle: '+1 (555) 123-4567',
                    isVerified: true,
                  ),
                  const Divider(color: Color(0xFF1C2F3F), height: 1),
                  _buildVerificationTile(
                    icon: Icons.photo_camera_rounded,
                    title: 'Photo Verified',
                    subtitle: 'Verified',
                    isVerified: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Group 2: Safety Features (Safety Tips, Block & Report, Share Trip)
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF111E2A),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF1E3243), width: 1),
              ),
              child: Column(
                children: [
                  _buildActionTile(
                    icon: Icons.notifications_active_rounded,
                    title: 'Safety Tips',
                    subtitle: 'Ride together safely',
                    onTap: () {
                      Get.defaultDialog(
                        title: 'Safety Tips',
                        titleStyle: GoogleFonts.poppins(color: AppColors.white, fontWeight: FontWeight.w600),
                        backgroundColor: const Color(0xFF13222E),
                        content: Text(
                          '1. Verify your buddy before riding.\n2. Share trip status with friends.\n3. Always meet in well-lit public spots.',
                          style: GoogleFonts.poppins(color: AppColors.grey_03, fontSize: 13),
                        ),
                      );
                    },
                  ),
                  const Divider(color: Color(0xFF1C2F3F), height: 1),
                  _buildActionTile(
                    icon: Icons.person_off_rounded,
                    title: 'Block & Report',
                    subtitle: 'Keep our community safe',
                    onTap: () {
                      Get.snackbar(
                        'Block & Report',
                        'You have no blocked users.',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: const Color(0xFF13222E),
                        colorText: AppColors.white,
                      );
                    },
                  ),
                  const Divider(color: Color(0xFF1C2F3F), height: 1),
                  _buildActionTile(
                    icon: Icons.share_location_rounded,
                    title: 'Share Trip',
                    subtitle: 'Share ride details with a friend',
                    onTap: () {
                      Get.snackbar(
                        'Share Trip',
                        'Live trip sharing link copied to clipboard.',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: const Color(0xFF13222E),
                        colorText: AppColors.white,
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildVerificationTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isVerified,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primary, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey_03,
                  ),
                ),
              ],
            ),
          ),
          if (isVerified)
            Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_rounded,
                color: Color(0xFF07141E),
                size: 16,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.primary, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey_03,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.greyLight,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}

