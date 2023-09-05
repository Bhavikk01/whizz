import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whizz/app/screens/auth/controllers/auth_controller.dart';
import 'package:whizz/app/utils/colors.dart';

import '../../routes/app_pages.dart';

class LoginWithEmail extends GetView<AuthController> {
  const LoginWithEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Text('Welcome to Whizz!👋',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 10.0),
              SizedBox(height: 30),
              Text(
                'Sign In',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_2_outlined),
                  hintText: 'Email or phone number',
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                controller: controller.passwordController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.password),
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                child: const Text('Login'),
                onPressed: () async {
                  await controller.signInByEmail();
                },
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have account?',
                    style: Theme.of(context).textTheme.bodySmall
                  ),
                  const SizedBox(width: 10.0),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.signUp);
                    },
                    child: Text(
                      'Sign Up Now',
                      style: TextStyle(color: ColorsUtil.darkTextColor,fontWeight: FontWeight.w700)
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
