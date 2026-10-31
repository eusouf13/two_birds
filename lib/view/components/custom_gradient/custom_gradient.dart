import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomGradient extends StatelessWidget {
  final Widget child;
  final Color color1;
  final Color color2;

  const CustomGradient({
    super.key,
    required this.child,
    this.color1 = Colors.white,
    // this.color2 = const Color(0xFF2DBE60),
    this.color2 = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: const [0.0, 0.2506, 1.0],
            colors: const [
              Colors.white,
              Color(0xF5F4FCFF), // rgba(244, 252, 255, 0.96)
              Colors.white,
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
