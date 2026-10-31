import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_strings/app_strings.dart';

class MatchConfirmationActionsWidget extends StatelessWidget {
  final VoidCallback onSendMessage;
  final VoidCallback onViewRideDetails;

  const MatchConfirmationActionsWidget({
    super.key,
    required this.onSendMessage,
    required this.onViewRideDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Primary Button: Send a Message
        SizedBox(
          width: double.infinity,
          height: 54,
          child: ElevatedButton(
            onPressed: onSendMessage,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: const Color(0xFF07141E),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(27),
              ),
            ),
            child: Text(
              AppStrings.sendAMessage,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.2,
              ),
            ),
          ),
        ),

        const SizedBox(height: 14),

        // Secondary Button: View Ride Details
        SizedBox(
          width: double.infinity,
          height: 54,
          child: OutlinedButton(
            onPressed: onViewRideDetails,
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color(0xFF101D28),
              foregroundColor: AppColors.white,
              elevation: 0,
              side: const BorderSide(
                color: Color(0xFF1E3243),
                width: 1.2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(27),
              ),
            ),
            child: Text(
              AppStrings.viewRideDetails,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

