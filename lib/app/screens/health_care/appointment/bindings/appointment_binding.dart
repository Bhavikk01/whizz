import 'package:get/get.dart';

import '../controller/appointment_controller.dart';

class AppointmentBinding implements Bindings {

  @override
  void dependencies() {
    Get.put(AppointmentController());
  }

}