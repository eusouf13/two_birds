import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_strings/app_strings.dart';
import '../widget/ride_feature_item_widget.dart';
import '../widget/ride_options_app_bar_widget.dart';
import '../widget/ride_service_card_widget.dart';

class RideOptionsScreen extends StatefulWidget {
  const RideOptionsScreen({super.key});

  @override
  State<RideOptionsScreen> createState() => _RideOptionsScreenState();
}

class _RideOptionsScreenState extends State<RideOptionsScreen> {
  RideServiceType _selectedService = RideServiceType.uber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            const RideOptionsAppBarWidget(),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Uber & Lyft Option Cards (Increased height to 220)
                    Row(
                      children: [
                        RideServiceCardWidget(
                          height: 220,
                          serviceType: RideServiceType.uber,
                          price: '\$24–28',
                          duration: '~32 min',
                          isSelected: _selectedService == RideServiceType.uber,
                          onTap: () {
                            setState(() => _selectedService = RideServiceType.uber);
                          },
                        ),
                        const SizedBox(width: 14),
                        RideServiceCardWidget(
                          height: 220,
                          serviceType: RideServiceType.lyft,
                          price: '\$26–31',
                          duration: '~34 min',
                          isSelected: _selectedService == RideServiceType.lyft,
                          onTap: () {
                            setState(() => _selectedService = RideServiceType.lyft);
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // Disclaimer text
                    Center(
                      child: Text(
                        'These are live estimates. Prices may change.',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyLight,
                        ),
                      ),
                    ),

                    // Increased spacing to push 'Find people' down
                    const SizedBox(height: 38),

                    // Section Heading
                    Text(
                      AppStrings.findPeopleWithSimilarRides,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Features List (with more vertical spacing)
                    const RideFeatureItemWidget(
                      icon: Icons.alt_route_rounded,
                      title: AppStrings.sameRoute,
                      subtitle: AppStrings.similarPickupDropoff,
                    ),
                    const RideFeatureItemWidget(
                      icon: Icons.access_time_rounded,
                      title: AppStrings.similarTime,
                      subtitle: AppStrings.within30Min,
                    ),
                    const RideFeatureItemWidget(
                      icon: Icons.directions_car_rounded,
                      title: AppStrings.sameRideType,
                      subtitle: AppStrings.uberOrLyft,
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // Bottom Find Matches Button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.rideBuddiesScreen);
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
                    AppStrings.findMatches,
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
}
