import 'package:get/get.dart';

import '../controller/healthcare_controller.dart';

class HealthcareBinding implements Bindings{

  @override
  void dependencies() {
    Get.put(HealthcareController());
  }

}