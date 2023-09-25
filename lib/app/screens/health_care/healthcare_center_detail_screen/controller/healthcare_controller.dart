import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../API/api_client.dart';
import '../../../../utils/custom_bottom_snackbar.dart';

class HealthcareController extends GetxController {

  RxBool showCollapsedHeader = false.obs;
  var healthcareId = '';
  RxList<Map<String, >>
  ScrollController scrollController = ScrollController();
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    healthcareId = Get.arguments['healthcareId'];
    scrollController.addListener(() {

    });
  }

  loadHospitalData() async {
    await ApiClient.to.getHealthcareData(
        healthcareId,
        onSuccess: (res) {
          if(res.body['status']){
            healthcareCenters.clear();
            for(var center in res.body['data']){
              healthcareCenters.add(HealthcareCenter.fromJson(center));
            }
            isLoading.value = false;
          }else{
            healthcareCenters.clear();
            customSnackBar(
              type: AnimatedSnackBarType.error,
              message: '${res.body['message']}',
            );
            isLoading.value = false;
          }
        },
        onError: (err){
          isLoading.value = false;
          customSnackBar(
            type: AnimatedSnackBarType.error,
            message: '${err.body['error']}',
          );
        }
    );
  }

}