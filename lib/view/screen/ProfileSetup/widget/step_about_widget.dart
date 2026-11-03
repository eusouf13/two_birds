import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/app_colors/app_colors.dart';

class StepAboutWidget extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController ageController;
  final TextEditingController occupationController;
  final TextEditingController neighborhoodController;
  final TextEditingController bioController;

  const StepAboutWidget({
    super.key,
    required this.nameController,
    required this.ageController,
    required this.occupationController,
    required this.neighborhoodController,
    required this.bioController,
  });

  @override
  State<StepAboutWidget> createState() => _StepAboutWidgetState();
}

class _StepAboutWidgetState extends State<StepAboutWidget> {
  Widget _buildFieldCard({
    required String label,
    required TextEditingController controller,
    IconData? icon,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF0E1C29),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFF1B2E3F),
          width: 1.2,
        ),
      ),
      child: Row(
        crossAxisAlignment:
            maxLines > 1 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Padding(
              padding: EdgeInsets.only(top: maxLines > 1 ? 4.0 : 0.0),
              child: Icon(
                icon,
                color: AppColors.grey_03,
                size: 22,
              ),
            ),
            const SizedBox(width: 14),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey_03,
                  ),
                ),
                const SizedBox(height: 2),
                TextFormField(
                  controller: controller,
                  maxLines: maxLines,
                  keyboardType: keyboardType,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                  cursorColor: AppColors.primary,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          Text(
            'Tell Us About You',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 28),

          // First Name
          _buildFieldCard(
            label: 'First Name',
            controller: widget.nameController,
            icon: Icons.person_outline_rounded,
          ),

          // Age
          _buildFieldCard(
            label: 'Age',
            controller: widget.ageController,
            icon: Icons.calendar_today_outlined,
            keyboardType: TextInputType.number,
          ),

          // Occupation
          _buildFieldCard(
            label: 'Occupation',
            controller: widget.occupationController,
            icon: Icons.work_outline_rounded,
          ),

          // Neighborhood
          _buildFieldCard(
            label: 'Neighborhood',
            controller: widget.neighborhoodController,
            icon: Icons.location_on_outlined,
          ),

          // Short Bio
          _buildFieldCard(
            label: 'Short Bio',
            controller: widget.bioController,
            maxLines: 4,
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

