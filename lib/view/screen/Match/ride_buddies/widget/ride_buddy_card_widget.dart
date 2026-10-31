import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_images/app_images.dart';

class RideBuddyCardWidget extends StatelessWidget {
  final String name;
  final int age;
  final String role;
  final String destination;
  final String timeAndService;
  final String routeComparison;
  final String matchScore;
  final String imagePath;

  const RideBuddyCardWidget({
    super.key,
    this.name = 'Sarah',
    this.age = 26,
    this.role = 'Marketing @ Tech Co',
    this.destination = 'Headed to Williamsburg',
    this.timeAndService = 'Around 6:30 PM • UberX',
    this.routeComparison = 'Similar route • 5 min apart',
    this.matchScore = '87% match',
    this.imagePath = AppImages.sarah,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF101E2B),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF1F3345), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Profile Photo
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: const Color(0xFF162534),
                child: const Center(
                  child: Icon(Icons.person, size: 80, color: AppColors.grey_03),
                ),
              );
            },
          ),

          // Match Percentage Badge (Top Right)
          Positioned(
            top: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                matchScore,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF09141E),
                ),
              ),
            ),
          ),

          // Gradient Scrim Overlay at Bottom
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 240,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.55),
                    Colors.black.withValues(alpha: 0.88),
                    const Color(0xFF08131C).withValues(alpha: 0.98),
                  ],
                  stops: const [0.0, 0.35, 0.7, 1.0],
                ),
              ),
            ),
          ),

          // User Information Overlay
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Name & Age
                Text(
                  '$name, $age',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),

                const SizedBox(height: 2),

                // Job / Role
                Text(
                  role,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey_03,
                  ),
                ),

                const SizedBox(height: 14),

                // Destination Info
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.navigation_rounded,
                        color: AppColors.primary,
                        size: 14,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        destination,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 32, top: 2),
                  child: Text(
                    timeAndService,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey_03,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Route comparison footer
                Text(
                  routeComparison,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey_03,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
