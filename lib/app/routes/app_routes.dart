part of 'app_pages.dart';

class Routes {


  Routes._();

  /// Auth Routes
  static const signUp = '/signUp';
  static const loginWithPhone = '/loginWithPhone';
  static const forgotPassword = '/forgotPassword';
  static const loginWithEmail = '/loginWithEmail';
  static const userProfileDetails = '/userProfileDetails';

  /// Home Routes
  static const home = '/home';
  static const dashboard = '$home/dashboard';
  static const userProfile = '$home/userProfile';
  static const doctorHomePage = '/doctorHomePage';
  static const appointmentScreen = '$home/appointmentScreen';
  static const searchHealthCenterScreen = '$home/searchHealthCenterScreen';

  /// Dashboard Routes
  static const reminderScreen = '$dashboard/reminderScreen';
  static const userReports = '$dashboard/userReports';
  static const diseaseRecommendation = '$dashboard/diseaseRecommendation';


  /// Health Center Routes
  static const healthCenterScreen = '/healthCenterScreen';
  static const doctorAppointment = '$healthCenterScreen/appointDoctor';
}
