import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_strings/app_strings.dart';

class RideLocationCardWidget extends StatelessWidget {
  final String pickup;
  final String destination;
  final String leaveTime;
  final VoidCallback? onTimeTap;

  const RideLocationCardWidget({
    super.key,
    this.pickup = 'New York, NY',
    this.destination = 'Brooklyn, NY',
    this.leaveTime = 'Today, 6:30 PM',
    this.onTimeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF111E2A),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF1E3243), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Pickup Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPinIndicator(
                icon: Icons.navigation_rounded,
                color: AppColors.primary,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.pickupLocation,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      pickup,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Dotted connector
          Padding(
            padding: const EdgeInsets.only(left: 11, top: 4, bottom: 4),
            child: SizedBox(
              height: 26,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  3,
                  (index) => Container(
                    width: 3,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Destination Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPinIndicator(
                icon: Icons.location_on_rounded,
                color: const Color(0xFFEF4444),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.destination,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFF87171),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      destination,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          const Divider(color: Color(0xFF1E3243), height: 1),
          const SizedBox(height: 14),

          // Leave Around Row
          InkWell(
            onTap: onTimeTap,
            borderRadius: BorderRadius.circular(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.leaveAround,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey_03,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      leaveTime,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF172837),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF233B50),
                      width: 1,
                    ),
                  ),
                  child: const Icon(
                    Icons.access_time_rounded,
                    color: AppColors.grey_03,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPinIndicator({required IconData icon, required Color color}) {
    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.18),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          icon,
          color: color,
          size: 16,
        ),
      ),
    );
  }
}
