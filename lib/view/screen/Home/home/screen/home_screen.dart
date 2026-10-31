import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../Messages/screen/messages_screen.dart';
import '../../../Profile/screen/profile_screen.dart';
import '../widget/home_header_widget.dart';
import '../widget/home_nearby_buddies_widget.dart';
import '../widget/home_quick_routes_widget.dart';
import '../widget/home_search_commute_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: IndexedStack(
        index: _currentNavIndex,
        children: [
          _buildCommuteTab(),
          const MessagesScreen(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  // Home / Commute Tab Content
  Widget _buildCommuteTab() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Header with greeting & profile
            HomeHeaderWidget(
              onProfileTap: () {
                setState(() => _currentNavIndex = 2);
              },
              onNotificationTap: () {
                Get.snackbar(
                  'Notifications',
                  'Sarah shared a ride to Williamsburg at 6:30 PM!',
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: const Color(0xFF13222E),
                  colorText: AppColors.white,
                );
              },
            ),

            const SizedBox(height: 20),

            // Commute Search Box (Pickup + Destination) -> Navigates to RideSearchScreen
            HomeSearchCommuteCard(
              onSearch: () {
                Get.toNamed(AppRoutes.rideSearchScreen);
              },
            ),

            const SizedBox(height: 24),

            // Active Commuters Nearby
            const HomeNearbyBuddiesWidget(),

            const SizedBox(height: 24),

            // Popular Shared Commute Routes
            const HomeQuickRoutesWidget(),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Modern Dark Styled Bottom Navigation Bar
  Widget _buildBottomNavBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0C1622),
        border: Border(
          top: BorderSide(color: Color(0xFF1B2F3F), width: 1),
        ),
      ),
      child: SafeArea(
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                index: 0,
                icon: Icons.directions_car_rounded,
                label: 'Commute',
              ),
              _buildNavItem(
                index: 1,
                icon: Icons.chat_bubble_outline_rounded,
                activeIcon: Icons.chat_bubble_rounded,
                label: 'Messages',
                badgeCount: 2,
              ),
              _buildNavItem(
                index: 2,
                icon: Icons.person_outline_rounded,
                activeIcon: Icons.person_rounded,
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    IconData? activeIcon,
    required String label,
    int badgeCount = 0,
  }) {
    final isSelected = _currentNavIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() => _currentNavIndex = index);
      },
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  isSelected ? (activeIcon ?? icon) : icon,
                  color: isSelected ? AppColors.primary : AppColors.grey_03,
                  size: 24,
                ),
                if (badgeCount > 0)
                  Positioned(
                    top: -4,
                    right: -6,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        badgeCount.toString(),
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF07141E),
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? AppColors.primary : AppColors.grey_03,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

