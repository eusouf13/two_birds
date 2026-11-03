import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/app_colors/app_colors.dart';

class StepInterestsWidget extends StatefulWidget {
  final Set<String> selectedInterests;
  final ValueChanged<String> onToggleInterest;

  const StepInterestsWidget({
    super.key,
    required this.selectedInterests,
    required this.onToggleInterest,
  });

  @override
  State<StepInterestsWidget> createState() => _StepInterestsWidgetState();
}

class _StepInterestsWidgetState extends State<StepInterestsWidget> {
  bool _showMore = false;

  final List<Map<String, dynamic>> _baseInterests = [
    {'label': 'Fitness', 'icon': Icons.fitness_center_rounded},
    {'label': 'Travel', 'icon': Icons.flight_rounded},
    {'label': 'Foodie', 'icon': Icons.restaurant_rounded},
    {'label': 'Music', 'icon': Icons.music_note_rounded},
    {'label': 'Sports', 'icon': Icons.sports_basketball_rounded},
    {'label': 'Tech', 'icon': Icons.laptop_mac_rounded},
    {'label': 'Arts', 'icon': Icons.palette_outlined},
    {'label': 'Outdoors', 'icon': Icons.terrain_rounded},
    {'label': 'Movies', 'icon': Icons.movie_outlined},
  ];

  final List<Map<String, dynamic>> _extraInterests = [
    {'label': 'Coffee', 'icon': Icons.coffee_rounded},
    {'label': 'Reading', 'icon': Icons.menu_book_rounded},
    {'label': 'Gaming', 'icon': Icons.sports_esports_rounded},
    {'label': 'Photography', 'icon': Icons.camera_alt_outlined},
    {'label': 'Pets', 'icon': Icons.pets_rounded},
    {'label': 'Cooking', 'icon': Icons.soup_kitchen_rounded},
  ];

  Widget _buildInterestCard(Map<String, dynamic> item) {
    final String label = item['label'];
    final IconData icon = item['icon'];
    final isSelected = widget.selectedInterests.contains(label);

    return GestureDetector(
      onTap: () => widget.onToggleInterest(label),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF0F2633)
              : const Color(0xFF0E1C29),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : const Color(0xFF1B2E3F),
            width: isSelected ? 1.8 : 1.2,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.15),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ]
              : null,
        ),
        child: Stack(
          children: [
            // Checkmark indicator in top right
            if (isSelected)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Color(0xFF042F2C),
                    size: 13,
                  ),
                ),
              ),

            // Icon and Label centered
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    color: isSelected ? AppColors.primary : AppColors.white,
                    size: 32,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    label,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w500,
                      color: AppColors.white,
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

  @override
  Widget build(BuildContext context) {
    final displayList = _showMore
        ? [..._baseInterests, ..._extraInterests]
        : _baseInterests;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          Text(
            'Your Interests & Hobbies',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 8),

          // Subtitle
          Text(
            "Select what you enjoy. We'll use these to match you with like-minded riders.",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: AppColors.grey_03,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 24),

          // 3x3 Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: displayList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.95,
            ),
            itemBuilder: (context, index) {
              return _buildInterestCard(displayList[index]);
            },
          ),

          const SizedBox(height: 20),

          // "More Interests" Button
          GestureDetector(
            onTap: () {
              setState(() {
                _showMore = !_showMore;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              decoration: BoxDecoration(
                color: const Color(0xFF0E1C29),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFF1B2E3F),
                  width: 1.2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _showMore ? 'Fewer Interests' : 'More Interests',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  AnimatedRotation(
                    turns: _showMore ? 0.5 : 0.0,
                    duration: const Duration(milliseconds: 250),
                    child: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppColors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

