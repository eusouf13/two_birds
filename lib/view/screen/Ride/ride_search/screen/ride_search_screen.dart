import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../controllers/ride_schedule_controller.dart';
import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_strings/app_strings.dart';
import '../widget/meet_people_view_widget.dart';
import '../widget/ride_location_card_widget.dart';
import '../widget/ride_map_preview_widget.dart';
import '../widget/ride_segmented_tab_widget.dart';

class RideSearchScreen extends StatefulWidget {
  const RideSearchScreen({super.key});

  @override
  State<RideSearchScreen> createState() => _RideSearchScreenState();
}

class _RideSearchScreenState extends State<RideSearchScreen> {
  int _selectedTabIndex = 0;
  String _leaveTime = 'Today, 6:30 PM';

  Future<void> _selectTime() async {
    final DateTime now = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 30)),
      helpText: 'SCHEDULE RIDE FOR LATER',
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.primary,
              surface: Color(0xFF13222E),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && mounted) {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: const TimeOfDay(hour: 18, minute: 30),
        helpText: 'SELECT DEPARTURE TIME',
        builder: (context, child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.dark(
                primary: AppColors.primary,
                surface: Color(0xFF13222E),
              ),
            ),
            child: child!,
          );
        },
      );
      if (picked != null) {
        final isToday = pickedDate.day == now.day &&
            pickedDate.month == now.month &&
            pickedDate.year == now.year;
        final isTomorrow =
            pickedDate.day == now.add(const Duration(days: 1)).day;
        final dayStr = isToday
            ? 'Today'
            : isTomorrow
                ? 'Tomorrow'
                : '${pickedDate.month}/${pickedDate.day}';

        setState(() {
          _leaveTime = '$dayStr, ${picked.format(context)}';
        });

        Get.snackbar(
          'Ride Scheduled',
          'Searching for rides scheduled for $_leaveTime',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0xFF13222E),
          colorText: AppColors.white,
          duration: const Duration(seconds: 2),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isRideTab = _selectedTabIndex == 0;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Top Navigation Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Row(
                children: [
                  // Back Button
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF13222E),
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFF1E3243), width: 1),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.white, size: 16),
                      onPressed: () => Get.back(),
                    ),
                  ),

                  // Segmented Tabs ('Ride' | 'Meet People')
                  Expanded(
                    child: Center(
                      child: RideSegmentedTabWidget(
                        selectedIndex: _selectedTabIndex,
                        onTabSelected: (index) {
                          setState(() => _selectedTabIndex = index);
                        },
                      ),
                    ),
                  ),

                  const SizedBox(width: 40), // Balance back button
                ],
              ),
            ),

            // Scrollable Tab Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: isRideTab
                    ? _buildRideTabContent()
                    : const MeetPeopleViewWidget(),
              ),
            ),

            // Bottom CTA Button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    final rideArgs = {
                      'pickup': 'New York, NY',
                      'destination': 'Brooklyn, NY',
                      'scheduledTime': _leaveTime,
                    };

                    // Persist to scheduled rides controller
                    RideScheduleController.to.addScheduledRide(
                      pickup: 'New York, NY',
                      destination: 'Brooklyn, NY',
                      scheduledTime: _leaveTime,
                    );

                    if (isRideTab) {
                      Get.toNamed(AppRoutes.rideOptionsScreen, arguments: rideArgs);
                    } else {
                      Get.toNamed(AppRoutes.rideBuddiesScreen, arguments: rideArgs);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: const Color(0xFF07141E),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27),
                    ),
                  ),
                  child: Text(
                    isRideTab ? AppStrings.findMatches : 'Find Nearby Buddies',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Content for 'Ride' tab
  Widget _buildRideTabContent() {
    return Column(
      children: [
        // Taller Map preview card
        const RideMapPreviewWidget(
          title: 'Where are you going?',
          height: 400,
        ),

        const SizedBox(height: 22),

        // Pickup, destination and departure time card
        RideLocationCardWidget(
          pickup: 'New York, NY',
          destination: 'Brooklyn, NY',
          leaveTime: _leaveTime,
          onTimeTap: _selectTime,
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
