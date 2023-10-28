import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:Whizz/app/API/api_client.dart';
import 'package:Whizz/app/services/user.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:get/get.dart';

import '../../../../utils/custom_bottom_snackbar.dart';

class DiseaseReportController extends GetxController {
  Rx<String> diseaseName = ''.obs;
  Rx<String> description = ''.obs;
  Rx<String> range = ''.obs;
  RxList<dynamic> precaution = [].obs;
  RxList<dynamic> symptoms = [].obs;
  RxBool loading = true.obs;

  @override
  void onInit() {
    symptoms.value = UserStore.to.symptoms;
    super.onInit();
    ApiClient.to.predictDisease(
      onSuccess: (res) {
        diseaseName.value = res.body["disease"];
        description.value = res.body["description"];
        precaution.value = res.body["precaution"];
        symptoms.value = res.body["symptoms"];
        range.value = res.body['severity'].toString();
      },
      onError: (err) {
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: '${err.body['error']}',
        );
      },
      symptoms: symptoms,
    );
  }

  Future<void> uploadReport(File file) async {
    await ApiClient.to.uploadUserReport(
      file: file,
      type: 'Symptoms Diagnosis',
      location: 'Whizz smart Report',
      onSuccess: (data) async {
        if(data['status']){
          Get.back();
          customSnackBar(
            type: AnimatedSnackBarType.success,
            message: '${data['message']}',
          );
        }else{
          customSnackBar(
            type: AnimatedSnackBarType.warning,
            message: '${data['message']}',
          );
        }
      },
      onError: (err) {
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: '${err.body['error']}',
        );
      },
    );
  }
}
