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
  final List<Map<String, dynamic>>? interests;

  const RideBuddyCardWidget({
    super.key,
    this.name = 'Jasmine',
    this.age = 27,
    this.role = 'Product Designer',
    this.destination = 'Heading to Arlington',
    this.timeAndService = 'Today at 6:30 PM',
    this.routeComparison = 'Similar route • 5 min apart',
    this.matchScore = '87% match',
    this.imagePath = AppImages.sarah,
    this.interests,
  });

  @override
  Widget build(BuildContext context) {
    final displayInterests = interests ??
        const [
          {'label': 'Travel', 'icon': Icons.flight_rounded},
          {'label': 'Music', 'icon': Icons.music_note_rounded},
          {'label': 'Fitness', 'icon': Icons.fitness_center_rounded},
          {'label': 'Foodie', 'icon': Icons.restaurant_rounded},
        ];

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
            height: 250,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.45),
                    Colors.black.withValues(alpha: 0.85),
                    const Color(0xFF08131C).withValues(alpha: 0.98),
                  ],
                  stops: const [0.0, 0.35, 0.7, 1.0],
                ),
              ),
            ),
          ),

          // User Information Overlay (Image 1 layout)
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Name & Age + Verified Badge
                Row(
                  children: [
                    Text(
                      '$name, $age',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(
                      Icons.verified,
                      color: AppColors.primary,
                      size: 22,
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                // Heading to destination
                Text(
                  destination,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),

                const SizedBox(height: 2),

                // Today at time
                Text(
                  timeAndService,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey_03,
                  ),
                ),

                const SizedBox(height: 12),

                // Interest Pills Row (Travel, Music, Fitness, Foodie)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: displayInterests.map((item) {
                      return Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 11, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0E1C28).withValues(alpha: 0.85),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color(0xFF1F3345),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              item['icon'] as IconData,
                              size: 13,
                              color: AppColors.white,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              item['label'] as String,
                              style: GoogleFonts.poppins(
                                fontSize: 11.5,
                                fontWeight: FontWeight.w500,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
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
