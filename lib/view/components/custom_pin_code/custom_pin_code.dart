// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../utils/app_colors/app_colors.dart';

class CustomPinCode extends StatelessWidget {
  const CustomPinCode({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 360),
        child: LayoutBuilder(
          builder: (context, constraints) => PinCodeTextField(
            keyboardType: TextInputType.number,
            appContext: context,
            length: 6,
            enableActiveFill: true,
            animationType: AnimationType.fade,
            animationDuration: const Duration(milliseconds: 300),
            controller: controller,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(12),
              fieldHeight: 55,
              fieldWidth: ((constraints.maxWidth - 16) / 6).clamp(44.0, 50.0),
              inactiveColor: AppColors.primary,
              activeColor: AppColors.white_50, // active color
              activeFillColor: AppColors.white_50,
              inactiveFillColor: AppColors.white,
              selectedFillColor: AppColors.white, // selected color
              disabledColor: AppColors.white_50,
              selectedColor: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
