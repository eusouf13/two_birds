import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/app_colors/app_colors.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

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
          'Account Details',
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
          decoration: BoxDecoration(
            color: const Color(0xFF111E2A),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFF1E3243), width: 1),
          ),
          child: Column(
            children: [
              _buildAccountRow('Full Name', 'Alex Rivera'),
              const Divider(color: Color(0xFF1C2F3F), height: 1),
              _buildAccountRow('Email Address', 'alex.rivera@example.com'),
              const Divider(color: Color(0xFF1C2F3F), height: 1),
              _buildAccountRow('Phone Number', '+1 (555) 123-4567'),
              const Divider(color: Color(0xFF1C2F3F), height: 1),
              _buildAccountRow('Location', 'New York, NY'),
              const Divider(color: Color(0xFF1C2F3F), height: 1),
              _buildAccountRow('Member Since', 'March 2026'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.grey_03,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}

