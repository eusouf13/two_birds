import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_images/app_images.dart';

enum RideServiceType { uber, lyft }

class RideServiceCardWidget extends StatelessWidget {
  final RideServiceType serviceType;
  final String price;
  final String duration;
  final bool isSelected;
  final VoidCallback onTap;
  final double height;

  const RideServiceCardWidget({
    super.key,
    required this.serviceType,
    required this.price,
    required this.duration,
    required this.isSelected,
    required this.onTap,
    this.height = 220,
  });

  @override
  Widget build(BuildContext context) {
    final isUber = serviceType == RideServiceType.uber;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: height,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF101E2B),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: isSelected ? AppColors.primary : const Color(0xFF1B2F3F),
              width: isSelected ? 1.8 : 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Service Brand Badge
              Container(
                width: 52,
                height: 36,
                decoration: BoxDecoration(
                  color: isUber ? Colors.black : const Color(0xFFFF00BF),
                  borderRadius: BorderRadius.circular(9),
                ),
                alignment: Alignment.center,
                child: Text(
                  isUber ? 'Uber' : 'lyft',
                  style: GoogleFonts.poppins(
                    fontSize: isUber ? 14 : 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                    letterSpacing: -0.5,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // Price
              Text(
                price,
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                  letterSpacing: -0.5,
                ),
              ),

              // Duration
              Text(
                duration,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey_03,
                ),
              ),

              const Spacer(),

              // Car Image
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  AppImages.carSilver,
                  height: 44,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.directions_car_filled_rounded,
                      size: 40,
                      color: isSelected ? AppColors.primary : AppColors.grey_03,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
