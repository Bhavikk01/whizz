import 'package:get/get.dart';
import 'package:Whizz/app/screens/user_profile/controller/user_controller.dart';

class UserProfileBinding implements Bindings {

  @override
  void dependencies() {
    Get.put(UserProfileController());
  }

}