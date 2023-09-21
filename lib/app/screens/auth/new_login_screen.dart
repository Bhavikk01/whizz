import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:whizz/app/utils/colors.dart';

class NewLoginScreen extends StatelessWidget {
  const NewLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: Get.height / 2.7,
                      decoration: BoxDecoration(
                          color: Color(0xff2B447C),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 160,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            height: Get.height / 2,
                            decoration: BoxDecoration(
                                color: ColorsUtil.brandWhite,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 2),
                                      blurRadius: 3,
                                      blurStyle: BlurStyle.outer)
                                ],
                                borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                Center(
                                  child: Text(
                                    'Sign in',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                        color: Color(0xff071C3F),
                                        fontWeight: FontWeight.w700,fontSize: 30),
                                  ),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Email or Phone",
                                  ),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                  ),
                                ),
                                ElevatedButton(
                                    onPressed: () {},

                                    child: Text("Sign in")),
                                Center(
                                    child: Text("Forgot password?",
                                        style: TextStyle(
                                            decoration: TextDecoration.underline,
                                            color: Color(0xFF3366CC),
                                            fontWeight: FontWeight.w500))),
                                Text.rich(
                                  TextSpan(

                                    children: [
                                      TextSpan(
                                        text:
                                        'By clicking this button, you are agreeing with our\n',
                                        style: TextStyle(
                                          color: Color(0xFFB1B1B1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          height: 0.10,
                                        ),
                                      ),

                                      TextSpan(
                                          text: "Terms and Conditions",
                                          style: TextStyle(
                                              color: Color(0xFF3366CC),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
                                              height: 2)),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 55,
                        ),
                        Text(
                          'or sign in via',
                          style: TextStyle(
                            color: Color(0x4F1A203D),
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0.10,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: Get.width/1.25,
                          child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: Image.asset("assets/images/google_icon.png",height: 25,),
                              style: ElevatedButton.styleFrom(backgroundColor: Color(0xff4285F4)),
                              label: Text("Sign in with Google")),
                        ),
                        SizedBox(height: 60),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Don’t have an account? ',
                                style: TextStyle(
                                  color: Color(0xFFB1B1B1),
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0.10,
                                ),
                              ),
                              TextSpan(
                                text: 'Sign up',
                                style: TextStyle(
                                  color: Color(0xFF3366CC),
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0.10,
                                ),
                              ),

                            ],
                          ),
                        )

                      ],
                    ),
                  ],
                ),

              ],
            ),
          ),
        )
    );
  }
}