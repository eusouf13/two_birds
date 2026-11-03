import 'package:get/get.dart';
import '../../view/screen/Auth/welcome/screen/welcome_screen.dart';
import '../../view/screen/Auth/onboarding/screen/onboarding_screen.dart';
import '../../view/screen/Auth/login/screen/login_screen.dart';
import '../../view/screen/Auth/register/screen/register_screen.dart';
import '../../view/screen/Home/home/screen/home_screen.dart';
import '../../view/screen/Messages/screen/messages_screen.dart';
import '../../view/screen/Messages/screen/chat_inbox_screen.dart';
import '../../view/screen/Profile/screen/profile_screen.dart';
import '../../view/screen/Profile/screen/edit_profile_screen.dart';
import '../../view/screen/Profile/screen/account_screen.dart';
import '../../view/screen/Profile/screen/safety_verification_screen.dart';
import '../../view/screen/Profile/screen/subscription_screen.dart';
import '../../view/screen/Profile/screen/help_support_screen.dart';
import '../../view/screen/Profile/screen/terms_of_service_screen.dart';
import '../../view/screen/Profile/screen/privacy_policy_screen.dart';
import '../../view/screen/Ride/ride_search/screen/ride_search_screen.dart';
import '../../view/screen/Ride/ride_options/screen/ride_options_screen.dart';
import '../../view/screen/Ride/ride_details/screen/ride_details_screen.dart';
import '../../view/screen/Match/ride_buddies/screen/ride_buddies_screen.dart';
import '../../view/screen/Match/ride_buddies/screen/buddy_details_screen.dart';
import '../../view/screen/Match/match_confirmation/screen/match_confirmation_screen.dart';
import '../../view/screen/ProfileSetup/screen/profile_setup_screen.dart';

class AppRoutes {
  static const String welcomeScreen = '/welcomeScreen';
  static const String onboardingScreen = '/onboardingScreen';
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
  static const String profileSetupScreen = '/profileSetupScreen';
  static const String homeScreen = '/homeScreen';
  static const String messagesScreen = '/messagesScreen';
  static const String chatInboxScreen = '/chatInboxScreen';
  static const String profileScreen = '/profileScreen';
  static const String editProfileScreen = '/editProfileScreen';
  static const String accountScreen = '/accountScreen';
  static const String safetyVerificationScreen = '/safetyVerificationScreen';
  static const String subscriptionScreen = '/subscriptionScreen';
  static const String helpSupportScreen = '/helpSupportScreen';
  static const String termsOfServiceScreen = '/termsOfServiceScreen';
  static const String privacyPolicyScreen = '/privacyPolicyScreen';
  static const String rideSearchScreen = '/rideSearchScreen';
  static const String rideOptionsScreen = '/rideOptionsScreen';
  static const String rideDetailsScreen = '/rideDetailsScreen';
  static const String rideBuddiesScreen = '/rideBuddiesScreen';
  static const String buddyDetailsScreen = '/buddyDetailsScreen';
  static const String matchConfirmationScreen = '/matchConfirmationScreen';

  // Compatibility routes
  static const String favoritesScreen = '/favoritesScreen';
  static const String giveScreen = '/giveScreen';
  static const String inboxScreen = '/inboxScreen';

  static List<GetPage> routes = [
    GetPage(name: welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(name: onboardingScreen, page: () => const OnboardingScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: registerScreen, page: () => const RegisterScreen()),
    GetPage(name: profileSetupScreen, page: () => const ProfileSetupScreen()),
    GetPage(name: homeScreen, page: () => const HomeScreen()),
    GetPage(name: messagesScreen, page: () => const MessagesScreen()),
    GetPage(name: chatInboxScreen, page: () => const ChatInboxScreen()),
    GetPage(name: profileScreen, page: () => const ProfileScreen()),
    GetPage(name: editProfileScreen, page: () => const EditProfileScreen()),
    GetPage(name: accountScreen, page: () => const AccountScreen()),
    GetPage(name: safetyVerificationScreen, page: () => const SafetyVerificationScreen()),
    GetPage(name: subscriptionScreen, page: () => const SubscriptionScreen()),
    GetPage(name: helpSupportScreen, page: () => const HelpSupportScreen()),
    GetPage(name: termsOfServiceScreen, page: () => const TermsOfServiceScreen()),
    GetPage(name: privacyPolicyScreen, page: () => const PrivacyPolicyScreen()),
    GetPage(name: rideSearchScreen, page: () => const RideSearchScreen()),
    GetPage(name: rideOptionsScreen, page: () => const RideOptionsScreen()),
    GetPage(name: rideDetailsScreen, page: () => const RideDetailsScreen()),
    GetPage(name: rideBuddiesScreen, page: () => const RideBuddiesScreen()),
    GetPage(name: buddyDetailsScreen, page: () => const BuddyDetailsScreen()),
    GetPage(name: matchConfirmationScreen, page: () => const MatchConfirmationScreen()),
  ];
}
