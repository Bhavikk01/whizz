import 'package:get/get.dart';
import 'package:whizz/app/screens/healthcare_center_detail_screen/controller/healthcare_controller.dart';

class HealthcareBinding implements Bindings{

  @override
  void dependencies() {
    Get.put(HealthcareController());
  }

}