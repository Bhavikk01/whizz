import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:Whizz/app/services/auth_services.dart';
import 'package:Whizz/app/utils/app_theme.dart';
import 'package:Whizz/app/utils/colors.dart';
import 'package:Whizz/app/utils/scale_utility.dart';

import '../../../models/user_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/custom_bottom_snackbar.dart';

class SignUpController extends GetxController {
  late RxString dob;
  TextEditingController otpController = TextEditingController();
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

  uploadUserData(ScalingUtility scale, context) async {
    try{
      if(await AuthServices.to.registerPhoneNumber(phoneController.text)){
        Future.delayed(const Duration(milliseconds: 1000), () {
          Get.bottomSheet(
            Container(
              margin: scale.getMargin(horizontal: 15, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                  Text(
                    ConstantData.verifyOtpText,
                    style: AppTheme.appTheme.textTheme.titleLarge,
                  ),
                  Text(
                    'OTP sent on +91XXXXXX${phoneController.text.substring(6,10)}',
                    style: AppTheme.appTheme.textTheme.bodyMedium!.copyWith(
                      color: Colors.black45,
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(15),
                  ),
                  PinCodeTextField(
                    autoDisposeControllers: false,
                    autoFocus: false,
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.none,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    backgroundColor: Colors.white,
                    enableActiveFill: true,
                    pinTheme: PinTheme(
                      fieldOuterPadding: scale.getPadding(horizontal: 2),
                      inactiveColor: ColorsUtil.brandColor,
                      selectedColor: ColorsUtil.brandColor,
                      selectedFillColor: ColorsUtil.brandWhite,
                      activeColor: ColorsUtil.brandWhite,
                      activeFillColor: ColorsUtil.brandWhite,
                      inactiveFillColor: ColorsUtil.brandWhite,
                      errorBorderColor: null,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: scale.getScaledHeight(50),
                      fieldWidth: scale.getScaledWidth(40),
                    ),
                    animationDuration: const Duration(milliseconds: 200),
                    beforeTextPaste: (text) {
                      return true;
                    },
                    controller: otpController,
                    appContext: context,
                    onChanged: (String value) {

                    },
                  ),
                  Text(
                    'Retry in 0:56',
                    style: AppTheme.appTheme.textTheme.bodyMedium!.copyWith(
                      color: Colors.black45,
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(20),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await AuthServices.to.verifyRegistrationOtp(
                        phoneController.text,
                        otpController.text,
                        UserModel(
                          userAddress: UserAddress(
                            country: userCountry.value,
                            state: userState.value,
                            city: userCity.value,
                            longitude: 0,
                            latitude: 0,
                          ),
                          dOB: dobController.text,
                          age: 0,
                          email: emailController.text,
                          password: passwordController.text,
                          fullName: nameController.text,
                          mobile: phoneController.text,
                        ),
                      );
                      otpController.text = '';
                    },
                    child: Text(
                      ConstantData.continueText,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: ColorsUtil.lightTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(15),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                )
            ),
            isDismissible: false,
          );
        });
      }
    }catch(err){
      customSnackBar(
        type: AnimatedSnackBarType.error,
        message: '$err',
      );
    }
  }
}
