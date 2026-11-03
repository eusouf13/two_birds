import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_images/app_images.dart';
import '../widget/confetti_painter_widget.dart';
import '../widget/match_avatar_burst_widget.dart';
import '../widget/match_confirmation_actions_widget.dart';

class MatchConfirmationScreen extends StatelessWidget {
  const MatchConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.white, size: 20),
          onPressed: () => Get.back(),
        ),
      ),
      body: ConfettiPainterWidget(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              children: [
                const Spacer(flex: 2),

                // Overlapping Match Avatars + Celebration Title & Subtitle
                const MatchAvatarBurstWidget(),

                const Spacer(flex: 3),

                // Action Buttons
                MatchConfirmationActionsWidget(
                  onSendMessage: () {
                    Get.toNamed(AppRoutes.chatInboxScreen, arguments: {
                      'name': 'Jasmine, 27',
                      'avatar': AppImages.sarah,
                      'status': 'Online',
                    });
                  },
                  onViewRideDetails: () {
                    Get.toNamed(AppRoutes.rideDetailsScreen);
                  },
                ),

                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

