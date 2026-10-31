import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

          // Search Shared Rides CTA Button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: widget.onSearch,
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