import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whizz/app/screens/health_care/search_healthcare/search_healthcare_screen.dart';
import 'package:whizz/app/screens/home/home_view.dart';

import '../screens/user_profile/user_profile_screen.dart';

class BottomNavBarController extends GetxController {
  Rx<int> currentIndex = 3.obs;

  List<Widget> screens = [
    const HomeView(),
    const HomeView(),
    const SearchHealthcareScreen(),
    const UserProfileScreen(),
  ];

}