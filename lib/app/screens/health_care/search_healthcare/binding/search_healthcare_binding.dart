import 'package:get/get.dart';

import '../controller/search_healthcare_controller.dart';

class SearchHealthcareBinding extends Bindings {

  @override
  void dependencies() {
    Get.put<SearchHealthcareController>(SearchHealthcareController());
  }
}
