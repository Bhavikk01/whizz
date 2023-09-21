import 'package:get/get.dart';
import 'package:whizz/app/screens/auth/bindings/auth_binding.dart';
import 'package:whizz/app/screens/auth/sign_up_screen.dart';
import 'package:whizz/app/screens/auth/sign_up_user_detail_screen.dart';
import 'package:whizz/app/screens/health_care/healthcare_center_detail_screen/binding/healthcare_binding.dart';
import 'package:whizz/app/screens/health_care/healthcare_center_detail_screen/healthcare_center_detail_screen.dart';

import '../screens/auth/bindings/sign_up_binding.dart';
import '../screens/auth/forgot_password.dart';
import '../screens/auth/login_with_email.dart';
import '../screens/home/bindings/home_binding.dart';
import '../screens/home/home_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [

    /* Authentication pages */
    GetPage(
      name: Routes.loginWithEmail,
      page: () => const LoginWithEmail(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUp,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpDetails,
      page: ()=>const SignUpUserDetails(),
      binding: SignUpBinding(),
    ),

    /* Home Page */
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),

    /* Healthcare Screen */
    GetPage(
      name: Routes.healthCenterScreen,
      page: ()=>const HealthcareCenterDetailScreen(),
      binding: HealthcareBinding(),
    ),

  ];
}
