import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:whizz/app/screens/auth/controllers/auth_controller.dart';
import 'package:whizz/app/utils/colors.dart';
import 'package:whizz/app/utils/constants.dart';

import '../../routes/app_pages.dart';
import '../../utils/scale_utility.dart';

class LoginWithEmail extends GetView<AuthController> {
  const LoginWithEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: Get.context!)
      ..setCurrentDeviceSize();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: Get.height / 2.7,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                            ConstantData.backgroundTile,
                          ),
                          fit: BoxFit.cover,
                        )
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: scale.getScaledHeight(145),
                        ),
                        Padding(
                          padding: scale.getPadding(horizontal: 20),
                          child: Container(
                            padding: scale.getPadding(horizontal: 20),
                            height: Get.height / 2,
                            decoration: BoxDecoration(
                              color: ColorsUtil.brandWhite,
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 2),
                                  blurRadius: 3,
                                  blurStyle: BlurStyle.outer,
                                )
                              ],
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Center(
                                  child: Text(
                                    'Sign in',
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      color: ColorsUtil.darkTextColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: scale.getScaledFont(25),
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: "Email",
                                  ),
                                  controller: controller.emailController,
                                  validator: (value) {
                                    if(GetUtils.isEmail(value!)){
                                      return null;
                                    }else{
                                      return "Please enter a valid email";
                                    }
                                  },
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: "Password",
                                  ),
                                  controller: controller.passwordController,
                                  obscureText: true,
                                  validator: (value) {
                                    if(controller.passwordController.text.isNotEmpty){
                                      return null;
                                    }else{
                                      return "Please provide your password";
                                    }
                                  },
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if(formKey.currentState!.validate()){
                                      controller.signInByEmail();
                                    }
                                  },
                                  child: const Text("Sign in"),
                                ),
                                const Center(
                                  child: Text(
                                    "Forgot password?",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xFF3366CC),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'By clicking this button, you are agreeing with our\n',
                                        style: TextStyle(
                                          color: const Color(0xFFB1B1B1),
                                          fontSize: scale.getScaledFont(10),
                                          fontWeight: FontWeight.w500,
                                          height: 0.10,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Terms and Conditions",
                                        style: TextStyle(
                                          color: const Color(0xFF3366CC),
                                          fontWeight: FontWeight.w500,
                                          fontSize: scale.getScaledFont(9),
                                          height: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: scale.getScaledHeight(48),
                        ),
                        Text(
                          'or sign in via',
                          style: TextStyle(
                            color: const Color(0x4F1A203D),
                            fontSize: scale.getScaledFont(17),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0.10,
                          ),
                        ),
                        SizedBox(
                          height: scale.getScaledHeight(27),
                        ),
                        SizedBox(
                          width: Get.width / 1.25,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Image.asset(
                              ConstantData.googleIcon,
                              height: scale.getScaledHeight(22),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff4285F4),
                            ),
                            label: const Text("Sign in with Google"),
                          ),
                        ),
                        SizedBox(
                          height: scale.getScaledHeight(30),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.signUp);
                          },
                          child: Container(
                            padding: scale.getPadding(horizontal: 15, vertical: 10),
                            color: ColorsUtil.brandWhite,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Don’t have an account? ',
                                    style: TextStyle(
                                      color: const Color(0xFFB1B1B1),
                                      fontSize: scale.getScaledFont(13),
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0.10,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Sign up',
                                    style: TextStyle(
                                      color: const Color(0xFF3366CC),
                                      fontSize: scale.getScaledFont(13),
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0.10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
      ),
    );
  }
}
