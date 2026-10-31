import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_icons/app_icons.dart';
import '../../../../components/custom_button/custom_button.dart';
import '../../../../components/custom_text_field/custom_text_field.dart';

class LoginFormWidget extends StatefulWidget {
  final VoidCallback onLoginSuccess;

  const LoginFormWidget({
    super.key,
    required this.onLoginSuccess,
  });

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _rememberMe = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Email Address Field
          Text(
            'Email Address',
            style: GoogleFonts.poppins(
              color: AppColors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            textEditingController: _emailController,
            hintText: 'Enter your email',
            fillColor: AppColors.cardColor,
            fieldBorderColor: AppColors.cardBorder,
            focusBorderColor: AppColors.primary,
            inputTextStyle: const TextStyle(color: AppColors.white),
            hintStyle: const TextStyle(color: AppColors.greyLight),
            keyboardType: TextInputType.emailAddress,
          ),

          const SizedBox(height: 18),

          // Password Field
          Text(
            'Password',
            style: GoogleFonts.poppins(
              color: AppColors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            textEditingController: _passwordController,
            hintText: 'Enter your password',
            isPassword: true,
            fillColor: AppColors.cardColor,
            fieldBorderColor: AppColors.cardBorder,
            focusBorderColor: AppColors.primary,
            inputTextStyle: const TextStyle(color: AppColors.white),
            hintStyle: const TextStyle(color: AppColors.greyLight),
            textInputAction: TextInputAction.done,
          ),

          const SizedBox(height: 14),

          // Remember Me Checkbox & Forgot Password Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Remember Me Checkbox
              GestureDetector(
                onTap: () {
                  setState(() => _rememberMe = !_rememberMe);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 22,
                      height: 22,
                      child: Checkbox(
                        value: _rememberMe,
                        activeColor: AppColors.primary,
                        checkColor: const Color(0xFF07141E),
                        side: const BorderSide(color: Color(0xFF2E4357), width: 1.5),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        onChanged: (val) {
                          setState(() => _rememberMe = val ?? true);
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Remember me',
                      style: GoogleFonts.poppins(
                        color: AppColors.grey_03,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),

              // Forgot Password Link
              TextButton(
                onPressed: () {
                  Get.snackbar(
                    'Reset Password',
                    'Password reset link will be sent to your email.',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: const Color(0xFF13222E),
                    colorText: AppColors.white,
                  );
                },
                child: Text(
                  'Forgot Password?',
                  style: GoogleFonts.poppins(
                    color: AppColors.primary,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Sign In Button
          CustomButton(
            title: 'Sign In',
            fillColor: AppColors.primary,
            textColor: const Color(0xFF07141E),
            borderRadius: 27,
            onTap: widget.onLoginSuccess,
          ),

          const SizedBox(height: 24),

          // Divider with "Or sign in with"
          Row(
            children: [
              const Expanded(child: Divider(color: Color(0xFF1E3243), thickness: 1)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Text(
                  'Or sign in with',
                  style: GoogleFonts.poppins(
                    color: AppColors.greyLight,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Expanded(child: Divider(color: Color(0xFF1E3243), thickness: 1)),
            ],
          ),

          const SizedBox(height: 20),

          // Google Sign-In Button
          _buildGoogleButton(),

          const SizedBox(height: 28),

          // Don't have an account? Sign Up Link
          Center(
            child: GestureDetector(
              onTap: () {
                // Navigate to registration page
                Get.toNamed(AppRoutes.registerScreen);
              },
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: GoogleFonts.poppins(
                    color: AppColors.grey_03,
                    fontSize: 13,
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: GoogleFonts.poppins(
                        color: AppColors.primary,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildGoogleButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: widget.onLoginSuccess,
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xFF111E2A),
          side: const BorderSide(color: Color(0xFF1E3243), width: 1.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.google,
              width: 22,
              height: 22,
            ),
            const SizedBox(width: 12),
            Text(
              'Sign in with Google',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
