import 'dart:developer';

import 'package:Whizz/app/models/healthcare_center_model.dart';
import 'package:Whizz/app/utils/loading_overlay.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../API/api_client.dart';
import '../../../../models/doctor_model.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/custom_bottom_snackbar.dart';

class HealthcareController extends GetxController {

  RxBool showCollapsedHeader = false.obs;
  var healthcareId = '';
  RxList<DoctorModel> doctorList = <DoctorModel>[].obs;
  ScrollController scrollController = ScrollController();
  var isLoading = true.obs;
  dynamic city;
  dynamic state;
  HealthcareCenter healthcare = HealthcareCenter();

  @override
  void onInit() {
    super.onInit();
    healthcareId = Get.arguments['healthcareId'];
    log('Hello world: $healthcareId');
  }

  @override
  Future<void> onReady() async {
    await loadHospitalData();
  }

  loadHospitalData() async {
    LoadingOverlay.showOverlay();
    await ApiClient.to.getHealthcareData(
        healthcareId,
        onSuccess: (res) {
          if(res.body['status']){
            healthcare = HealthcareCenter.fromJson(res.body['data']);
            var countryIso = ConstantData.countryMap.values.toList();
            var countryIndex = countryIso.indexOf(healthcare.address!.country!);
            var country = ConstantData.countryMap.keys.toList()[countryIndex];
            log('this is the country $country');
            state = ConstantData.stateMap[country]!.firstWhere((element) => element['state_code'] == healthcare.address!.state);
            city = ConstantData.cityMap[state['name']]!.firstWhere((element) => element['id'] == int.parse(healthcare.address!.city!));
            isLoading.value = false;
          }else{
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
    await ApiClient.to.getDoctorList(
        healthcareId,
        onSuccess: (res) {
          if(res.body['status']){
            doctorList.clear();
            for(var doctor in res.body['data']){
              doctorList.add(DoctorModel.fromJson(doctor));
            }
            isLoading.value = false;
          }else{
            doctorList.clear();
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
    LoadingOverlay.hideOverlay();
  }

}