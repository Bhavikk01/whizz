import 'package:Whizz/app/screens/health_care/doctor_panel/controller/doctor_panel_controller.dart';
import 'package:get/get.dart';

class DoctorPanelBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DoctorScreenController());
  }

}