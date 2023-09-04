import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:whizz/app/screens/auth/controllers/sign_up_controller.dart';

import '../../utils/colors.dart';

class SignUpUserDetails extends GetView<SignUpController> {
  const SignUpUserDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Hello Bhavik!",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: ColorsUtil.darkTextColor),
            ), Text(
              "Please provide some details",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: ColorsUtil.darkTextColor),
            ),
            CircleAvatar(
              radius: 100,
              backgroundColor: Colors.transparent,
              child: Stack(
                children: [
                  Positioned(child: Icon(Icons.add_circle),bottom: 10,right: 50,),
                  Lottie.asset("assets/profile.json", fit: BoxFit.fill),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            getTextField(
                hintText: "DOB",
                icon: Icons.calendar_month,
                onTap: controller.dobOnTap,
                readOnly: true),
            getTextField(hintText: "Address"),
            ElevatedButton(
              onPressed: () {},
              child: Text("Continue"),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(StadiumBorder()),
                  backgroundColor:
                      MaterialStateProperty.all(ColorsUtil.purpleColor),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 14)),
                  textStyle: MaterialStateProperty.all(
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w700))),
            ),
          ],
        ),
      ),
    );
  }

  Widget getTextField(
      {required String hintText,
      IconData? icon,
      Function()? onTap,
      bool readOnly = false}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: TextField(
        onTap: onTap,
        readOnly: readOnly!,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.transparent, width: 0)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.transparent, width: 0)),
            filled: true,
            fillColor: ColorsUtil.textFieldColor,
            hintText: hintText,
            icon: icon != null ? Icon(icon) : null,
            hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
      ),
    );
  }
}
