import 'dart:developer';

import 'package:Whizz/app/API/api_client.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:get/get.dart';

import '../../../../utils/custom_bottom_snackbar.dart';

class DiseaseReportController extends GetxController {
  late String diseaseName;
  late String description;
  late String range;
  RxList<dynamic> precaution = [].obs;
  RxList<dynamic> symptoms = [].obs;
  RxBool loading = true.obs;

  @override
  void onInit() {
    description = "";
    diseaseName = "";
    range = "5";

    super.onInit();
    ApiClient.to.predictDisease(
        onSuccess: (res) {
          diseaseName = res.body["disease"];
          description = res.body["description"];
          precaution.value = res.body["precaution"];
          symptoms.value = res.body["symptoms"];
        },
        onError: (err) {
          customSnackBar(
            type: AnimatedSnackBarType.error,
            message: '${err.body['error']}',
          );
        },
        symptoms: symptoms);
  }
}
