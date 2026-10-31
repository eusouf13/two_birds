import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_strings/app_strings.dart';

class RideOptionsAppBarWidget extends StatelessWidget {
  final VoidCallback? onEditTap;

  const RideOptionsAppBarWidget({
    super.key,
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back Button
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.white, size: 20),
            onPressed: () => Get.back(),
          ),

          // Title
          Text(
            AppStrings.rideOptions,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),

          // Edit Button
          TextButton(
            onPressed: onEditTap ?? () => Get.back(),
            child: Text(
              AppStrings.edit,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

