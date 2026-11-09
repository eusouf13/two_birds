import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';

class StepSocialsWidget extends StatefulWidget {
  final bool isInstagramConnected;
  final bool isTikTokConnected;
  final bool showSocialLinksToMatches;
  final ValueChanged<bool> onToggleInstagram;
  final ValueChanged<bool> onToggleTikTok;
  final ValueChanged<bool> onToggleShowSocials;

  const StepSocialsWidget({
    super.key,
    required this.isInstagramConnected,
    required this.isTikTokConnected,
    required this.showSocialLinksToMatches,
    required this.onToggleInstagram,
    required this.onToggleTikTok,
    required this.onToggleShowSocials,
  });

  @override
  State<StepSocialsWidget> createState() => _StepSocialsWidgetState();
}

class _StepSocialsWidgetState extends State<StepSocialsWidget> {
  Widget _buildInstagramIcon() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SvgPicture.asset(
        AppIcons.instagram,
        width: 44,
        height: 44,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildTikTokIcon() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SvgPicture.asset(
        AppIcons.tiktok,
        width: 44,
        height: 44,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildSocialCard({
    required Widget iconWidget,
    required String title,
    required String subtitle,
    required bool isConnected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF0E1C29),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFF1B2E3F),
            width: 1.2,
          ),
        ),
        child: Row(
          children: [
            iconWidget,
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey_03,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: isConnected ? AppColors.primary : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isConnected
                      ? AppColors.primary
                      : const Color(0xFF2A3C4E),
                  width: 1.5,
                ),
              ),
              child: isConnected
                  ? const Icon(
                      Icons.check,
                      color: Color(0xFF042F2C),
                      size: 16,
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
            'Connect Your Socials',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '(Optional)',
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.grey_03,
            ),
          ),
          const SizedBox(height: 10),

          // Subtitle
          Text(
            'Show more of your lifestyle and help others get to know you.',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: AppColors.grey_03,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 32),

          // Instagram Card
          _buildSocialCard(
            iconWidget: _buildInstagramIcon(),
            title: 'Connect Instagram',
            subtitle: 'Show your photos, interests, and more.',
            isConnected: widget.isInstagramConnected,
            onTap: () {
              widget.onToggleInstagram(!widget.isInstagramConnected);
            },
          ),

          // TikTok Card
          _buildSocialCard(
            iconWidget: _buildTikTokIcon(),
            title: 'Connect TikTok',
            subtitle: 'Share your interests, travel, content, and personality.',
            isConnected: widget.isTikTokConnected,
            onTap: () {
              widget.onToggleTikTok(!widget.isTikTokConnected);
            },
          ),

          const SizedBox(height: 16),

          // Show social links toggle container
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF0A1520),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFF1B2E3F).withValues(alpha: 0.6),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Show my social links to matches',
                    style: GoogleFonts.poppins(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ),
                Switch(
                  value: widget.showSocialLinksToMatches,
                  onChanged: widget.onToggleShowSocials,
                  focusColor: AppColors.primary,
                  activeTrackColor: AppColors.primary.withValues(alpha: 0.35),
                  inactiveThumbColor: AppColors.greyLight,
                  inactiveTrackColor: const Color(0xFF1A2A38),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

