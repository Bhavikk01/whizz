import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../utils/scale_utility.dart';
import '../home/controllers/home_controller.dart';

class ForgotPasswordScreen extends GetView<HomeController> {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: Get.context!);
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: scale.getScaledFont(20)),
        ),
      ),
    );
  }
}
