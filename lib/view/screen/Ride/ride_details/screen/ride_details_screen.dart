import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../widget/ride_details_map_widget.dart';

class RideDetailsScreen extends StatelessWidget {
  final String service;
  final String pickupAddress;
  final String pickupTime;
  final String dropoffAddress;
  final String dropoffTime;
  final String distanceEst;
  final String fareEst;
  final String durationEst;

  const RideDetailsScreen({
    super.key,
    this.service = 'UberX',
    this.pickupAddress = '123 Main St, New York, NY',
    this.pickupTime = '6:30 PM',
    this.dropoffAddress = '456 Metropolitan Ave,\nBrooklyn, NY',
    this.dropoffTime = '7:02 PM',
    this.distanceEst = '17 mi (est)',
    this.fareEst = '\$24–28',
    this.durationEst = '32 min',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
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
                        'Ride Details',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.home_rounded, color: AppColors.white, size: 24),
                    tooltip: 'Home',
                    onPressed: () => Get.offAllNamed(AppRoutes.homeScreen),
                  ),
                ],
              ),
            ),

            // Scrollable Details Body
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Map Preview Card
                    RideDetailsMapWidget(
                      serviceType: service,
                      height: 350,
                    ),

                    const SizedBox(height: 24),

                    // Pickup & Dropoff Timeline Section
                    _buildTimelineSection(),

                    const SizedBox(height: 24),

                    const Divider(
                      color: Color(0xFF1E3243),
                      thickness: 1,
                      height: 1,
                    ),

                    const SizedBox(height: 20),

                    // Fare & Duration Info
                    _buildFareAndDurationSection(),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // Bottom CTA Buttons
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {
                        _showShareBottomSheet(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: const Color(0xFF042F2C),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27),
                        ),
                      ),
                      child: Text(
                        'Share Ride Details',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF042F2C),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextButton.icon(
                    onPressed: () => Get.offAllNamed(AppRoutes.homeScreen),
                    icon: const Icon(Icons.home_outlined, color: AppColors.grey_03, size: 20),
                    label: Text(
                      'Back to Home',
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
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Pickup Item
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cyan Pin Icon
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Icon(
                Icons.location_on,
                color: AppColors.primary,
                size: 24,
              ),
            ),

            const SizedBox(width: 14),

            // Pickup Title and Address
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pickup',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    pickupAddress,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Pickup Time
            Text(
              pickupTime,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ],
        ),

        // Vertical dotted connector line
        Padding(
          padding: const EdgeInsets.only(left: 11.0, top: 4.0, bottom: 4.0),
          child: Column(
            children: List.generate(
              3,
              (index) => Container(
                width: 2.5,
                height: 5,
                margin: const EdgeInsets.symmetric(vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
        ),

        // Dropoff Item
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cyan Pin Icon
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Icon(
                Icons.location_on,
                color: AppColors.primary,
                size: 24,
              ),
            ),

            const SizedBox(width: 14),

            // Dropoff Title and Address
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dropoff',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dropoffAddress,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      height: 1.35,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Dropoff Time and Distance
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  dropoffTime,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  distanceEst,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey_03,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFareAndDurationSection() {
    return Column(
      children: [
        // Est. Fare Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Est. Fare',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.grey_03,
              ),
            ),
            Text(
              fareEst,
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Est. Duration Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Est. Duration',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.grey_03,
              ),
            ),
            Text(
              durationEst,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showShareBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF101E2B),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E3243),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Share Ride with Buddy',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Send live itinerary & split cost request to Sarah',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: AppColors.grey_03,
                  ),
                ),
                const SizedBox(height: 20),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.chat_bubble_outline_rounded, color: AppColors.primary),
                  ),
                  title: Text(
                    'Send via Two Birds Chat',
                    style: GoogleFonts.poppins(color: AppColors.white, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    'Direct to Sarah',
                    style: GoogleFonts.poppins(color: AppColors.grey_03, fontSize: 12),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, color: AppColors.grey_03, size: 16),
                  onTap: () {
                    Get.back();
                    Get.toNamed(AppRoutes.chatInboxScreen);
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E3243),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.copy_rounded, color: AppColors.white),
                  ),
                  title: Text(
                    'Copy Ride Link',
                    style: GoogleFonts.poppins(color: AppColors.white, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    'twobirds.app/ride/ubx-9482',
                    style: GoogleFonts.poppins(color: AppColors.grey_03, fontSize: 12),
                  ),
                  onTap: () {
                    Get.back();
                    Get.snackbar(
                      'Copied',
                      'Ride itinerary link copied to clipboard',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: const Color(0xFF1E3243),
                      colorText: AppColors.white,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
