import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:whizz/app/utils/colors.dart';

class NewSignUpScreen extends StatelessWidget {
  const NewSignUpScreen({Key? key}) : super(key: key);

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
                        color: ColorsUtil.brandColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 160,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          height: Get.height / 1.8,
                          decoration: BoxDecoration(
                              color: Colors.white,
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
                              // SizedBox(
                              //   height: 25,
                              // ),
                              Center(
                                child: Text(
                                  'Sign up',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                          color: Color(0xff071C3F),
                                          fontWeight: FontWeight.w700),
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: " Full name",
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: " Email",
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: " Phone",
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: " Password",
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {}, child: Text("Sign Up")),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'By clicking this button, you are agreeing with our\n',
                                      style: TextStyle(
                                        color: Color(0xFFB1B1B1),
                                        fontSize: 10,
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
                                            height: 1.2)),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'or sign up via',
                        style: TextStyle(
                          color: Color(0x4F1A203D),
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0.10,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      SizedBox(
                        width: Get.width/1.25,
                        child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Image.asset("assets/images/google_icon.png",height: 25,),
                            style: ElevatedButton.styleFrom(backgroundColor: Color(0xff4285F4)),
                            label: Text("Sign in with Google")),
                      ),
                      SizedBox(height: 40),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                color: Color(0xFFB1B1B1),
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0.10,
                              ),
                            ),
                            TextSpan(
                              text: 'Sign in',
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
      ),
    );
  }
}
