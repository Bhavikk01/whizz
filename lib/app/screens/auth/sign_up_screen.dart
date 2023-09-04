import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../routes/app_pages.dart';
import '../../utils/colors.dart';
import '../home/controllers/home_controller.dart';

class SignUpScreen extends GetView<HomeController> {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 52,
                ),
                Text(
                  "Sign up to Whizz",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: ColorsUtil.darkTextColor),
                ),
                SizedBox(
                  height: 4,
                ),
                Wrap(
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ColorsUtil.lightTextColor),
                    ),
                    Text("Login",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: ColorsUtil.purpleColor))
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                getTextField("Full Name"),

                getTextField("Email Address"),

                getTextField("Password"),

                getTextField("Confirm Password"),

                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.signUpDetails);
                  },
                  child: Text("Create Account"),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(StadiumBorder()),
                      backgroundColor:
                      MaterialStateProperty.all(ColorsUtil.purpleColor),
                      foregroundColor:
                      MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 14)),
                      textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w700))),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                          thickness: 1,
                        )),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "or sign up via",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ColorsUtil.lightTextColor),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: Divider(
                          thickness: 1,
                        ))
                  ],
                ),
                SizedBox(
                  height: 16 ,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/images/google_icon.png",height: 16 ,),
                      SizedBox(width: 10,),

                      Text("Google"),
                    ],
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                      foregroundColor: MaterialStateProperty.all(
                          ColorsUtil.darkTextColor),
                      side: MaterialStateProperty.all(
                          BorderSide(color: ColorsUtil.borderColor)),
                      elevation: MaterialStateProperty.all(0),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 14 )),
                      textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500))),
                ),
                SizedBox(
                  height: 16 ,
                ),
                Wrap(
                  children: [
                    Text(
                      "By signing up to Whizz you agree to our ",
                      style: TextStyle(
                          fontSize: 14  ,
                          fontWeight: FontWeight.w500,
                          color: ColorsUtil.lightTextColor),
                    ),
                    Text("terms and condition.",
                        style: TextStyle(
                            fontSize: 14  ,
                            fontWeight: FontWeight.w700,
                            color: ColorsUtil.purpleColor))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget getTextField(String hintText) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: TextField(
        decoration: InputDecoration(
            contentPadding:
            EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.transparent, width: 0)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.transparent, width: 0)),
            filled: true,
            fillColor: ColorsUtil.textFieldColor,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
      ),
    );
  }
}
