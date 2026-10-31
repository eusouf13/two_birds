import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../components/custom_button/custom_button.dart';
import '../../../components/custom_text_field/custom_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _nameController = TextEditingController(text: 'Alex, 27');
  final _roleController = TextEditingController(text: 'Product Designer');
  final _locationController = TextEditingController(text: 'New York, NY');
  final _bioController = TextEditingController(
    text: 'I love meeting new people, exploring the city, and finding good food. Always down for a great conversation!',
  );

  @override
  void dispose() {
    _nameController.dispose();
    _roleController.dispose();
    _locationController.dispose();
    _bioController.dispose();
    super.dispose();
  }

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
          'Edit Profile',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Center Avatar with Camera button
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primary, width: 2.5),
                    ),
                    child: const CircleAvatar(
                      radius: 46,
                      backgroundImage: AssetImage(AppImages.userAvatar),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryDark,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 18),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            Text('Name & Age', style: GoogleFonts.poppins(color: AppColors.white, fontSize: 13, fontWeight: FontWeight.w500)),
            const SizedBox(height: 6),
            CustomTextField(textEditingController: _nameController, fillColor: AppColors.cardColor, fieldBorderColor: AppColors.cardBorder),

            const SizedBox(height: 16),

            Text('Job Title', style: GoogleFonts.poppins(color: AppColors.white, fontSize: 13, fontWeight: FontWeight.w500)),
            const SizedBox(height: 6),
            CustomTextField(textEditingController: _roleController, fillColor: AppColors.cardColor, fieldBorderColor: AppColors.cardBorder),

            const SizedBox(height: 16),

            Text('Location', style: GoogleFonts.poppins(color: AppColors.white, fontSize: 13, fontWeight: FontWeight.w500)),
            const SizedBox(height: 6),
            CustomTextField(textEditingController: _locationController, fillColor: AppColors.cardColor, fieldBorderColor: AppColors.cardBorder),

            const SizedBox(height: 16),

            Text('About Me', style: GoogleFonts.poppins(color: AppColors.white, fontSize: 13, fontWeight: FontWeight.w500)),
            const SizedBox(height: 6),
            CustomTextField(
              textEditingController: _bioController,
              maxLines: 3,
              fillColor: AppColors.cardColor,
              fieldBorderColor: AppColors.cardBorder,
            ),

            const SizedBox(height: 28),

            CustomButton(
              title: 'Save Changes',
              fillColor: AppColors.primary,
              textColor: const Color(0xFF07141E),
              borderRadius: 26,
              onTap: () {
                Get.back();
                Get.snackbar('Updated', 'Profile changes saved successfully.', snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xFF13222E), colorText: AppColors.white);
              },
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

