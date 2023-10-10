import 'package:get/get.dart';

import '../controllers/user_profile_controller.dart';

class UserProfileBinding implements Bindings {

  @override
  void dependencies() {
    Get.put(UserProfileEditController());
  }

}