import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:Whizz/app/global_controllers/bottom_nav_controller.dart';
import 'package:Whizz/app/models/enum/nested_navigation.dart';
import 'package:Whizz/app/screens/health_care/search_healthcare/binding/search_healthcare_binding.dart';
import 'package:Whizz/app/screens/health_care/search_healthcare/search_healthcare_screen.dart';
import 'package:Whizz/app/screens/home/controllers/home_controller.dart';
import 'package:Whizz/app/screens/user_profile/user_profile_screen.dart';
import 'package:Whizz/app/utils/colors.dart';
import 'package:Whizz/app/utils/constants.dart';

import '../../routes/app_pages.dart';
import '../user_profile/binding/user_profile_binding.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);
  var bottomNavController = Get.find<BottomNavBarController>();

  @override
  Widget build(BuildContext context) {
    NestedNavigation nestedNavigation = NestedNavigation.dashboardScreen;
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(nestedNavigation.navID!),
        initialRoute: Routes.dashboard,
        onGenerateRoute: (settings){
          switch(settings.name){
            case Routes.dashboard:
              return GetPageRoute(
                page: () => const UserProfileScreen(),
                binding: UserProfileBinding(),
                maintainState: true,
                transition: Transition.fadeIn,
              );
            case Routes.appointmentScreen:
              return GetPageRoute(
                page: () => const UserProfileScreen(),
                binding: UserProfileBinding(),
                maintainState: true,
                transition: Transition.fadeIn,
              );
            case Routes.userProfile:
              return GetPageRoute(
                page: () => const UserProfileScreen(),
                binding: UserProfileBinding(),
                maintainState: true,
                transition: Transition.fadeIn,
              );
            case Routes.searchHealthCenterScreen:
              return GetPageRoute(
                page: () => SearchHealthcareScreen(),
                binding: SearchHealthcareBinding(),
                maintainState: true,
                transition: Transition.fadeIn,
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
            if(index == 0){
              Get.toNamed(Routes.dashboard, id: nestedNavigation.navID!);
            }else if(index == 1){
              Get.toNamed(Routes.searchHealthCenterScreen, id: nestedNavigation.navID!);
            }else if(index == 2){
              Get.toNamed(Routes.appointmentScreen, id: nestedNavigation.navID!);
            }else{
              Get.toNamed(Routes.userProfile, id: nestedNavigation.navID!);
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ConstantData.homeIcon,
                color: bottomNavController.currentIndex.value == 0
                    ? ColorsUtil.brandColor
                    : Colors.black45,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  ConstantData.searchIcon,
                  color: bottomNavController.currentIndex.value == 1
                      ? ColorsUtil.brandColor
                      : Colors.black45,
                ),
                label: 'Search'
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  ConstantData.appointmentIcon,
                  color: bottomNavController.currentIndex.value == 2
                      ? ColorsUtil.brandColor
                      : Colors.black45,
                ),
                label: 'Appointment'
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ConstantData.profileIcon,
                color: bottomNavController.currentIndex.value == 3
                    ? ColorsUtil.brandColor
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
