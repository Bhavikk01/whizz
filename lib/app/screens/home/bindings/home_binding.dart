import 'package:get/get.dart';
import 'package:whizz/app/screens/health_care/search_healthcare/controller/search_healthcare_controller.dart';

import '../../user_profile/controller/user_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<SearchHealthcareController>(SearchHealthcareController());
    Get.put<UserProfileController>(UserProfileController());
  }
}
