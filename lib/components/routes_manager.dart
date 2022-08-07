// // import 'package:Finwallet/screens/budget_details.dart';
// import 'package:Finwallet/screens/account_type_screen.dart';
// import 'package:Finwallet/screens/individual_screens/individual_sila_register.dart';
// import 'package:Finwallet/screens/individual_screens/individual_signUp.dart';
// import 'package:Finwallet/screens/business_screens/business_type.dart';

// import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';

// import '../screens/business_screens/business_administrator_sign_up.dart';
// import '../screens/business_screens/business_sila_registration.dart';
// import '../screens/business_screens/kyb_screen.dart/kyb_failed.dart';
// import '../screens/business_screens/kyb_screen.dart/kyb_success.dart';
// import '../screens/business_screens/kyb_screen.dart/kyb_waiting.dart';
// // import '../screens/edit _profile.dart';
// import '../screens/change_password.dart';
// import '../screens/home_screen.dart';
// import '../screens/individual_screens/kyc_screens.dart/kyc_failed.dart';
// import '../screens/individual_screens/kyc_screens.dart/kyc_success.dart';
// import '../screens/individual_screens/kyc_screens.dart/kyc_waiting.dart';
// import '../screens/login_screen.dart';
// import '../screens/my_wallet_screen.dart';

// import '../screens/pending/reset_password.dart';
// import '../screens/pending/complete_profile.dart';
// import '../screens/pending/notification_details.dart';
// import '../screens/transactions/payment_details.dart';
// import '../screens/pending/privacy_policy.dart';
// import '../screens/individual_screens/profile_page.dart';
// import '../screens/business_screens/signup_business_screen.dart';
// import '../screens/pending/transfer_funds.dart';
// import '../screens/splash_screen.dart';

// class Routes {
//   static const String splashRoute = '/';
//   static const String loginRoute = '/login';
//   static const String individualSignUpRoute = '/individualSignUp';
//   static const String completeProfileRoute = '/completeProfile';
//   static const String homeScreenRoute = '/homeScreen';
//   static const String myWalletRoute = '/myWallet';
//   static const String profileRoute = '/profile';
//   static const String budgetDetailRoute = '/budgetDetail';
//   static const String editProfileRoute = '/editProfile';
//   static const String transferFundsRoute = '/transferFunds';
//   static const String privacyPolicyRoute = '/privacyPolicy';
//   static const String selectAccountTypeRoute = '/selectAccountType';
//   static const String notificationSettingsRoute = '/notificationSettings';
//   static const String changePasswordRoute = '/changePassword';
//   static const String transactionDetailRoute = '/transactionDetail';
//   static const String signupBusinessRoute = '/signupBusiness';
//   static const String businessSilaRegistationRoute = '/businessSilaRegistation';
//   static const String businessAdminstratorSignUpRoute =
//       '/businessAdminstratorSignUp';
//   static const String businessTypeRoute = '/businessType';
//   static const String individualSilaRegisterRoute = '/completeCustomerProfile';
//   static const String transactionDetailAnimatedRoute = '/AnitransactionDetail';
//   static const String loginAnimatedRoute = '/Anilogin';
//   static const String registerAccountAnimatedRoute = '/AniregisterAccount';
//   static const String kycFailedRoute = '/kycFailed';
//   static const String kycSuccessRoute = '/kycSuccess';
//   static const String kycPendingRoute = '/kycPending';
//   static const String kybFailedRoute = '/kybFailed';
//   static const String kybSuccessRoute = '/kybSuccess';
//   static const String kybPendingRoute = '/kybPending';
// }

