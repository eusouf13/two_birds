import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_images/app_images.dart';

class BuddyDetailsScreen extends StatelessWidget {
  final String name;
  final int age;
  final String role;
  final String company;
  final String location;
  final String destination;
  final String timeAndService;
  final String matchScore;
  final String imagePath;
  final String bio;

  const BuddyDetailsScreen({
    super.key,
    this.name = 'Sarah',
    this.age = 26,
    this.role = 'Marketing Manager',
    this.company = 'Tech Co',
    this.location = 'New York, NY',
    this.destination = 'Williamsburg, Brooklyn',
    this.timeAndService = 'Today, 6:30 PM • UberX',
    this.matchScore = '87% Match',
    this.imagePath = AppImages.sarah,
    this.bio = 'Daily commuter heading to Williamsburg on weekdays. Love chatting about tech, indie music, and good coffee spots. Always punctual, polite, and happy to split rides!',
  });

  @override
  Widget build(BuildContext context) {
    // Check if arguments were passed via Get.arguments
    final args = Get.arguments as Map<String, dynamic>?;
    final displayName = args?['name'] ?? name;
    final displayAge = args?['age'] ?? age;
    final displayRole = args?['role'] ?? role;
    final displayCompany = args?['company'] ?? company;
    final displayLocation = args?['location'] ?? location;
    final displayDestination = args?['destination'] ?? destination;
    final displayTime = args?['timeAndService'] ?? timeAndService;
    final displayMatchScore = args?['matchScore'] ?? matchScore;
    final displayImagePath = args?['imagePath'] ?? imagePath;
    final displayBio = args?['bio'] ?? bio;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Scrollable Content
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // Hero Photo App Bar
              SliverAppBar(
                expandedHeight: 380,
                pinned: true,
                backgroundColor: AppColors.background,
                elevation: 0,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Center(
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.45),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.white, size: 18),
                        onPressed: () => Get.back(),
                      ),
                    ),
                  ),
                ),
                actions: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.45),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.more_horiz, color: AppColors.white, size: 22),
                        onPressed: () {
                          _showOptionsModal(context, displayName);
                        },
                      ),
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Photo
                      Image.asset(
                        displayImagePath,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: const Color(0xFF142230),
                          child: const Center(
                            child: Icon(Icons.person, size: 90, color: AppColors.grey_03),
                          ),
                        ),
                      ),

                      // Gradient overlays
                      Positioned.fill(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withValues(alpha: 0.5),
                                Colors.transparent,
                                Colors.black.withValues(alpha: 0.6),
                                AppColors.background,
                              ],
                              stops: const [0.0, 0.25, 0.75, 1.0],
                            ),
                          ),
                        ),
                      ),

                      // Match Score Pill (Top Right)
                      Positioned(
                        top: 56,
                        right: 68,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.4),
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.auto_awesome, color: Color(0xFF042F2C), size: 14),
                              const SizedBox(width: 4),
                              Text(
                                displayMatchScore,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF042F2C),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Name, Age & Verified Title Overlay
                      Positioned(
                        left: 20,
                        right: 20,
                        bottom: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '$displayName, $displayAge',
                                  style: GoogleFonts.poppins(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.white,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: const BoxDecoration(
                                    color: AppColors.primary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.check, size: 14, color: Color(0xFF063B34)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '$displayRole • $displayCompany',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: AppColors.grey_03,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                const Icon(Icons.location_on, size: 14, color: AppColors.primary),
                                const SizedBox(width: 4),
                                Text(
                                  displayLocation,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    color: AppColors.grey_03,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Content Body
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 110),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Verification Quick Badges
                      _buildVerificationRow(),

                      const SizedBox(height: 20),

                      // Commute Route Match Card
                      _buildRouteCard(
                        destination: displayDestination,
                        timeAndService: displayTime,
                      ),

                      const SizedBox(height: 20),

                      // About Me Section
                      _buildSectionTitle('About Me'),
                      const SizedBox(height: 8),
                      Text(
                        displayBio,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          height: 1.6,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFCFE1ED),
                        ),
                      ),

                      const SizedBox(height: 22),

                      // Commute Habits & Preferences
                      _buildSectionTitle('Commute Habits'),
                      const SizedBox(height: 12),
                      _buildHabitsGrid(),

                      const SizedBox(height: 22),

                      // Interests Tags
                      _buildSectionTitle('Interests'),
                      const SizedBox(height: 12),
                      _buildInterestsWrap(),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Sticky Bottom Action Bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildBottomActionBar(displayName),
          ),
        ],
      ),
    );
  }

  Widget _buildVerificationRow() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF101E2B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1E3243)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBadgeItem(Icons.verified_user_rounded, 'ID Verified', AppColors.primary),
          Container(width: 1, height: 28, color: const Color(0xFF1E3243)),
          _buildBadgeItem(Icons.work_outline_rounded, 'Work Email', AppColors.primary),
          Container(width: 1, height: 28, color: const Color(0xFF1E3243)),
          _buildBadgeItem(Icons.star_rounded, '4.9 ★ (38)', const Color(0xFFFFB800)),
        ],
      ),
    );
  }

  Widget _buildBadgeItem(IconData icon, String text, Color iconColor) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: iconColor),
        const SizedBox(width: 6),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildRouteCard({required String destination, required String timeAndService}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF101E2B),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF1E3243)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.directions_car_rounded, color: AppColors.primary, size: 18),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shared Commute Match',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      '92% Route Overlap • Save ~\$13.50 each',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(color: Color(0xFF1E3243), height: 1),
          const SizedBox(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const Icon(Icons.radio_button_checked, size: 16, color: AppColors.primary),
                  Container(
                    width: 2,
                    height: 24,
                    color: const Color(0xFF1E3243),
                  ),
                  const Icon(Icons.location_on, size: 16, color: Color(0xFFFF5252)),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pickup: Financial District, NY',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'Dropoff: $destination',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF0A1520),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Icon(Icons.schedule, size: 16, color: AppColors.grey_03),
                const SizedBox(width: 8),
                Text(
                  timeAndService,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: AppColors.grey_03,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
    );
  }

  Widget _buildHabitsGrid() {
    final habits = [
      {'icon': Icons.music_note_rounded, 'title': 'Music Friendly', 'desc': 'Indie & Lo-Fi'},
      {'icon': Icons.chat_bubble_outline_rounded, 'title': 'Conversation', 'desc': 'Casual & Friendly'},
      {'icon': Icons.smoke_free_rounded, 'title': 'Non-Smoking', 'desc': 'Strictly smoke free'},
      {'icon': Icons.timelapse_rounded, 'title': 'Punctual', 'desc': 'Never late'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: habits.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 2.2,
      ),
      itemBuilder: (context, index) {
        final habit = habits[index];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF101E2B),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFF1E3243)),
          ),
          child: Row(
            children: [
              Icon(habit['icon'] as IconData, size: 22, color: AppColors.primary),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      habit['title'] as String,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      habit['desc'] as String,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: AppColors.grey_03,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInterestsWrap() {
    final interests = ['Design', 'Tech', 'Foodie', 'Music', 'Travel', 'Coffee', 'Fitness'];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: interests.map((interest) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF101E2B),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFF1E3243)),
          ),
          child: Text(
            interest,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: const Color(0xFFCFE1ED),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBottomActionBar(String displayName) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF09121A).withValues(alpha: 0.96),
        border: const Border(
          top: BorderSide(color: Color(0xFF1E3243), width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            // Pass / Close Button
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xFF101E2B),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF1E3243), width: 1.2),
                ),
                child: const Icon(Icons.close_rounded, color: AppColors.white, size: 24),
              ),
            ),

            const SizedBox(width: 12),

            // Message Button
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.chatInboxScreen, arguments: {
                  'name': displayName,
                  'avatar': AppImages.sarah,
                });
              },
              child: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xFF101E2B),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF1E3243), width: 1.2),
                ),
                child: const Icon(Icons.chat_bubble_outline_rounded, color: AppColors.primary, size: 22),
              ),
            ),

            const SizedBox(width: 12),

            // Connect & Match Button
            Expanded(
              child: SizedBox(
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.toNamed(AppRoutes.matchConfirmationScreen);
                  },
                  icon: const Icon(Icons.favorite_rounded, color: Color(0xFF042F2C), size: 20),
                  label: Text(
                    'Connect & Match',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF042F2C),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showOptionsModal(BuildContext context, String displayName) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF101E2B),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.share_outlined, color: AppColors.white),
                  title: Text(
                    'Share Profile',
                    style: GoogleFonts.poppins(color: AppColors.white, fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    Get.back();
                    Get.snackbar('Shared', 'Profile link copied to clipboard',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: const Color(0xFF1E3243),
                        colorText: AppColors.white);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.report_problem_outlined, color: Color(0xFFFF5252)),
                  title: Text(
                    'Report $displayName',
                    style: GoogleFonts.poppins(color: const Color(0xFFFF5252), fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    Get.back();
                    Get.snackbar('Report Submitted', 'Thank you for keeping our community safe',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: const Color(0xFF1E3243),
                        colorText: AppColors.white);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.block, color: Color(0xFFFF5252)),
                  title: Text(
                    'Block $displayName',
                    style: GoogleFonts.poppins(color: const Color(0xFFFF5252), fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    Get.back();
                    Get.back(); // back to ride buddies
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

