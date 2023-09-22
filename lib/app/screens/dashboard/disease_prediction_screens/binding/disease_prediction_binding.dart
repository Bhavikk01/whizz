import 'package:get/get.dart';

import '../controller/disease_prediction_controller.dart';

class DiseasePredictionBinding implements Bindings {

  @override
  void dependencies() {
    Get.put(DiseasePredictionController());
  }
}