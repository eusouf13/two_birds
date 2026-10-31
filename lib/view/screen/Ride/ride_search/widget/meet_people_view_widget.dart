import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_images/app_images.dart';

class MeetPeopleViewWidget extends StatefulWidget {
  const MeetPeopleViewWidget({super.key});

  @override
  State<MeetPeopleViewWidget> createState() => _MeetPeopleViewWidgetState();
}

class _MeetPeopleViewWidgetState extends State<MeetPeopleViewWidget> {
  int _selectedFilterIndex = 0;
  final List<String> _filters = [
    'All',
    'Nearby',
    'Daily Commute',
    'Williamsburg',
    'Manhattan',
    'Airport',
  ];

  final List<Map<String, dynamic>> _people = [
    {
      'name': 'Sarah, 26',
      'role': 'Marketing @ Tech Co',
      'destination': 'Headed to Williamsburg',
      'time': 'Today, ~6:30 PM • UberX',
      'match': '94% match',
      'image': AppImages.sarah,
      'tags': ['Music', 'Design'],
      'isVerified': true,
    },
    {
      'name': 'Alex Rivera, 28',
      'role': 'Product Designer @ FinTech',
      'destination': 'Headed to Midtown Manhattan',
      'time': 'Today, ~7:00 PM • Lyft',
      'match': '89% match',
      'image': AppImages.userAvatar,
      'tags': ['Tech', 'Coffee'],
      'isVerified': true,
    },
    {
      'name': 'Elena Rostova, 25',
      'role': 'Architect @ Studio 4',
      'destination': 'Headed to Brooklyn DUMBO',
      'time': 'Today, ~6:45 PM • UberX',
      'match': '85% match',
      'image': AppImages.sarah,
      'tags': ['Architecture', 'Art'],
      'isVerified': false,
    },
    {
      'name': 'Marcus Chen, 29',
      'role': 'Founder @ CarbonAI',
      'destination': 'Headed to Lower Manhattan',
      'time': 'Today, ~8:00 PM • Uber Black',
      'match': '82% match',
      'image': AppImages.userAvatar,
      'tags': ['Startups', 'Cycling'],
      'isVerified': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Search & Filter Row
        Container(
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFF111E2A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF1E3243), width: 1),
          ),
          child: Row(
            children: [
              const SizedBox(width: 14),
              const Icon(Icons.search_rounded, color: AppColors.grey_03, size: 20),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  style: GoogleFonts.poppins(color: AppColors.white, fontSize: 13),
                  decoration: InputDecoration(
                    hintText: 'Search by destination, hobby, company...',
                    hintStyle: GoogleFonts.poppins(color: AppColors.greyLight, fontSize: 13),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 6),
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.tune_rounded,
                  color: AppColors.primary,
                  size: 18,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 14),

        // Filter Chips Horizontal List
        SizedBox(
          height: 34,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _filters.length,
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final isSelected = _selectedFilterIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() => _selectedFilterIndex = index);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary
                        : const Color(0xFF111E2A),
                    borderRadius: BorderRadius.circular(17),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primary
                          : const Color(0xFF1E3243),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    _filters[index],
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                      color: isSelected
                          ? const Color(0xFF07141E)
                          : AppColors.grey_03,
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 18),

        // Section Title & Count
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Riders Heading Your Way',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '${_people.length} Active',
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // People Cards List
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _people.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final person = _people[index];
            return _buildPersonCard(person);
          },
        ),

        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildPersonCard(Map<String, dynamic> person) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.buddyDetailsScreen, arguments: {
          'name': person['name'],
          'role': person['role'],
          'destination': person['destination'],
          'timeAndService': person['time'],
          'matchScore': person['match'],
          'imagePath': person['image'],
        });
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF111E2A),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFF1E3243), width: 1),
        ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar with online status
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      person['image'],
                      width: 52,
                      height: 52,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 52,
                        height: 52,
                        color: const Color(0xFF1E3243),
                        child: const Icon(Icons.person, color: AppColors.grey_03),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: const Color(0xFF10B981),
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFF111E2A), width: 2),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 12),

              // Name, Role & Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            person['name'],
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (person['isVerified'] == true) ...[
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.verified_rounded,
                            color: AppColors.primary,
                            size: 15,
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      person['role'],
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey_03,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(
                          Icons.navigation_rounded,
                          color: AppColors.primary,
                          size: 13,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            person['destination'],
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Match score badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  person['match'],
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          const Divider(color: Color(0xFF1C2F3F), height: 1),
          const SizedBox(height: 10),

          // Footer info and Connect CTA
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                person['time'],
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyLight,
                ),
              ),

              // Connect Button
              SizedBox(
                height: 32,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Navigate to ride buddy profile swipe or chat
                    Get.toNamed(AppRoutes.rideBuddiesScreen);
                  },
                  icon: const Icon(Icons.person_add_alt_1_rounded, size: 14),
                  label: Text(
                    'Connect',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: const Color(0xFF07141E),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
  }
}

