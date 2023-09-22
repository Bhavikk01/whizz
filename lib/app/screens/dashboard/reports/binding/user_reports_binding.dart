import 'package:get/get.dart';

import '../controller/user_reports_controller.dart';

class UserReportsBinding implements Bindings {

  @override
  void dependencies() {
    Get.put(UserReportsController());
  }
}