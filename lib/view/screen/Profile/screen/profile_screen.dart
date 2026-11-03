import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
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
    final List<Map<String, dynamic>> interestItems = [
      {'label': 'Travel', 'icon': Icons.flight_rounded},
      {'label': 'Music', 'icon': Icons.music_note_rounded},
      {'label': 'Fitness', 'icon': Icons.fitness_center_rounded},
      {'label': 'Foodie', 'icon': Icons.restaurant_rounded},
      {'label': 'Sports', 'icon': Icons.sports_basketball_rounded},
      {'label': 'Outdoors', 'icon': Icons.terrain_rounded},
      {'label': 'Tech', 'icon': Icons.laptop_mac_rounded},
    ];

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
          IconButton(
            icon: const Icon(Icons.edit_note_rounded, color: AppColors.white, size: 24),
            tooltip: 'Edit Profile',
            onPressed: () => Get.to(() => const EditProfileScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar with camera badge
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white.withValues(alpha: 0.8), width: 2.5),
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
                      width: 28,
                      height: 28,
                      decoration: const BoxDecoration(
                        color: Color(0xFF142434),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(Icons.camera_alt_rounded, color: Colors.white, size: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Name, Age & Verified Badge
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Alex, 28',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(
                  Icons.verified,
                  color: AppColors.primary,
                  size: 20,
                ),
              ],
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
              'Washington, DC',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.greyLight,
              ),
            ),

            const SizedBox(height: 18),

            // Stats Row: 24 Rides, 12 Matches, 4.9 Rating
            Row(
              children: [
                _buildStatCard(value: '24', label: 'Rides'),
                const SizedBox(width: 12),
                _buildStatCard(value: '12', label: 'Matches'),
                const SizedBox(width: 12),
                _buildStatCard(value: '4.9', label: 'Rating'),
              ],
            ),

            const SizedBox(height: 20),

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
                'Designer, foodie, hoop lover, and always down for a good ride and great conversation.',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey_03,
                  height: 1.45,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Interests Section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Interests',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ...interestItems.map((item) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0E1A26),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: const Color(0xFF1B2C3C), width: 1),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            item['icon'] as IconData,
                            size: 14,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            item['label'] as String,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0E1A26),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: const Color(0xFF1B2C3C), width: 1),
                    ),
                    child: Text(
                      '+2',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey_03,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // Connected Accounts Section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Connected Accounts',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF0E1A26),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF1B2C3C), width: 1),
              ),
              child: Column(
                children: [
                  _buildConnectedAccountTile(
                    svgIcon: AppIcons.instagram,
                    platform: 'Instagram',
                    handle: '@alex.designs',
                    isConnected: true,
                  ),
                  const Divider(color: Color(0xFF162534), height: 1, thickness: 1),
                  _buildConnectedAccountTile(
                    svgIcon: AppIcons.tiktok,
                    platform: 'TikTok',
                    handle: '@alexrides',
                    isConnected: true,
                  ),
                ],
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
                    icon: Icons.person_add_alt_1_outlined,
                    title: 'Rider Match Profile Setup',
                    onTap: () => Get.toNamed(AppRoutes.profileSetupScreen),
                  ),
                  const Divider(color: Color(0xFF1C2F3F), height: 1),
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

  Widget _buildStatCard({required String value, required String label}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFF0E1A26),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFF1B2C3C), width: 1),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.grey_03,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConnectedAccountTile({
    required String svgIcon,
    required String platform,
    required String handle,
    required bool isConnected,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SvgPicture.asset(
              svgIcon,
              width: 36,
              height: 36,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  platform,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  handle,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey_03,
                  ),
                ),
              ],
            ),
          ),
          if (isConnected)
            Container(
              width: 22,
              height: 22,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Color(0xFF042F2C),
                size: 14,
              ),
            ),
        ],
      ),
    );
  }
}
