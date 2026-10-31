import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../utils/app_colors/app_colors.dart';

class RideSegmentedTabWidget extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const RideSegmentedTabWidget({
    super.key,
    this.selectedIndex = 0,
    required this.onTabSelected,
  });

  @override
  State<RideSegmentedTabWidget> createState() => _RideSegmentedTabWidgetState();
}

class _RideSegmentedTabWidgetState extends State<RideSegmentedTabWidget> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: const Color(0xFF101E2B),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF1B2F3F),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildPillTab(title: 'Ride', index: 0),
          _buildPillTab(title: 'Meet People', index: 1),
        ],
      ),
    );
  }

  Widget _buildPillTab({required String title, required int index}) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() => _currentIndex = index);
        widget.onTabSelected(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected ? const Color(0xFF07141E) : AppColors.grey_03,
          ),
        ),
      ),
    );
  }
}

