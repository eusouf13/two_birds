import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/app_colors/app_colors.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  int _selectedPlanIndex = 1; // 0: Monthly, 1: Yearly (Save 50%)

  final List<String> _features = [
    'See more matches',
    'Priority in discovery',
    'Advanced route filters',
    'See who liked you',
    'Unlimited messaging',
    'Ad-free experience',
  ];

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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Golden Crown Badge
              Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(
                  color: Color(0xFFFBBF24),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.workspace_premium_rounded,
                    color: Color(0xFF1E293B),
                    size: 36,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Title
              Text(
                'Two Birds Premium',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                  letterSpacing: -0.3,
                ),
              ),

              const SizedBox(height: 28),

              // Features List
              Column(
                children: _features.map((feature) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7.0),
                    child: Row(
                      children: [
                        Container(
                          width: 22,
                          height: 22,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.check_rounded,
                              color: Color(0xFF07141E),
                              size: 14,
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Text(
                          feature,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 32),

              // Pricing Plans Row (Monthly vs Yearly)
              Row(
                children: [
                  // Monthly Option
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedPlanIndex = 0),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: 110,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFF101D28),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: _selectedPlanIndex == 0 ? AppColors.primary : const Color(0xFF1B2F3F),
                            width: _selectedPlanIndex == 0 ? 1.8 : 1,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Monthly',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.grey_03,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '\$9.99/mo',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 14),

                  // Yearly Option (Save 50%)
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedPlanIndex = 1),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: 110,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFF101D28),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: _selectedPlanIndex == 1 ? AppColors.primary : const Color(0xFF1B2F3F),
                            width: _selectedPlanIndex == 1 ? 1.8 : 1,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Yearly',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.grey_03,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '\$59.99/yr',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'Save 50%',
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // Start Free Trial Button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                    Get.snackbar(
                      'Welcome to Premium!',
                      'Your 7-day free trial has been activated.',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: const Color(0xFF13222E),
                      colorText: AppColors.white,
                    );
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
                    'Start Free Trial',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              // Footer Text
              Text(
                '7 days free. Cancel anytime.',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey_03,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Restore Purchases  |  Terms  |  Privacy',
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyLight,
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

