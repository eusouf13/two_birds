import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../controllers/ride_schedule_controller.dart';
import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_colors/app_colors.dart';

class HomeSearchCommuteCard extends StatefulWidget {
  final VoidCallback onSearch;
  final ValueChanged<String>? onDestinationChanged;

  const HomeSearchCommuteCard({
    super.key,
    required this.onSearch,
    this.onDestinationChanged,
  });

  @override
  State<HomeSearchCommuteCard> createState() => _HomeSearchCommuteCardState();
}

class _HomeSearchCommuteCardState extends State<HomeSearchCommuteCard> {
  // শুরুতে কোনো টেক্সট থাকবে না
  final _pickupController = TextEditingController();
  final _destinationController = TextEditingController();
  String _scheduledTime = 'Today, 6:30 PM';

  Future<void> _selectScheduleTime(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 30)),
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

    if (pickedDate != null && context.mounted) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: const TimeOfDay(hour: 18, minute: 30),
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

      if (pickedTime != null) {
        final isToday = pickedDate.day == now.day &&
            pickedDate.month == now.month &&
            pickedDate.year == now.year;
        final isTomorrow = pickedDate.day == now.add(const Duration(days: 1)).day;
        final dayStr = isToday
            ? 'Today'
            : isTomorrow
                ? 'Tomorrow'
                : '${pickedDate.month}/${pickedDate.day}';

        setState(() {
          _scheduledTime = '$dayStr, ${pickedTime.format(context)}';
        });
      }
    }
  }

  @override
  void dispose() {
    _pickupController.dispose();
    _destinationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF111E2A),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFF1E3243), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.35),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Pickup row
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(Icons.navigation_rounded, color: AppColors.primary, size: 16),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: _pickupController,
                  style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    labelText: 'Pickup Location',
                    labelStyle: GoogleFonts.poppins(color: AppColors.primary, fontSize: 11),
                    hintText: 'Enter your pickup location',
                    hintStyle: GoogleFonts.poppins(color: AppColors.grey_03.withValues(alpha: 0.6), fontSize: 13),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ],
          ),

          // Connector dots
          Padding(
            padding: const EdgeInsets.only(left: 13, top: 4, bottom: 4),
            child: SizedBox(
              height: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  3,
                  (index) => Container(
                    width: 3,
                    height: 3,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Destination row
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: const Color(0xFFEF4444).withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(Icons.location_on_rounded, color: Color(0xFFEF4444), size: 16),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: _destinationController,
                  onChanged: widget.onDestinationChanged,
                  style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    labelText: 'Destination',
                    labelStyle: GoogleFonts.poppins(color: const Color(0xFFF87171), fontSize: 11),
                    hintText: 'Enter your destination',
                    hintStyle: GoogleFonts.poppins(color: AppColors.grey_03.withValues(alpha: 0.6), fontSize: 13),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          const Divider(color: Color(0xFF1E3243), height: 1),
          const SizedBox(height: 14),

          // Quick Destination Chips
          Text(
            'Quick destinations',
            style: GoogleFonts.poppins(
              color: AppColors.grey_03,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),

          // Schedule for Later Selector
          GestureDetector(
            onTap: () => _selectScheduleTime(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF0C1722),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFF1E3243), width: 1),
              ),
              child: Row(
                children: [
                  const Icon(Icons.schedule_rounded, color: AppColors.primary, size: 18),
                  const SizedBox(width: 10),
                  Text(
                    'Schedule: ',
                    style: GoogleFonts.poppins(color: AppColors.grey_03, fontSize: 12),
                  ),
                  Text(
                    _scheduledTime,
                    style: GoogleFonts.poppins(color: AppColors.white, fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_drop_down, color: AppColors.grey_03),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),

          // Search Shared Rides CTA Button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () {
                final pickup = _pickupController.text.trim().isEmpty
                    ? 'Dupont Circle, DC'
                    : _pickupController.text.trim();
                final destination = _destinationController.text.trim().isEmpty
                    ? 'Arlington, VA'
                    : _destinationController.text.trim();

                RideScheduleController.to.addScheduledRide(
                  pickup: pickup,
                  destination: destination,
                  scheduledTime: _scheduledTime,
                );

                Get.toNamed(AppRoutes.rideBuddiesScreen, arguments: {
                  'pickup': pickup,
                  'destination': destination,
                  'scheduledTime': _scheduledTime,
                });
              },
              icon: const Icon(Icons.directions_car_rounded, size: 20),
              label: Text(
                'Find Shared Rides',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.2,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: const Color(0xFF07141E),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}