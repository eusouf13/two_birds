import 'package:flutter/material.dart';
import '../../../../utils/app_colors/app_colors.dart';

class ProfileProgressBarWidget extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const ProfileProgressBarWidget({
    super.key,
    required this.currentStep,
    this.totalSteps = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
      child: Row(
        children: List.generate(totalSteps, (index) {
          final isActive = index <= currentStep;
          return Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: 4.5,
              margin: EdgeInsets.only(
                right: index == totalSteps - 1 ? 0 : 8,
              ),
              decoration: BoxDecoration(
                color: isActive ? AppColors.primary : const Color(0xFF1A2A38),
                borderRadius: BorderRadius.circular(3),
                boxShadow: isActive
                    ? [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.35),
                          blurRadius: 4,
                          spreadRadius: 0.5,
                        ),
                      ]
                    : null,
              ),
            ),
          );
        }),
      ),
    );
  }
}

