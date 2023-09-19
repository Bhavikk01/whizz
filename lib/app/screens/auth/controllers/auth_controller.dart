
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whizz/app/services/auth_services.dart';

import '../../../utils/loading_overlay.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController resetPassword = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController otpForgotPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signInByEmail() async {
    await AuthServices.to.handleSignInByEmail(emailController.text, passwordController.text);
  }

  bool validatePhoneNumber() {
    return (int.tryParse(phoneController.text) != null) &&
        phoneController.text.length == 10;
  }

  handleSignInWithPhone() async {
    LoadingOverlay.showOverlay();
    // await AuthServices.to.verifyPhoneNumber(phoneController.text);
  }
}
