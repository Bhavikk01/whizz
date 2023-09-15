import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:whizz/app/screens/auth/controllers/sign_up_controller.dart';
import 'package:whizz/app/utils/constants.dart';

import '../../routes/app_pages.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              padding: scale.getPadding(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: scale.getScaledHeight(45),
                  ),
                  Text(
                    "Sign up to ${ConstantData.appName}",
                    style: TextStyle(
                      fontSize: scale.getScaledFont(18),
                      fontWeight: FontWeight.w700,
                      color: ColorsUtil.darkTextColor,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Wrap(
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          fontSize: scale.getScaledFont(14),
                          fontWeight: FontWeight.w500,
                          color: ColorsUtil.greyTextColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.offAndToNamed(Routes.loginWithEmail);
                        },
                        child: Text(
                          ConstantData.loginInText,
                          style: TextStyle(
                            fontSize: scale.getScaledFont(14),
                            fontWeight: FontWeight.w700,
                            color: ColorsUtil.blueColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(24),
                  ),
                  Container(
                    padding: scale.getPadding(vertical: 8),
                    child: TextFormField(
                      controller: controller.nameController,
                      style: Theme.of(context).textTheme.titleSmall,
                      decoration: const InputDecoration(
                        hintText: 'Full Name*',
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Name cannot be empty';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: scale.getPadding(vertical: 8),
                    child: TextFormField(
                      controller: controller.phoneController,
                      style: Theme.of(context).textTheme.titleSmall,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Phone Number*',
                      ),
                      validator: (value){
                        if(value!.length == 10 && int.tryParse(value) != null){
                          return null;
                        }
                        return 'Enter a valid phone number';
                      },
                    ),
                  ),
                  Container(
                    padding: scale.getPadding(vertical: 8),
                    child: TextFormField(
                      controller: controller.emailController,
                      style: Theme.of(context).textTheme.titleSmall,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Email Address*',
                      ),
                      validator: (value){
                        if(GetUtils.isEmail(value!)){
                          return null;
                        }
                        return 'Enter a valid Email';
                      },
                    ),
                  ),
                  Container(
                    padding: scale.getPadding(vertical: 8),
                    child: TextFormField(
                      obscureText: true,
                      controller: controller.passwordController,
                      style: Theme.of(context).textTheme.titleSmall,
                      decoration: const InputDecoration(
                        hintText: 'Password*',
                      ),
                      validator: (value){
                        if(value!.length < 6){
                          return 'Password length should be more then 6';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: scale.getPadding(vertical: 8),
                    child: TextFormField(
                      controller: controller.confirmPasswordController,
                      decoration: const InputDecoration(
                        hintText: 'Confirm Password*',
                      ),
                      style: Theme.of(context).textTheme.titleSmall,
                      validator: (value){
                        if(value! == controller.passwordController.text){
                          return null;
                        }
                        return 'Confirm password not match with password';
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        controller.uploadUserData(scale, context);
                      }
                    },
                    child: Text(
                      ConstantData.continueText,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: ColorsUtil.lightTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        "or sign up via",
                        style: TextStyle(
                          fontSize: scale.getScaledFont(14),
                          fontWeight: FontWeight.w500,
                          color: ColorsUtil.greyTextColor,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 1,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                      foregroundColor: MaterialStateProperty.all(ColorsUtil.darkTextColor),
                      side: MaterialStateProperty.all(
                        BorderSide(
                          color: ColorsUtil.borderColor,
                        ),
                      ),
                      elevation: MaterialStateProperty.all(0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          ConstantData.googleIcon,
                          height: scale.getScaledHeight(18),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Google",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Wrap(
                    children: [
                      Text(
                        "By signing up to Whizz you agree to our ",
                        style: TextStyle(
                          fontSize: scale.getScaledFont(14),
                          fontWeight: FontWeight.w500,
                          color: ColorsUtil.greyTextColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.bottomSheet(
                            enableDrag: true,
                            Column(
                              children: [
                                Container(
                                  margin: scale.getMargin(left: 10, right: 8, top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Terms and Conditions',
                                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                          fontSize: scale.getScaledFont(24)
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.close),
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            backgroundColor: ColorsUtil.brandWhite,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              )
                            )
                          );
                        },
                        child: Text(
                          "terms and condition.",
                          style: TextStyle(
                            fontSize: scale.getScaledFont(14),
                            fontWeight: FontWeight.w700,
                            color: ColorsUtil.blueColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
