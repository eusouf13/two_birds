import 'package:two_birds/view/components/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_colors/app_colors.dart';

class GeneralErrorScreen extends StatelessWidget {
  const GeneralErrorScreen({super.key, required this.onTap});
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff364153),
      body: ResponsiveBody(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const CustomImage(imageSrc: AppImages.noInternetImage),
              SizedBox(height: 20),
              Text(
                "something_wrong".tr,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.red,
                  minimumSize: const Size(44, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(32),
                      bottomLeft: Radius.circular(32),
                    ),
                  ),
                ),
                child: Text(
                  "try_again".tr,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
