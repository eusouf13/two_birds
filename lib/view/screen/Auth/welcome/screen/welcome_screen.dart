import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/app_routes/app_routes.dart';
import '../widget/welcome_actions_widget.dart';
import '../widget/welcome_background_widget.dart';
import '../widget/welcome_logo_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomeBackgroundWidget(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            children: [
              const Spacer(flex: 2),

              // Logo, Brand Name & Taglines
              const WelcomeLogoWidget(),

              const Spacer(flex: 3),

              // Bottom Action Buttons
              WelcomeActionsWidget(
                onGetStarted: () {
                  // New flow: Get Started navigates to Onboarding (2 pages)
                  Get.toNamed(AppRoutes.onboardingScreen);
                },
                onSignIn: () {
                  // Sign In navigates directly to Login
                  Get.toNamed(AppRoutes.loginScreen);
                },
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
