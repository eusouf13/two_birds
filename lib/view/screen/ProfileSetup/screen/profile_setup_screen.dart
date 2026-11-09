import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../widget/profile_progress_bar_widget.dart';
import '../widget/step_about_widget.dart';
import '../widget/step_interests_widget.dart';
import '../widget/step_intent_widget.dart';
import '../widget/step_photos_widget.dart';
import '../widget/step_socials_widget.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final PageController _pageController = PageController();
  int _currentStep = 0;
  final int _totalSteps = 5;

  // Step 2 Form controllers
  final TextEditingController _nameController =
      TextEditingController(text: 'Alex');
  final TextEditingController _ageController =
      TextEditingController(text: '28');
  final TextEditingController _occupationController =
      TextEditingController(text: 'Product Designer');
  final TextEditingController _neighborhoodController =
      TextEditingController(text: 'Washington, DC');
  final TextEditingController _bioController = TextEditingController(
    text:
        'Designer, foodie, hoop lover, and always down for a good ride and great conversation.',
  );

  // Step 3 Interests state
  final Set<String> _selectedInterests = {
    'Fitness',
    'Foodie',
    'Music',
    'Outdoors',
  };

  // Step 4 Socials state
  bool _isInstagramConnected = true;
  bool _isTikTokConnected = true;
  bool _showSocialLinksToMatches = true;

  // Step 5 Connection Intent state (Allows choosing more than one option)
  final Set<String> _selectedIntents = {'Dating', 'Friendship'};

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _ageController.dispose();
    _occupationController.dispose();
    _neighborhoodController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _onNextStep() {
    if (_currentStep < _totalSteps - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentStep++;
      });
    } else {
      // Final step complete: Finish setup and navigate to HomeScreen
      Get.snackbar(
        'Profile Created!',
        'You are all set to find and match with ride buddies.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF13222E),
        colorText: AppColors.white,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      );
      Get.offAllNamed(AppRoutes.homeScreen);
    }
  }

  void _onPreviousStep() {
    if (_currentStep > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentStep--;
      });
    } else {
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _currentStep == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _currentStep > 0) {
          _onPreviousStep();
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            children: [
              // Top Bar Navigation & Actions
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new,
                          color: AppColors.white, size: 20),
                      onPressed: _onPreviousStep,
                    ),
                    Text(
                      'Step ${_currentStep + 1} of $_totalSteps',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey_03,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Allow skipping optional steps or quick continue
                        if (_currentStep == _totalSteps - 1) {
                          Get.offAllNamed(AppRoutes.homeScreen);
                        } else {
                          _onNextStep();
                        }
                      },
                      child: Text(
                        _currentStep == _totalSteps - 1 ? 'Done' : 'Skip',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Segmented Progress Bar
              ProfileProgressBarWidget(
                currentStep: _currentStep,
                totalSteps: _totalSteps,
              ),

              const SizedBox(height: 8),

              // Multi-step PageView
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    // Step 1: Add Photos & Build Profile
                    const StepPhotosWidget(),

                    // Step 2: Tell Us About You
                    StepAboutWidget(
                      nameController: _nameController,
                      ageController: _ageController,
                      occupationController: _occupationController,
                      neighborhoodController: _neighborhoodController,
                      bioController: _bioController,
                    ),

                    // Step 3: Your Interests & Hobbies
                    StepInterestsWidget(
                      selectedInterests: _selectedInterests,
                      onToggleInterest: (interest) {
                        setState(() {
                          if (_selectedInterests.contains(interest)) {
                            _selectedInterests.remove(interest);
                          } else {
                            _selectedInterests.add(interest);
                          }
                        });
                      },
                    ),

                    // Step 4: Connect Your Socials (Optional)
                    StepSocialsWidget(
                      isInstagramConnected: _isInstagramConnected,
                      isTikTokConnected: _isTikTokConnected,
                      showSocialLinksToMatches: _showSocialLinksToMatches,
                      onToggleInstagram: (val) {
                        setState(() => _isInstagramConnected = val);
                      },
                      onToggleTikTok: (val) {
                        setState(() => _isTikTokConnected = val);
                      },
                      onToggleShowSocials: (val) {
                        setState(() => _showSocialLinksToMatches = val);
                      },
                    ),

                    // Step 5: What Brings You to Two Birds? (Intent - Multi-select)
                    StepIntentWidget(
                      selectedIntents: _selectedIntents,
                      onToggleIntent: (intent) {
                        setState(() {
                          if (_selectedIntents.contains(intent)) {
                            if (_selectedIntents.length > 1) {
                              _selectedIntents.remove(intent);
                            }
                          } else {
                            _selectedIntents.add(intent);
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),

              // Bottom CTA Button: "Continue"
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 10, 24, 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: _onNextStep,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: const Color(0xFF042F2C),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(27),
                      ),
                    ),
                    child: Text(
                      _currentStep == _totalSteps - 1
                          ? 'Complete Profile'
                          : 'Continue',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF042F2C),
                      ),
                    ),
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

