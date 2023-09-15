import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whizz/app/utils/constants.dart';

import '../../routes/app_pages.dart';
import '../../utils/custom_bottom_snackbar.dart';
import 'controllers/auth_controller.dart';

class LoginWithPhone extends GetView<AuthController> {
  const LoginWithPhone({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Welcome',
            style: GoogleFonts.poppins(
              fontSize: 34,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.black,
                height: 1,
                width: 90,
              ),
              Text(
                'Log in or sign up',
                style: GoogleFonts.atkinsonHyperlegible(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              Container(
                color: Colors.black,
                height: 1,
                width: 90,
              ),
            ],
          ),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.topLeft,
            child: Text(
              ConstantData.loginInText,
              style: GoogleFonts.atkinsonHyperlegible(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: controller.phoneController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.phone),
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              style: const TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              minimumSize: const Size(179, 45),
            ),
            child: const Text(ConstantData.loginInText),
            onPressed: () {
              if(controller.validatePhoneNumber()){
                controller.handleSignInWithPhone();
              }else{
                customSnackBar(
                  type: AnimatedSnackBarType.warning,
                  message: 'Please enter a valid phone number',
                );
              }
            },
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Dont have account?',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 14.0),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.signUp);
                },
                child: Text(
                  ConstantData.signUpText,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
