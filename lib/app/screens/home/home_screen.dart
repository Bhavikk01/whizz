import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whizz/app/global_controllers/bottom_nav_controller.dart';
import 'package:whizz/app/models/enum/nested_navigation.dart';
import 'package:whizz/app/screens/health_care/search_healthcare/binding/search_healthcare_binding.dart';
import 'package:whizz/app/screens/health_care/search_healthcare/search_healthcare_screen.dart';
import 'package:whizz/app/screens/home/controllers/home_controller.dart';
import 'package:whizz/app/screens/user_profile/user_profile_screen.dart';
import 'package:whizz/app/utils/colors.dart';
import 'package:whizz/app/utils/constants.dart';

import '../../routes/app_pages.dart';
import '../user_profile/binding/user_profile_binding.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);
  var bottomNavController = Get.find<BottomNavBarController>();

  @override
  Widget build(BuildContext context) {
    NestedNavigation nestedNavigation = NestedNavigation.homeScreen;
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(nestedNavigation.navID!),
        initialRoute: Routes.searchHealthCenterScreen,
        onGenerateRoute: (settings){
          switch(settings.name){
            case Routes.userProfile:
              return GetPageRoute(
                page: () => const UserProfileScreen(),
                binding: UserProfileBinding(),
                maintainState: true,
                transition: Transition.fade,
              );
            case Routes.searchHealthCenterScreen:
              return GetPageRoute(
                page: () => const SearchHealthcareScreen(),
                binding: SearchHealthcareBinding(),
                maintainState: true,
                transition: Transition.fade,
              );
            default:
              return null;
          }
        },
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: bottomNavController.currentIndex.value,
          onTap: (index){
            bottomNavController.currentIndex.value = index;
            if(index == 1){
              Get.toNamed(Routes.searchHealthCenterScreen, id: nestedNavigation.navID!);
            }else if(index == 2){
              Get.toNamed(Routes.searchHealthCenterScreen, id: nestedNavigation.navID!);
            }else if(index == 3){
              Get.toNamed(Routes.userProfile, id: nestedNavigation.navID!);
            }else{
              Get.toNamed(Routes.userProfile, id: nestedNavigation.navID!);
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ConstantData.homeIcon,
                color: bottomNavController.currentIndex.value == 0
                    ? ColorsUtil.darkContainerColor
                    : Colors.black45,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  ConstantData.searchIcon,
                  color: bottomNavController.currentIndex.value == 1
                      ? ColorsUtil.darkContainerColor
                      : Colors.black45,
                ),
                label: 'Search'
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  ConstantData.appointmentIcon,
                  color: bottomNavController.currentIndex.value == 2
                      ? ColorsUtil.darkContainerColor
                      : Colors.black45,
                ),
                label: 'Appointment'
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ConstantData.profileIcon,
                color: bottomNavController.currentIndex.value == 3
                    ? ColorsUtil.darkContainerColor
                    : Colors.black45,
              ),
              label: 'Profile'
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
