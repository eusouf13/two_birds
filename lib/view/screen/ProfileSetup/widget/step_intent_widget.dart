import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/app_colors/app_colors.dart';

class StepIntentWidget extends StatefulWidget {
  final Set<String> selectedIntents;
  final ValueChanged<String> onToggleIntent;

  const StepIntentWidget({
    super.key,
    required this.selectedIntents,
    required this.onToggleIntent,
  });

  @override
  State<StepIntentWidget> createState() => _StepIntentWidgetState();
}

class _StepIntentWidgetState extends State<StepIntentWidget> {
  final List<Map<String, dynamic>> _intentOptions = [
    {
      'id': 'Professional',
      'title': 'Professional',
      'subtitle': 'Network and connect with like-minded professionals.',
      'icon': Icons.work_outline_rounded,
    },
    {
      'id': 'Friendship',
      'title': 'Friendship',
      'subtitle': 'Meet new people and expand your circle.',
      'icon': Icons.people_outline_rounded,
    },
    {
      'id': 'Dating',
      'title': 'Dating',
      'subtitle': 'Be open to a romantic connection on the ride.',
      'icon': Icons.favorite_border_rounded,
    },
  ];

  Widget _buildOptionCard(Map<String, dynamic> option) {
    final String id = option['id'];
    final String title = option['title'];
    final String subtitle = option['subtitle'];
    final IconData icon = option['icon'];
    final isSelected = widget.selectedIntents.contains(id);

    return GestureDetector(
      onTap: () => widget.onToggleIntent(id),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF0D2533)
              : const Color(0xFF0E1C29),
          borderRadius: BorderRadius.circular(18),
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
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            // Cyan Outline Icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary.withValues(alpha: 0.15)
                    : const Color(0xFF132230),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.primary.withValues(alpha: 0.4),
                  width: 1.2,
                ),
              ),
              child: Icon(
                icon,
                color: AppColors.primary,
                size: 26,
              ),
            ),
            const SizedBox(width: 16),

            // Title and Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey_03,
                      height: 1.35,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),

            // Checkbox / Selection Circle
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.primary
                      : const Color(0xFF33475A),
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      color: Color(0xFF042F2C),
                      size: 15,
                    )
                  : null,
            ),
          ],
        ),
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
            'What Brings You to\nTwo Birds?',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 10),

          // Subtitle (Choose one or more connection intents)
          Text(
            'Choose one or more connection intents. You can update this anytime.',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: AppColors.grey_03,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 32),

          // Options List
          ..._intentOptions.map((opt) => _buildOptionCard(opt)),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
