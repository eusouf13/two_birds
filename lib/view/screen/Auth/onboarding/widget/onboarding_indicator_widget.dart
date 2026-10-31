import 'package:flutter/material.dart';
import '../../../../../utils/app_colors/app_colors.dart';

class OnboardingIndicatorWidget extends StatelessWidget {
  final int count;
  final int currentIndex;

  const OnboardingIndicatorWidget({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) {
          final isSelected = index == currentIndex;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 8,
            width: isSelected ? 26 : 8,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : const Color(0xFF1E3243),
              borderRadius: BorderRadius.circular(4),
            ),
          );
        },
      ),
    );
  }
}

