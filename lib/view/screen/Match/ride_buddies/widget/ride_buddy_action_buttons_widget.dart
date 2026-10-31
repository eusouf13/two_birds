import 'package:flutter/material.dart';
import '../../../../../utils/app_colors/app_colors.dart';

class RideBuddyActionButtonsWidget extends StatelessWidget {
  final VoidCallback onPass;
  final VoidCallback onInfo;
  final VoidCallback onLike;

  const RideBuddyActionButtonsWidget({
    super.key,
    required this.onPass,
    required this.onInfo,
    required this.onLike,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Pass Button (X)
          _buildCircleButton(
            size: 58,
            backgroundColor: const Color(0xFF101D28),
            borderColor: const Color(0xFF1E3243),
            icon: Icons.close_rounded,
            iconColor: AppColors.white,
            iconSize: 26,
            onTap: onPass,
          ),

          // Info Button (i)
          _buildCircleButton(
            size: 48,
            backgroundColor: const Color(0xFF101D28),
            borderColor: const Color(0xFF1E3243),
            icon: Icons.info_outline_rounded,
            iconColor: AppColors.grey_03,
            iconSize: 22,
            onTap: onInfo,
          ),

          // Like / Heart Button
          _buildCircleButton(
            size: 68,
            backgroundColor: AppColors.primary,
            borderColor: Colors.transparent,
            icon: Icons.favorite_rounded,
            iconColor: const Color(0xFF063B34),
            iconSize: 32,
            onTap: onLike,
          ),
        ],
      ),
    );
  }

  Widget _buildCircleButton({
    required double size,
    required Color backgroundColor,
    required Color borderColor,
    required IconData icon,
    required Color iconColor,
    required double iconSize,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: 1.2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Icon(
            icon,
            color: iconColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
