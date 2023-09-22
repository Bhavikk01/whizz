import 'dart:developer';

import 'package:Whizz/app/utils/loading_overlay.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:Whizz/app/API/api_client.dart';
import 'package:Whizz/app/models/enum/searchByAddress.dart';
import 'package:Whizz/app/models/user_model.dart';
import 'package:Whizz/app/services/user.dart';

import '../../../../utils/custom_bottom_snackbar.dart';
class SearchHealthcareController extends GetxController {

  late DraggableScrollableController draggableScrollableController;
  var isLoading = false.obs;
  late GoogleMapController mapController;
  Rx<SearchByAddress> searchBy = SearchByAddress.state.obs;
  SuperTooltipController toolTipController = SuperTooltipController();
  TextEditingController userCountryController = TextEditingController();
  TextEditingController userStateController = TextEditingController();
  TextEditingController userCityController = TextEditingController();
  late Rx<UserAddress> userAddress;
  Rx<String> userCountry = ''.obs;
  Rx<String> userState = ''.obs;
  Rx<String> userCity = ''.obs;

  Rx<CameraPosition> cameraPosition = const CameraPosition(
    target: LatLng(0, 0),
    zoom: 19,
  ).obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await Geolocator.requestPermission();
    await getLocation();
    if(UserStore.to.profile.userAddress != null){
      userAddress = UserStore.to.profile.userAddress!.obs;
    }else{
      userAddress = UserAddress(
        city: '',
        state: '',
        country: '',
        latitude: 0,
        longitude: 0,
      ).obs;
    }
    log('This is the userAddress : $userAddress ');
    userCountryController = TextEditingController(text: '${userAddress.value.country}');
    userStateController = TextEditingController(text: '${userAddress.value.state}');
    userCityController = TextEditingController(text: '${userAddress.value.city}');
    userCountry = '${userAddress.value.country}'.obs;
    userState = '${userAddress.value.state}'.obs;
    userCity = '${userAddress.value.city}'.obs;
    await getNearByHealthcare();
  }

  Future<void> getLocation() async {
    log('Getting current location');
    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    log('Getting current location');
    cameraPosition.value = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 19,
    );
    animateToLocation(cameraPosition.value);
  }

  animateToLocation(cameraPosition) {
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  getNearByHealthcare() async {
    isLoading.value = true;
    await ApiClient.to.getNearByHealthcare(
      searchBy.value,
      userAddress: userAddress.value,
      onSuccess: (res) {

        isLoading.value = false;
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

  applyFilter() async {
    isLoading.value = true;
    userAddress = UserAddress(
      country: userCountry.value,
      state: userState.value,
      city: userCity.value,
    ).obs;
    await getNearByHealthcare();
  }

}
