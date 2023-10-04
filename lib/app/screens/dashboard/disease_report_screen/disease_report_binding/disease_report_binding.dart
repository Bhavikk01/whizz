import 'package:Whizz/app/screens/dashboard/disease_report_screen/controller/disease_report_controller.dart';
import 'package:get/get.dart';


class DiseaseReportBinding implements Bindings {

  @override
  void dependencies() {
    Get.put(DiseaseReportController());
  }
}