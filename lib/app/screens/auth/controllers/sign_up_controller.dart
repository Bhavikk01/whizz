import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../utils/constants.dart';

class SignUpController extends GetxController {
  late RxString dob;
  TextEditingController dobController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController userCountryController = TextEditingController();
  TextEditingController userStateController = TextEditingController();
  TextEditingController userCityController = TextEditingController();
  TextEditingController userGenderController = TextEditingController();

  Rx<String> userCountry = ''.obs;
  Rx<String> userProfile = ''.obs;
  Rx<String> userState = ''.obs;
  Rx<String> userCity = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    dob = "".obs;
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

  pickUserImage(source) async {
    var file = await ImagePicker().pickImage(source: source);
    if(file != null){
      userProfile.value = file.path;
    }
  }
}
