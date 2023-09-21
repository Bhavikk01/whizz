part of 'app_pages.dart';

class Routes {

  Routes._();

  /* Auth Routes */
  static const loginWithPhone = '/loginWithPhone';
  static const forgotPassword = '/forgotPassword';
  static const signUp = '/signUp';
  static const signUpDetails = '/signUpDetails';
  static const loginWithEmail = '/loginWithEmail';

  /* Home Routes */
  static const home = '/home';
  static const dashboard = '$home/dashboard';
  static const userProfile = '$home/userProfile';
  static const appointmentScreen = '$home/appointmentScreen';
  static const searchHealthCenterScreen = '$home/searchHealthCenterScreen';

  /* Dashboard Routes */
  static const reminderScreen = '$dashboard/reminderScreen';
  static const diseaseRecommendation = '$dashboard/diseaseRecommendation';


  /* Health Center Routes */
  static const healthCenterScreen = '/healthCenterScreen';
}
