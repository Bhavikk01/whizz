import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../global_controllers/bottom_nav_controller.dart';
import '../utils/colors.dart';

class BottomNavBarScreen extends GetView<BottomNavBarController> {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => SafeArea(
          child: controller.screens[controller.currentIndex.value],
        ),
      ),
      bottomNavigationBar: Obx(
        () => SalomonBottomBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            controller.currentIndex.value = index;
            // controller.getCurrentScreen();
          },
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
              selectedColor: ColorsUtil.darkContainerColor,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.timer),
              title: const Text("Reminders"),
              selectedColor: ColorsUtil.darkContainerColor,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.search),
              title: const Text("Search Healthcare"),
              selectedColor: ColorsUtil.darkContainerColor,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Profile"),
              selectedColor: ColorsUtil.darkContainerColor,
            ),
          ],
          margin: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
        ),
      ),
    );
  }
}
