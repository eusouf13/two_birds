import 'package:flutter/material.dart';

class RideBuddyActionButtonsWidget extends StatelessWidget {
  final VoidCallback onPass;
  final VoidCallback? onSuperLike;
  final VoidCallback? onInfo;
  final VoidCallback onLike;

  const RideBuddyActionButtonsWidget({
    super.key,
    required this.onPass,
    this.onSuperLike,
    this.onInfo,
    required this.onLike,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Pass Button (X) - Silver/grey outline on dark background
          _buildCircleButton(
            size: 58,
            backgroundColor: const Color(0xFF0F1B26),
            borderColor: const Color(0xFF7E8E9F),
            borderWidth: 1.5,
            icon: Icons.close_rounded,
            iconColor: const Color(0xFFF1F5F9),
            iconSize: 28,
            onTap: onPass,
          ),

          // Super Like / Star Button - Gold outline with filled gold star
          _buildCircleButton(
            size: 58,
            backgroundColor: const Color(0xFF0F1B26),
            borderColor: const Color(0xFFF59E0B),
            borderWidth: 2.0,
            icon: Icons.star_rounded,
            iconColor: const Color(0xFFFBBF24),
            iconSize: 32,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFF59E0B).withValues(alpha: 0.25),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
            onTap: onSuperLike ?? onInfo ?? () {},
          ),

          // Like Button (Heart) - Solid vibrant coral/red with white heart
          _buildCircleButton(
            size: 68,
            backgroundColor: const Color(0xFFFE3C72),
            borderColor: Colors.transparent,
            borderWidth: 0,
            icon: Icons.favorite_rounded,
            iconColor: Colors.white,
            iconSize: 34,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFE3C72).withValues(alpha: 0.45),
                blurRadius: 14,
                offset: const Offset(0, 4),
              ),
            ],
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
    double borderWidth = 1.2,
    required IconData icon,
    required Color iconColor,
    required double iconSize,
    List<BoxShadow>? boxShadow,
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
          border: borderWidth > 0
              ? Border.all(color: borderColor, width: borderWidth)
              : null,
          boxShadow: boxShadow ??
              [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
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
