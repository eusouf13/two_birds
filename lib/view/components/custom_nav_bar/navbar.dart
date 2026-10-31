import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/app_routes/app_routes.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../custom_text/custom_text.dart';

class Navbar extends StatefulWidget {
  final int currentIndex;
  final double maxWidth;

  const Navbar({required this.currentIndex, this.maxWidth = 700, super.key});

  @override
  State<Navbar> createState() => _NavBarState();
}

class _NavBarState extends State<Navbar> {
  late int bottomNavIndex;

  final List<Map<String, dynamic>> navItems = [
    {
      "iconU": "assets/images/home.png",
      "iconS": "assets/images/home.png",
      "label": "home".tr,
    },
    {
      "iconU": "assets/images/heart.png",
      "iconS": "assets/images/heart.png",
      "label": "favorites".tr,
    },
    {
      "iconU": " assets/images/add.png",
      "iconS": " assets/images/add.png",
      "label": "give".tr,
      "isGive": true,
    },
    {
      "iconU": "assets/images/message.png",
      "iconS": "assets/images/message.png",
      "label": "messages".tr,
    },
    {
      "iconU": "assets/images/man.png",
      "iconS": "assets/images/man.png",
      "label": "profile".tr,
    },
  ];

  @override
  void initState() {
    bottomNavIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        heightFactor: 1,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: widget.maxWidth),
          child: Container(
            clipBehavior: Clip.antiAlias,
            height:
                80 +
                32 *
                    ((MediaQuery.textScalerOf(context).scale(10) / 10) - 1)
                        .clamp(0.0, 3.0),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.0, 0.2506, 1.0],
                colors: [Colors.white, Color(0xF5F4FCFF), Colors.white],
              ),
              //border: Border(top: BorderSide(color: AppColors.greyLight, width: 1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(navItems.length, (index) {
                bool isSelected = index == bottomNavIndex;
                bool isGive = navItems[index]["isGive"] == true;

                return Expanded(
                  child: InkWell(
                    onTap: () => onTap(index),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isGive
                            ? Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: isSelected ? AppColors.primary : null,
                                  gradient: isSelected
                                      ? null
                                      : const LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          stops: [0.0, 0.2506, 1.0],
                                          colors: [
                                            Colors.white,
                                            Color(0xF5F4FCFF),
                                            Colors.white,
                                          ],
                                        ),
                                  borderRadius: BorderRadius.circular(12),
                                  border: isSelected
                                      ? null
                                      : Border.all(color: AppColors.greyLight),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: isSelected
                                      ? AppColors.white
                                      : AppColors.primary,
                                  size: 24,
                                ),
                              )
                            : Image.asset(
                                isSelected
                                    ? navItems[index]["iconS"]
                                    : navItems[index]["iconU"],
                                height: 30,
                                width: 30,
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.titleTextClr,
                              ),
                        SizedBox(height: 4),
                        CustomText(
                          text: navItems[index]["label"],
                          fontSize: 10,
                          maxLines: 2,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.titleTextClr,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  void onTap(int index) {
    if (index != bottomNavIndex) {
      setState(() {
        bottomNavIndex = index;
      });

      switch (index) {
        case 0:
          Get.offAllNamed(AppRoutes.homeScreen);
          break;
        case 1:
          Get.offAllNamed(AppRoutes.favoritesScreen);
          break;
        case 2:
          Get.offAllNamed(AppRoutes.giveScreen);
          break;
        case 3:
          Get.offAllNamed(AppRoutes.inboxScreen);
          break;
        case 4:
          Get.offAllNamed(AppRoutes.profileScreen);
          break;
      }
    }
  }
}
