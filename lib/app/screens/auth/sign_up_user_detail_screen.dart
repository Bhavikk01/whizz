import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:Whizz/app/screens/auth/controllers/sign_up_controller.dart';

import '../../routes/app_pages.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/scale_utility.dart';
import '../../widgets/address_picker.dart';

class SignUpUserDetails extends GetView<SignUpController> {
  const SignUpUserDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: Get.context!)
      ..setCurrentDeviceSize();
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: scale.getPadding(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: scale.getScaledHeight(45),
                ),
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                      enableDrag: true,
                      Container(
                        margin: scale.getMargin(left: 10, right: 8, top: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Select Source',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                IconButton(
                                  icon: const Icon(Icons.close),
                                  onPressed: () {
                                    Get.back();
                                  },
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                                controller.pickUserImage(ImageSource.gallery);
                              },
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.image),
                                    onPressed: () {},
                                  ),
                                  SizedBox(
                                    width: scale.getScaledWidth(15),
                                  ),
                                  Text(
                                    'Gallery',
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: scale.getScaledHeight(15),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                                controller.pickUserImage(ImageSource.camera);
                              },
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.camera),
                                    onPressed: () {},
                                  ),
                                  SizedBox(
                                    width: scale.getScaledWidth(15),
                                  ),
                                  Text(
                                    'Camera',
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      backgroundColor: ColorsUtil.brandWhite,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                    );
                  },
                  child: Obx(
                    () => CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.transparent,
                      backgroundImage: controller.userProfile.value != ''
                          ? controller.userProfile.value.startsWith('http')
                              ? NetworkImage(controller.userProfile.value) as ImageProvider
                              : FileImage(File(controller.userProfile.value))
                          : null,
                      child: controller.userProfile.value == ''
                          ? Stack(
                              children: [
                                Positioned(
                                  bottom: scale.getScaledHeight(10),
                                  right: scale.getScaledWidth(50),
                                  child: const Icon(Icons.add_circle),
                                ),
                                Lottie.asset(
                                  "assets/profile.json",
                                  fit: BoxFit.fill,
                                ),
                              ],
                            )
                          : null,
                    ),
                  ),
                ),
                SizedBox(
                  height: scale.getScaledHeight(10),
                ),
                Text(
                  "Hello ${controller.nameController.text}!",
                  style: TextStyle(
                    fontSize: scale.getScaledFont(18),
                    fontWeight: FontWeight.w700,
                    color: ColorsUtil.darkTextColor,
                  ),
                ),
                Text(
                  "Please provide some details",
                  style: TextStyle(
                    fontSize: scale.getScaledFont(18),
                    fontWeight: FontWeight.w700,
                    color: ColorsUtil.darkTextColor,
                  ),
                ),
                SizedBox(
                  height: scale.getScaledHeight(20),
                ),
                Container(
                  padding: scale.getPadding(vertical: 8),
                  child: TextFormField(
                    controller: controller.dobController,
                    style: Theme.of(context).textTheme.titleSmall,
                    readOnly: true,
                    onTap: controller.dobOnTap,
                    decoration: const InputDecoration(
                      hintText: 'DOB*',
                    ),
                    validator: (value) {
                      if (value != '') {
                        return null;
                      }
                      return 'Please select your DOB';
                    },
                  ),
                ),
                Container(
                  padding: scale.getPadding(vertical: 6),
                  child: TextFormField(
                    controller: controller.ageController,
                    style: Theme.of(context).textTheme.titleSmall,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Age*',
                    ),
                    validator: (value) {
                      if (int.tryParse(value!) != null) {
                        return null;
                      }
                      return 'Please enter a valid age count';
                    },
                  ),
                ),
                Container(
                  padding: scale.getPadding(top: 8, bottom: 4),
                  child: CustomDropdown(
                    hintText: 'Gender*',
                    fillColor: ColorsUtil.lightContainerColor,
                    hintStyle: Theme.of(context).textTheme.labelLarge,
                    listItemStyle: Theme.of(context).textTheme.labelLarge,
                    selectedStyle: Theme.of(context).textTheme.titleSmall,
                    excludeSelected: true,
                    items: const ['Male', 'Female', 'Others'],
                    controller: controller.userGenderController,
                  ),
                ),
                SizedBox(
                  height: scale.getScaledHeight(10),
                ),
                Container(
                  padding: scale.getPadding(bottom: 8, top: 15),
                  decoration: BoxDecoration(
                    color: ColorsUtil.lightContainerColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: scale.getPadding(left: 8, bottom: 6),
                        child: Text(
                          'Pick your Address*',
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      Obx(
                        () => AddressPicker(
                          controller: controller,
                          userCountry: controller.userCountry.value,
                          userState: controller.userState.value,
                          userCity: controller.userCity.value,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: scale.getScaledHeight(20),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: scale.getPadding(left: 24, right: 24, bottom: 15, top: 10),
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(Routes.healthCenterScreen);
          },
          child: Text(
            ConstantData.continueText,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: ColorsUtil.lightTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