// class RouteGenerator {
//   static Route<dynamic> getRoute(RouteSettings routeSettings) {
//     switch (routeSettings.name) {
//       case Routes.splashRoute:
//         return MaterialPageRoute(builder: (_) => const Splash());
//       case Routes.loginRoute:
//         return MaterialPageRoute(builder: (_) => LoginScreen());
//       case Routes.individualSignUpRoute:
//         return MaterialPageRoute(builder: (_) => IndividualSignUpScreen());
//       case Routes.completeProfileRoute:
//         return MaterialPageRoute(builder: (_) => CompleteProfilScreen());
//       case Routes.myWalletRoute:
//         return MaterialPageRoute(builder: (_) => MyWalletScreen());
//       case Routes.profileRoute:
//         return MaterialPageRoute(builder: (_) => ProfileScreen());
//       case Routes.signupBusinessRoute:
//         return MaterialPageRoute(builder: (_) => SignupBusinessScreen());
//       case Routes.businessTypeRoute:
//         return MaterialPageRoute(builder: (_) => SelectBusinessType());
//       case Routes.businessSilaRegistationRoute:
//         return MaterialPageRoute(builder: (_) => BusinessSilaRegistration());
//       case Routes.businessAdminstratorSignUpRoute:
//         return MaterialPageRoute(builder: (_) => BusinessAdministratorSignUp());
//       case Routes.individualSilaRegisterRoute:
//         return MaterialPageRoute(
//             builder: (_) => IndividualSilaRegisterScreen());
//       // case Routes.budgetDetailRoute:
//       // return MaterialPageRoute(builder: (_) => BudgetDetailsScreen());
//       // case Routes.editProfileRoute:
//       //   return MaterialPageRoute(builder: (_) => EditProfileScreen());
//       case Routes.transferFundsRoute:
//         return MaterialPageRoute(builder: (_) => TransferFundScreen());
//       case Routes.privacyPolicyRoute:
//         return MaterialPageRoute(builder: (_) => PrivacyPolicyScreen());
//       case Routes.notificationSettingsRoute:
//         return MaterialPageRoute(builder: (_) => NotificationsSettingsScreen());
//       case Routes.changePasswordRoute:
//         return MaterialPageRoute(builder: (_) => ChangePasswordScreen());
//       case Routes.homeScreenRoute:
//         return MaterialPageRoute(builder: (_) => HomeScreen());
//       // case Routes.transactionDetailRoute:
//       //   return MaterialPageRoute(builder: (_) => PaymentDetailsScreen());
//       case Routes.selectAccountTypeRoute:
//         return MaterialPageRoute(builder: (_) => AccountType());
//       case Routes.kycFailedRoute:
//         return MaterialPageRoute(builder: (_) => KycFailed());
//       case Routes.kycSuccessRoute:
//         return MaterialPageRoute(builder: (_) => KycSuccess());
//       case Routes.kycPendingRoute:
//         return MaterialPageRoute(builder: (_) => KycWaiting());
//       case Routes.kybFailedRoute:
//         return MaterialPageRoute(builder: (_) => KybFailed());
//       case Routes.kybSuccessRoute:
//         return MaterialPageRoute(builder: (_) => KybSuccess());
//       case Routes.kybPendingRoute:
//         return MaterialPageRoute(
//             builder: (_) => KybWaiting(
//                   step: 0,
//                 ));

//       // case Routes.transactionDetailAnimatedRoute:
//       //   return PageTransition(
//       //       child: PaymentDetailsScreen(),
//       //       duration: Duration(milliseconds: 300),
//       //       type: PageTransitionType.rightToLeft);
//       case Routes.registerAccountAnimatedRoute:
//         return PageTransition(
//             child: IndividualSignUpScreen(),
//             type: PageTransitionType.leftToRight);
//       case Routes.loginAnimatedRoute:
//         return PageTransition(
//             child: LoginScreen(), type: PageTransitionType.rightToLeft);

//       default:
//         return unDefinedRoute();
//     }
//   }

//   static Route<dynamic> unDefinedRoute() {
//     return MaterialPageRoute(
//       builder: (_) => Scaffold(
//         appBar: AppBar(
//           title: const Text("No Route Found"),
//         ),
//         body: const Center(
//           child: Text("No Route Found"),
//         ),
//       ),
//     );
//   }
// }
