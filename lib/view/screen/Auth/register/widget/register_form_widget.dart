import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_icons/app_icons.dart';
import '../../../../components/custom_button/custom_button.dart';
import '../../../../components/custom_text_field/custom_text_field.dart';

class RegisterFormWidget extends StatefulWidget {
  final VoidCallback onRegisterSuccess;

  const RegisterFormWidget({
    super.key,
    required this.onRegisterSuccess,
  });

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _agreeToTerms = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Full Name
          Text(
            'Full Name',
            style: GoogleFonts.poppins(
              color: AppColors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            textEditingController: _nameController,
            hintText: 'e.g. Sarah Jenkins',
            fillColor: AppColors.cardColor,
            fieldBorderColor: AppColors.cardBorder,
            focusBorderColor: AppColors.primary,
            inputTextStyle: const TextStyle(color: AppColors.white),
            hintStyle: const TextStyle(color: AppColors.greyLight),
            keyboardType: TextInputType.name,
          ),

          const SizedBox(height: 16),

          // Email Address
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

          const SizedBox(height: 16),

          // Password
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
            hintText: 'Create a password',
            isPassword: true,
            fillColor: AppColors.cardColor,
            fieldBorderColor: AppColors.cardBorder,
            focusBorderColor: AppColors.primary,
            inputTextStyle: const TextStyle(color: AppColors.white),
            hintStyle: const TextStyle(color: AppColors.greyLight),
          ),

          const SizedBox(height: 16),

          // Confirm Password
          Text(
            'Confirm Password',
            style: GoogleFonts.poppins(
              color: AppColors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            textEditingController: _confirmPasswordController,
            hintText: 'Confirm your password',
            isPassword: true,
            fillColor: AppColors.cardColor,
            fieldBorderColor: AppColors.cardBorder,
            focusBorderColor: AppColors.primary,
            inputTextStyle: const TextStyle(color: AppColors.white),
            hintStyle: const TextStyle(color: AppColors.greyLight),
            textInputAction: TextInputAction.done,
          ),

          const SizedBox(height: 14),

          // Agree to Terms Checkbox
          GestureDetector(
            onTap: () {
              setState(() => _agreeToTerms = !_agreeToTerms);
            },
            child: Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Checkbox(
                    value: _agreeToTerms,
                    activeColor: AppColors.primary,
                    checkColor: const Color(0xFF07141E),
                    side: const BorderSide(color: Color(0xFF2E4357), width: 1.5),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    onChanged: (val) {
                      setState(() => _agreeToTerms = val ?? true);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'I agree to the Terms of Service & Privacy Policy',
                    style: GoogleFonts.poppins(
                      color: AppColors.grey_03,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Sign Up Button
          CustomButton(
            title: 'Create Account',
            fillColor: AppColors.primary,
            textColor: const Color(0xFF07141E),
            borderRadius: 27,
            onTap: widget.onRegisterSuccess,
          ),

          const SizedBox(height: 22),

          // Divider with text "Or sign up with"
          Row(
            children: [
              const Expanded(child: Divider(color: Color(0xFF1E3243), thickness: 1)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Text(
                  'Or sign up with',
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

          // Google Sign Up Button
          _buildGoogleButton(),

          const SizedBox(height: 24),

          // Already have an account link
          Center(
            child: GestureDetector(
              onTap: () => Get.back(),
              child: RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: GoogleFonts.poppins(
                    color: AppColors.grey_03,
                    fontSize: 13,
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign In',
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
        onPressed: widget.onRegisterSuccess,
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
              'Sign up with Google',
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
