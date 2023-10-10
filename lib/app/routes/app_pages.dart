import 'package:Whizz/app/screens/dashboard/dashboard_screen.dart';
import 'package:Whizz/app/screens/dashboard/disease_prediction_screens/binding/disease_prediction_binding.dart';
import 'package:Whizz/app/screens/dashboard/disease_prediction_screens/disease_prediction_screen.dart';
import 'package:Whizz/app/screens/dashboard/disease_report_screen/disease_report_screen.dart';
import 'package:get/get.dart';
import 'package:Whizz/app/screens/auth/bindings/auth_binding.dart';
import 'package:Whizz/app/screens/auth/sign_up_screen.dart';
import 'package:Whizz/app/screens/auth/user_profile_details.dart';
import 'package:Whizz/app/screens/health_care/healthcare_center_detail_screen/binding/healthcare_binding.dart';
import 'package:Whizz/app/screens/health_care/healthcare_center_detail_screen/healthcare_center_detail_screen.dart';

import '../screens/auth/bindings/sign_up_binding.dart';
import '../screens/auth/bindings/user_profile_binding.dart';
import '../screens/auth/forgot_password.dart';
import '../screens/auth/login_with_email.dart';
import '../screens/dashboard/disease_report_screen/disease_report_binding/disease_report_binding.dart';
import '../screens/dashboard/reports/binding/user_reports_binding.dart';
import '../screens/dashboard/reports/user_reports_screen.dart';
import '../screens/health_care/appointment/appointment_screen.dart';
import '../screens/health_care/appointment/bindings/appointment_binding.dart';
import '../screens/health_care/doctor_panel/bindings/doctor_panel_binding.dart';
import '../screens/health_care/doctor_panel/doctor_panel_screen.dart';
import '../screens/home/bindings/home_binding.dart';
import '../screens/home/home_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [

    /// Authentication pages
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
      name: Routes.userProfileDetails,
      page: ()=> UserProfileDetails(),
      binding: UserProfileBinding()
    ),

    /// Home Page
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),

    /// Dashboard
    GetPage(
      name: Routes.reminderScreen,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.userReports,
      page: () => const UserReportsScreen(),
      binding: UserReportsBinding(),
    ),
    GetPage(
      name: Routes.diseaseRecommendation,
      page: ()=> const DiseasePredictionScreen(),
      binding: DiseasePredictionBinding(),
    ),
    GetPage(
      name: Routes.disease,
      page: ()=> const DiseaseReportScreen(),
      binding: DiseaseReportBinding(),
    ),

    /// Healthcare Screen
    GetPage(
      name: Routes.healthCenterScreen,
      page: ()=> const HealthcareCenterDetailScreen(),
      binding: HealthcareBinding(),
    ),
    GetPage(
      name: Routes.doctorAppointment,
      page: ()=> const AppointmentScreen(),
      binding: AppointmentBinding(),
    ),
    GetPage(
      name: Routes.doctorHomePage,
      page: ()=> const DoctorHomeScreen(),
      binding: DoctorPanelBinding(),
    ),

  ];
}
