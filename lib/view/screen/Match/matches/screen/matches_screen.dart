import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:two_birds/utils/app_colors/app_colors.dart';
import 'package:two_birds/utils/app_images/app_images.dart';
import 'package:two_birds/view/screen/Messages/screen/chat_inbox_screen.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  int _selectedFilterIndex = 0;
  final List<String> _filters = ['All', 'Rides', 'Dating', 'Archived'];

  final List<Map<String, dynamic>> _allMatches = [
    {
      'id': '1',
      'name': 'Jasmine, 27',
      'chatName': 'Jasmine',
      'rideSchedule': 'Ride: Today, 6:30 PM',
      'image': AppImages.sarah,
      'networkImage': null,
      'hasUnread': true,
      'status': 'Online',
      'category': 'Dating',
      'hasRide': true,
    },
    {
      'id': '2',
      'name': 'Marcus, 29',
      'chatName': 'Marcus',
      'rideSchedule': 'Ride: Tomorrow, 8:00 AM',
      'image': AppImages.userAvatar,
      'networkImage':
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=300&q=80',
      'hasUnread': false,
      'status': 'Active 10m ago',
      'category': 'Professional',
      'hasRide': true,
    },
    {
      'id': '3',
      'name': 'Taylor, 26',
      'chatName': 'Taylor',
      'rideSchedule': 'Ride: Fri, 5:45 PM',
      'image': AppImages.userAvatar,
      'networkImage':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=300&q=80',
      'hasUnread': false,
      'status': 'Active 1h ago',
      'category': 'Dating',
      'hasRide': true,
    },
    {
      'id': '4',
      'name': 'Brianna, 28',
      'chatName': 'Brianna',
      'rideSchedule': 'Ride: Mon, 7:00 AM',
      'image': AppImages.sarah,
      'networkImage':
          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=300&q=80',
      'hasUnread': false,
      'status': 'Active yesterday',
      'category': 'Friendship',
      'hasRide': true,
    },
  ];

  List<Map<String, dynamic>> get _filteredMatches {
    if (_selectedFilterIndex == 0) return _allMatches;
    if (_selectedFilterIndex == 1) {
      // Rides only
      return _allMatches.where((m) => m['hasRide'] == true).toList();
    }
    if (_selectedFilterIndex == 2) {
      // Dating only
      return _allMatches.where((m) => m['category'] == 'Dating').toList();
    }
    if (_selectedFilterIndex == 3) {
      // Archived
      return [];
    }
    return _allMatches;
  }

  @override
  Widget build(BuildContext context) {
    final matches = _filteredMatches;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12),

            // Header Title (Screenshot 2: "Your Matches")
            Text(
              'Your Matches',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),

            const SizedBox(height: 16),

            // Filter Tabs: [ All ] [ Rides ] [ Dating ] [ Archived ]
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(_filters.length, (index) {
                    final isSelected = _selectedFilterIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() => _selectedFilterIndex = index);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary
                              : const Color(0xFF0E1A26),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary
                                : const Color(0xFF1B2E3F),
                            width: 1.2,
                          ),
                        ),
                        child: Text(
                          _filters[index],
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: isSelected
                                ? FontWeight.w700
                                : FontWeight.w500,
                            color: isSelected
                                ? const Color(0xFF042F2C)
                                : AppColors.white,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            const SizedBox(height: 18),

            // Matches List
            Expanded(
              child: matches.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite_border_rounded,
                            size: 48,
                            color: AppColors.greyLight.withValues(alpha: 0.5),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'No matches in this category',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: AppColors.grey_03,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      itemCount: matches.length,
                      separatorBuilder: (context, index) => const Divider(
                        color: Color(0xFF162534),
                        height: 1,
                        thickness: 1,
                      ),
                      itemBuilder: (context, index) {
                        final match = matches[index];
                        final String name = match['name'] as String;
                        final String schedule =
                            match['rideSchedule'] as String;
                        final bool hasUnread = match['hasUnread'] as bool;
                        final String imagePath = match['image'] as String;
                        final String? networkImg =
                            match['networkImage'] as String?;

                        return InkWell(
                          onTap: () {
                            Get.to(
                              () => ChatInboxScreen(
                                name: name,
                                image: imagePath,
                                status: match['status'] as String,
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(16),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14.0),
                            child: Row(
                              children: [
                                // Circular Avatar with subtle border
                                Container(
                                  width: 54,
                                  height: 54,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color:
                                          Colors.white.withValues(alpha: 0.6),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: ClipOval(
                                    child: networkImg != null
                                        ? Image.network(
                                            networkImg,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              imagePath,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : Image.asset(
                                            imagePath,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),

                                const SizedBox(width: 14),

                                // Match Name & Scheduled Ride Subtitle
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        name,
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        schedule,
                                        style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.grey_03,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Trailing Cyan Dot Indicator (Screenshot 2)
                                if (hasUnread)
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                      color: AppColors.primary,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

