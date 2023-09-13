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
    ScalingUtility scale = ScalingUtility(context: Get.context!)..setCurrentDeviceSize();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: scale.getPadding(horizontal: 20),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image.asset(
                    ConstantData.appLogo,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'Welcome to Whizz!👋',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: scale.getScaledHeight(10)),
                  SizedBox(height: scale.getScaledHeight(30)),
                  Text(
                    'Sign In',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: scale.getScaledHeight(20)),
                  TextFormField(
                    controller: controller.emailController,
                    style: Theme.of(context).textTheme.titleSmall,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_2_outlined),
                      hintText: 'Email or phone number',
                    ),
                    validator: (value){
                      if(GetUtils.isEmail(value!)){
                        return null;
                      }
                      return 'Enter a valid Email';
                    },
                  ),
                  SizedBox(height: scale.getScaledHeight(20)),
                  TextFormField(
                    obscureText: true,
                    controller: controller.passwordController,
                    style: Theme.of(context).textTheme.titleSmall,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      hintText: 'Password',
                    ),
                    validator: (value){
                      if(value!.length < 6){
                        return 'Password length should be more then 6';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: scale.getScaledHeight(20)),
                  ElevatedButton(
                    child: Text(
                      'Login',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: ColorsUtil.lightTextColor,
                      ),
                    ),
                    onPressed: () async {
                      if(formKey.currentState!.validate()){
                        await controller.signInByEmail();
                      }
                    },
                  ),
                  SizedBox(height: scale.getScaledHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have account?',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(width: scale.getScaledHeight(10)),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.signUp);
                        },
                        child: Text(
                          'Sign Up Now',
                          style: TextStyle(
                            color: ColorsUtil.darkTextColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
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
