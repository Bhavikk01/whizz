import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../home/controllers/home_controller.dart';

class LoginWithPhone extends GetView<HomeController> {
  const LoginWithPhone({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
