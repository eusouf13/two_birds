import 'package:flutter/material.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../custom_netwrok_image/custom_network_image.dart';
import '../custom_text/custom_text.dart';

class CustomNotificationCard extends StatelessWidget {
  const CustomNotificationCard({
    super.key,
    required this.profileImage,
    required this.notificationTitle,
    required this.notificationSubTitle,
    this.notificationTime,
    this.onTap,
  });

  final String profileImage;
  final String notificationTitle;
  final String notificationSubTitle;
  final String? notificationTime;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: InkWell(
            onTap: onTap,
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //================== Notification Image ===================//
                  CustomNetworkImage(
                    imageUrl: profileImage,
                    height: 50,
                    width: 50,
                    boxShape: BoxShape.circle,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //============ Notification Titile ====================//
                        CustomText(
                          text: notificationTitle,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                          bottom: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //===================== Notification Subtitle ==============//
                            Expanded(
                              child: CustomText(
                                textAlign: TextAlign.left,
                                text: notificationSubTitle,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.white,
                              ),
                            ),
                            //======================== Notification Time ================//
                            CustomText(
                              text: notificationTime ?? '',
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: AppColors.white,
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
        ),
        SizedBox(height: 12),
        //======================== Divider ========================//
        Divider(height: 1, color: AppColors.white.withValues(alpha: .2)),
        SizedBox(height: 16),
      ],
    );
  }
}
