import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/app_colors/app_colors.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

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
          'Help & Support',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF111E2A),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF1E3243), width: 1),
              ),
              child: Column(
                children: [
                  _buildHelpItem(
                    title: 'How does ride splitting work?',
                    subtitle: 'Find someone going your route and split the Uber/Lyft fare directly.',
                  ),
                  const Divider(color: Color(0xFF1C2F3F), height: 1),
                  _buildHelpItem(
                    title: 'How are commuters verified?',
                    subtitle: 'Through government ID, phone number, and selfie verification.',
                  ),
                  const Divider(color: Color(0xFF1C2F3F), height: 1),
                  _buildHelpItem(
                    title: 'Can I cancel a ride match?',
                    subtitle: 'Yes, up to 15 minutes before the scheduled pickup time.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.snackbar(
                    'Support Contacted',
                    'A support ticket has been opened. Our team will reach you shortly.',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: const Color(0xFF13222E),
                    colorText: AppColors.white,
                  );
                },
                icon: const Icon(Icons.headset_mic_rounded, size: 20),
                label: Text(
                  'Contact 24/7 Support',
                  style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: const Color(0xFF07141E),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpItem({required String title, required String subtitle}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.grey_03,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

