import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_strings/app_strings.dart';
import '../widget/ride_buddy_action_buttons_widget.dart';
import '../widget/ride_buddy_card_widget.dart';

class RideBuddiesScreen extends StatefulWidget {
  const RideBuddiesScreen({super.key});

  @override
  State<RideBuddiesScreen> createState() => _RideBuddiesScreenState();
}

class _RideBuddiesScreenState extends State<RideBuddiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Top Navigation Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.white, size: 20),
                    onPressed: () => Get.back(),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        AppStrings.findYourRideBuddies,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // Balance back button
                ],
              ),
            ),

            // Profile Card (takes dominant screen height)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.buddyDetailsScreen);
                  },
                  child: const RideBuddyCardWidget(),
                ),
              ),
            ),

            // Action Buttons (Pass, Info, Like)
            RideBuddyActionButtonsWidget(
              onPass: () {
                Get.toNamed(AppRoutes.homeScreen);
              },
              onInfo: () {
                Get.toNamed(AppRoutes.buddyDetailsScreen);
              },
              onLike: () {
                // Navigate to match confirmation celebration!
                Get.toNamed(AppRoutes.matchConfirmationScreen);
              },
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

