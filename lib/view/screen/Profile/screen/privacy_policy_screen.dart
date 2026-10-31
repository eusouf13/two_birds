import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/app_colors/app_colors.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
        title: Text(
          'Privacy Policy',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xFF111E2A),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFF1E3243), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Data We Collect',
                style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.white),
              ),
              const SizedBox(height: 6),
              Text(
                'We only collect essential details to facilitate safe route matching: location during app use, verification data, and profile information.',
                style: GoogleFonts.poppins(fontSize: 13, color: AppColors.grey_03, height: 1.5),
              ),
              const SizedBox(height: 16),
              Text(
                'Location Privacy',
                style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.white),
              ),
              const SizedBox(height: 6),
              Text(
                'Your exact home address is never shared publicly. Commuters only see approximate route waypoints.',
                style: GoogleFonts.poppins(fontSize: 13, color: AppColors.grey_03, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

