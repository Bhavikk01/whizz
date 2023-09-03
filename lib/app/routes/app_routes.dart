part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  /* Auth Routes */
  static const loginWithPhone = '/loginWithPhone';
  static const forgotPassword = '/forgotPassword';
  static const signUp = '/signUp';
  static const loginWithEmail = '/loginWithEmail';

  /* Home Route */
  static const home = '/home';
}
