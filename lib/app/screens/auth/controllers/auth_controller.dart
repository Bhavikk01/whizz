
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whizz/app/services/auth_services.dart';

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
}
