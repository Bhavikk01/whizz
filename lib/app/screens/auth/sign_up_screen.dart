import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:Whizz/app/screens/auth/controllers/sign_up_controller.dart';
import 'package:Whizz/app/utils/constants.dart';

import '../../utils/colors.dart';
import '../../utils/scale_utility.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: Get.context!)
      ..setCurrentDeviceSize();
    final formKey = GlobalKey<FormState>();

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
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          ConstantData.backgroundTile,
                        ),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: scale.getScaledHeight(145),
                        ),
                        Padding(
                          padding: scale.getPadding(horizontal: 20),
                          child: Container(
                            padding: scale.getPadding(left: 20, right: 20),
                            height: Get.height / 1.8,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 2),
                                  blurRadius: 3,
                                  blurStyle: BlurStyle.outer,
                                )
                              ],
                              borderRadius: BorderRadius.all(Radius.circular(25)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Center(
                                  child: Text(
                                    'Sign up',
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      color: ColorsUtil.brandColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: " Full name",
                                  ),
                                  controller: controller.nameController,
                                  validator: (value) {
                                    if(value!.isNotEmpty){
                                      return null;
                                    }else{
                                      return "Please fill this field";
                                    }
                                  },
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: " Email",
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
                                    hintText: " Phone",
                                  ),
                                  controller: controller.phoneController,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if(value!.length == 10 && int.tryParse(value) != null){
                                      return null;
                                    }else{
                                      return "Please enter a valid phone number";
                                    }
                                  },
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: " Password",
                                  ),
                                  obscureText: true,
                                  controller: controller.passwordController,
                                  validator: (value) {
                                    if(value!.length > 8){
                                      return null;
                                    }else{
                                      return "Please create a strong password";
                                    }
                                  },
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    if(formKey.currentState!.validate()){
                                      await controller.uploadUserData(scale, context);
                                    }
                                  },
                                  child: const Text("Sign Up"),
                                ),
                                Text.rich(
                                  TextSpan(
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
                                          fontSize: scale.getScaledFont(10),
                                          height: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: scale.getScaledHeight(25),
                        ),
                        Text(
                          'or sign up via',
                          style: TextStyle(
                            color: const Color(0x4F1A203D),
                            fontSize: scale.getScaledFont(13),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0.10,
                          ),
                        ),
                        SizedBox(
                          height: scale.getScaledHeight(18),
                        ),
                        SizedBox(
                          width: Get.width / 1.25,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Image.asset(
                             ConstantData.googleIcon,
                              height: scale.getScaledFont(23),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff4285F4),
                            ),
                            label: const Text("Sign up with Google"),
                          ),
                        ),
                        SizedBox(
                          height: scale.getScaledHeight(20),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            padding: scale.getPadding(horizontal: 15, vertical: 10),
                            color: ColorsUtil.brandWhite,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Already have an account? ',
                                    style: TextStyle(
                                      color: const Color(0xFFB1B1B1),
                                      fontSize: scale.getScaledFont(13),
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0.10,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Sign in',
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
