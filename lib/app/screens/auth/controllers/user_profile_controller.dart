import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../models/user_model.dart';
import '../../../routes/app_pages.dart';
import '../../../services/auth_services.dart';
import '../../../services/user.dart';

class UserProfileEditController extends GetxController {
  late RxString dob;

  TextEditingController dobController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController userCountryController = TextEditingController();
  TextEditingController userStreetController = TextEditingController();
  TextEditingController userStateController = TextEditingController();
  TextEditingController userCityController = TextEditingController();
  TextEditingController userGenderController = TextEditingController();

  Rx<String> userCountry = ''.obs;
  Rx<String> userProfile = ''.obs;
  Rx<String> userState = ''.obs;
  Rx<String> userCity = ''.obs;

  @override
  void onInit() {
    super.onInit();
    dob = "".obs;
  }

  pickUserImage(source) async {
    var file = await ImagePicker().pickImage(source: source);
    if(file != null){
      userProfile.value = file.path;
    }
  }

  void dobOnTap() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      dob.value = DateFormat('dd-MM-yyyy').format(pickedDate);
      dobController.text = dob.value;
    }
  }

  updateUserData() async {
    await AuthServices.to.updateUserData(
      UserStore.to.profile.copyWith(
        userAddress: UserAddress(
          country: userCountry.value,
          state: userState.value,
          city: userCity.value,
          longitude: 0,
          latitude: 0,
          street: userStreetController.text,
        ),
        dOB: dobController.text,
        age: int.parse(ageController.text),
        userProfile: userProfile.value,
      ),
    );
    Get.offAndToNamed(Routes.home);
  }

}