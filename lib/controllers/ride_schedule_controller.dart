import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_colors/app_colors.dart';

class ScheduledRide {
  final String id;
  final String pickup;
  final String destination;
  final String scheduledTime;
  final int matchesFound;
  final String status;

  ScheduledRide({
    required this.id,
    required this.pickup,
    required this.destination,
    required this.scheduledTime,
    this.matchesFound = 3,
    this.status = 'Scheduled',
  });
}

class RideScheduleController extends GetxController {
  static RideScheduleController get to => Get.isRegistered<RideScheduleController>()
      ? Get.find<RideScheduleController>()
      : Get.put(RideScheduleController());

  final RxList<ScheduledRide> scheduledRides = <ScheduledRide>[
    ScheduledRide(
      id: '1',
      pickup: 'Dupont Circle, DC',
      destination: 'Arlington, VA',
      scheduledTime: 'Today, 6:30 PM',
      matchesFound: 4,
    ),
    ScheduledRide(
      id: '2',
      pickup: 'Williamsburg, Brooklyn',
      destination: 'Financial District, NY',
      scheduledTime: 'Tomorrow, 8:00 AM',
      matchesFound: 2,
    ),
    ScheduledRide(
      id: '3',
      pickup: 'DUMBO, Brooklyn',
      destination: 'Midtown Manhattan',
      scheduledTime: 'Fri, 5:45 PM',
      matchesFound: 3,
    ),
  ].obs;

  final RxString activeDestination = 'Arlington, VA'.obs;
  final RxString activePickup = 'Dupont Circle, DC'.obs;
  final RxString activeScheduledTime = 'Today, 6:30 PM'.obs;

  void addScheduledRide({
    required String pickup,
    required String destination,
    required String scheduledTime,
  }) {
    final newRide = ScheduledRide(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      pickup: pickup.isEmpty ? 'Dupont Circle, DC' : pickup,
      destination: destination.isEmpty ? 'Arlington, VA' : destination,
      scheduledTime: scheduledTime,
      matchesFound: 3,
    );

    activePickup.value = newRide.pickup;
    activeDestination.value = newRide.destination;
    activeScheduledTime.value = newRide.scheduledTime;

    scheduledRides.insert(0, newRide);

    Get.snackbar(
      'Ride Scheduled Successfully!',
      'Scheduled for $scheduledTime to ${newRide.destination}',
      snackPosition: SnackPosition.TOP,
      backgroundColor: const Color(0xFF102230),
      colorText: AppColors.white,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(16),
      icon: const Icon(Icons.check_circle_outline_rounded, color: AppColors.primary),
    );
  }

  void removeScheduledRide(String id) {
    scheduledRides.removeWhere((ride) => ride.id == id);
    Get.snackbar(
      'Ride Removed',
      'The scheduled ride has been cancelled.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF1E2833),
      colorText: AppColors.white,
      duration: const Duration(seconds: 2),
    );
  }
}

