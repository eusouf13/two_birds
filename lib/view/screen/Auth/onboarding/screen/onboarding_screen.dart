import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_images/app_images.dart';
import '../widget/onboarding_indicator_widget.dart';
import '../widget/onboarding_page_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _goToLogin() {
    Get.offNamed(AppRoutes.loginScreen);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar with Skip Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.white, size: 18),
                    onPressed: () {
                      if (_currentPage > 0) {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Get.back();
                      }
                    },
                  ),

                  // Skip Button
                  TextButton(
                    onPressed: _goToLogin,
                    child: Text(
                      'Skip',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey_03,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // PageView Content
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                children: [
                  // Page 1: Share Rides & Split Costs
                  OnboardingPageWidget(
                    visual: _buildPage1Visual(),
                    title: 'Share Rides, Split Costs',
                    description:
                        'Find neighbors and colleagues heading the exact same direction on Uber or Lyft. Cut your daily commute fare up to 50%.',
                  ),

                  // Page 2: Verified Buddies & Safe Travel
                  OnboardingPageWidget(
                    visual: _buildPage2Visual(),
                    title: 'Travel With Verified Buddies',
                    description:
                        'Connect with verified profiles from your industry or neighborhood. Safe, friendly, and much better company every ride.',
                  ),
                ],
              ),
            ),

            // Page Indicator Dots
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: OnboardingIndicatorWidget(
                count: 2,
                currentIndex: _currentPage,
              ),
            ),

            // Bottom Action Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    if (_currentPage == 0) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      // 2nd page completes onboarding -> navigate to Login
                      _goToLogin();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: const Color(0xFF07141E),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27),
                    ),
                  ),
                  child: Text(
                    _currentPage == 0 ? 'Next' : 'Get Started',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Visual graphic for Page 1 (Car & Ride route)
  Widget _buildPage1Visual() {
    return Container(
      width: 240,
      height: 240,
      decoration: BoxDecoration(
        color: const Color(0xFF111E2A),
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFF1E3243), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.12),
            blurRadius: 32,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.carSilver,
              width: 130,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.directions_car_rounded,
                size: 72,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.alt_route_rounded, color: AppColors.primary, size: 16),
                  const SizedBox(width: 6),
                  Text(
                    'Uber & Lyft Shared',
                    style: GoogleFonts.poppins(
                      color: AppColors.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Visual graphic for Page 2 (Verified Ride Buddies)
  Widget _buildPage2Visual() {
    return Container(
      width: 240,
      height: 240,
      decoration: BoxDecoration(
        color: const Color(0xFF111E2A),
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFF1E3243), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.12),
            blurRadius: 32,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Avatar 1
            Transform.translate(
              offset: const Offset(-28, -10),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary, width: 2.5),
                ),
                child: const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(AppImages.sarah),
                ),
              ),
            ),

            // Avatar 2
            Transform.translate(
              offset: const Offset(32, 14),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white, width: 2.5),
                ),
                child: const CircleAvatar(
                  radius: 36,
                  backgroundImage: AssetImage(AppImages.userAvatar),
                ),
              ),
            ),

            // Shield / Verified Icon Badge
            Positioned(
              bottom: 24,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF09141E),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.primary, width: 1),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.verified_user_rounded, color: AppColors.primary, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      '100% Verified',
                      style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

