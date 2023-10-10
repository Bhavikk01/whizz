import 'package:Whizz/app/screens/auth/controllers/user_profile_controller.dart';
import 'package:get/get.dart';

class UserProfileBinding implements Bindings {

  @override
  void dependencies() {
    Get.put(UserProfileController());
  }

}