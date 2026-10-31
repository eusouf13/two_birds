import 'package:two_birds/view/components/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../custom_image/custom_image.dart';
import '../custom_text/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.height = 54,
    this.width = double.maxFinite,
    required this.onTap,
    this.title = '',
    this.marginVertical = 0,
    this.marginHorizontal = 0,
    this.fillColor = AppColors.primary,
    this.textColor,
    this.isBorder = false,
    this.fontSize,
    this.borderWidth,
    this.borderRadius,
    this.borderColor = AppColors.primary,
    this.showSocialButton = false,
    this.imageSrc,
    this.fontWeight,
    this.icon,
    this.isLoading = false,
  });

  final double height;
  final double? width;
  final Color? fillColor;
  final Color? textColor;
  final Color borderColor;
  final VoidCallback? onTap;
  final String title;
  final double marginVertical;
  final double marginHorizontal;
  final bool isBorder;
  final double? fontSize;
  final double? borderWidth;
  final double? borderRadius;
  final bool showSocialButton;
  final String? imageSrc;
  final Icon? icon;
  final FontWeight? fontWeight;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return TouchTarget(
      onTap: isLoading ? null : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: EdgeInsets.symmetric(
          vertical: marginVertical,
          horizontal: marginHorizontal,
        ),
        alignment: Alignment.center,
        constraints: BoxConstraints(
          minWidth: 44,
          minHeight: height < 44 ? 44 : height,
        ),
        width: width,
        decoration: BoxDecoration(
          border: isBorder
              ? Border.all(color: borderColor, width: borderWidth ?? .05)
              : null,
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          color: fillColor,
        ),
        child: isLoading
            ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: textColor ?? AppColors.white,
                  strokeWidth: 3,
                ),
              )
            : (showSocialButton
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImage(imageSrc: imageSrc ?? ""),
                        Flexible(
                          child: CustomText(
                            left: 8,
                            fontSize: fontSize ?? 16,
                            fontWeight: fontWeight ?? FontWeight.w700,
                            color: textColor ?? AppColors.white,
                            textAlign: TextAlign.center,
                            text: title,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        icon != null
                            ? Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: icon,
                              )
                            : SizedBox.shrink(),
                        Flexible(
                          child: CustomText(
                            fontSize: fontSize ?? 18,
                            fontWeight: FontWeight.w700,
                            color: textColor ?? AppColors.white,
                            textAlign: TextAlign.center,
                            text: title,
                          ),
                        ),
                      ],
                    )),
      ),
    );
  }
}
