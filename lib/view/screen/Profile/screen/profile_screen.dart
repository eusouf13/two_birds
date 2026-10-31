import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_images/app_images.dart';
import 'account_screen.dart';
import 'edit_profile_screen.dart';
import 'help_support_screen.dart';
import 'privacy_policy_screen.dart';
import 'safety_verification_screen.dart';
import 'subscription_screen.dart';
import 'terms_of_service_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final interests = ['Travel', 'Food', 'Music', 'Hiking', 'Dogs'];

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
          'My Profile',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.to(() => const EditProfileScreen()),
            child: Text(
              'Edit',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar with camera badge (Image 1)
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primary, width: 2.5),
                    ),
                    child: const CircleAvatar(
                      radius: 46,
                      backgroundImage: AssetImage(AppImages.userAvatar),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: Color(0xFF0F766E),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(Icons.camera_alt_rounded, color: Colors.white, size: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // Name & Age
            Text(
              'Alex, 27',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),

            const SizedBox(height: 2),

            // Role
            Text(
              'Product Designer',
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: AppColors.grey_03,
              ),
            ),

            const SizedBox(height: 2),

            // Location
            Text(
              'New York, NY',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.greyLight,
              ),
            ),

            const SizedBox(height: 16),

            // Interest Pills
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: interests.map((tag) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF13222E),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: const Color(0xFF1E3243), width: 1),
                  ),
                  child: Text(
                    tag,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 22),

            // About Me Section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'About Me',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'I love meeting new people, exploring the city, and finding good food. Always down for a great conversation!',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey_03,
                  height: 1.45,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Group 1: Account, Privacy & Safety, Notifications, Subscription (Image 2)
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF111E2A),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF1E3243), width: 1),
              ),
              child: Column(
                children: [
                  _buildNavTile(
                    icon: Icons.person_outline_rounded,
                    title: 'Account',
                    onTap: () => Get.to(() => const AccountScreen()),
                  ),
                  const Divider(color: Color(0xFF1C2F3F), height: 1),
                  _buildNavTile(
                    icon: Icons.shield_outlined,
                    title: 'Privacy & Safety',
                    onTap: () => Get.to(() => const SafetyVerificationScreen()),
                  ),
                  const Divider(color: Color(0xFF1C2F3F), height: 1),
                  _buildNavTile(
                    icon: Icons.card_membership_rounded,
                    title: 'Subscription',
                    onTap: () => Get.to(() => const SubscriptionScreen()),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Group 2: Help & Support, Terms of Service, Privacy Policy, Delete Account (Image 2)
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF111E2A),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF1E3243), width: 1),
              ),
              child: Column(
                children: [
                  _buildNavTile(
                    icon: Icons.help_outline_rounded,
                    title: 'Help & Support',
                    onTap: () => Get.to(() => const HelpSupportScreen()),
                  ),
                  const Divider(color: Color(0xFF1C2F3F), height: 1),
                  _buildNavTile(
                    icon: Icons.description_outlined,
                    title: 'Terms of Service',
                    onTap: () => Get.to(() => const TermsOfServiceScreen()),
                  ),
                  const Divider(color: Color(0xFF1C2F3F), height: 1),
                  _buildNavTile(
                    icon: Icons.privacy_tip_outlined,
                    title: 'Privacy Policy',
                    onTap: () => Get.to(() => const PrivacyPolicyScreen()),
                  ),
                  const Divider(color: Color(0xFF1C2F3F), height: 1),
                  _buildNavTile(
                    icon: Icons.delete_outline_rounded,
                    title: 'Delete Account',
                    isDestructive: true,
                    onTap: () {
                      Get.defaultDialog(
                        title: 'Delete Account',
                        titleStyle: GoogleFonts.poppins(color: const Color(0xFFEF4444), fontWeight: FontWeight.w600),
                        backgroundColor: const Color(0xFF13222E),
                        middleText: 'Are you sure you want to delete your account? This action cannot be undone.',
                        middleTextStyle: GoogleFonts.poppins(color: AppColors.white, fontSize: 13),
                        textConfirm: 'Delete',
                        confirmTextColor: Colors.white,
                        buttonColor: const Color(0xFFEF4444),
                        textCancel: 'Cancel',
                        cancelTextColor: AppColors.grey_03,
                        onConfirm: () {
                          Get.offAllNamed(AppRoutes.welcomeScreen);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildNavTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 22,
              color: isDestructive ? const Color(0xFFEF4444) : AppColors.white,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isDestructive ? const Color(0xFFEF4444) : AppColors.white,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
              color: isDestructive ? const Color(0xFFEF4444) : AppColors.greyLight,
            ),
          ],
        ),
      ),
    );
  }
}
