import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:whizz/app/utils/colors.dart';
import 'package:whizz/app/widgets/bottom_nav_bar.dart';
import 'package:whizz/app/widgets/custom_drawer.dart';

import '../../routes/app_pages.dart';
import '../../services/user.dart';
import '../../utils/app_theme.dart';
import '../../utils/constants.dart';
import '../../utils/scale_utility.dart';
import '../../widgets/custom_icon_button.dart';
import 'controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: Get.context!)
      ..setCurrentDeviceSize();

    return Scaffold(
      body: SafeArea(
        child: Obx(
              () => UserStore.to.isLogin ?
          controller.haveInternet.value ?
          !controller.loadingUserData.value ?
          Column(
            children: [
              ListTile(
                title: Row(
                  children: [
                    const CustomDrawer(),
                    SizedBox(
                      width: scale.getScaledWidth(10),
                    ),
                    SizedBox(
                      width: scale.getScaledWidth(240),
                      child: Text(
                        'Bhavik Kothari',
                        style: AppTheme.appTheme.textTheme.titleLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: scale.getMargin(horizontal: 10),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: double.maxFinite,
                              height: scale.getScaledHeight(240),
                              margin: scale.getMargin(
                                vertical: 10,
                                horizontal: 23,
                              ),
                              padding: scale.getMargin(
                                vertical: 20,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorsUtil.darkContainerColor.withOpacity(0.4),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircularPercentIndicator(
                                    progressColor: ColorsUtil.darkContainerColor,
                                    radius: 90,
                                    lineWidth: 15.0,
                                    percent: 0.5,
                                    backgroundColor: ColorsUtil.brandWhite,
                                    center: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Due at',
                                          style: AppTheme.appTheme.textTheme.bodyLarge,
                                        ),
                                        SizedBox(
                                          height: scale.getScaledHeight(10),
                                        ),
                                        Text(
                                          controller.reminderList.isEmpty
                                              ? '--/--'
                                              : controller.checkDue() != ''
                                              ? controller.checkDue()
                                              : 'No due for today',
                                          style: AppTheme.appTheme.textTheme.labelLarge,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: scale.getScaledWidth(120),
                                    alignment: Alignment.center,
                                    child: Text(
                                      controller.reminderList.isEmpty
                                          ? 'Pill Name'
                                          : controller.reminderList[controller.pillIndex.value].pillName,
                                      style: AppTheme.appTheme.textTheme.bodyLarge,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: scale.getScaledHeight(110),
                          child: Visibility(
                            visible: true,
                            child: ElevatedButton(
                              onPressed: () {
                                controller.pillIndex.value--;
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsUtil.darkContainerColor,
                                padding: scale.getPadding(
                                  vertical: 2,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: scale.getScaledHeight(110),
                          right: 0,
                          child: Visibility(
                            visible: true,
                            child: ElevatedButton(
                              onPressed: () {
                                controller.pillIndex.value += 1;
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsUtil.darkContainerColor,
                                padding: scale.getPadding(
                                  vertical: 2,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: const Icon(
                                Icons.arrow_forward,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: scale.getMargin(
                        top: 10,
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: scale.getScaledHeight(80),
                            width: scale.getScaledWidth(150),
                            margin: scale.getMargin(
                              horizontal: 5,
                            ),
                            padding: scale.getPadding(
                              horizontal: 15,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorsUtil.darkContainerColor,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              ConstantData.setNewReminderText,
                              style: AppTheme.appTheme.textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            height: scale.getScaledHeight(80),
                            width: scale.getScaledWidth(150),
                            margin: scale.getMargin(
                              horizontal: 5,
                            ),
                            padding: scale.getPadding(
                              horizontal: 15,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorsUtil.darkContainerColor,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              ConstantData.viewReminderText,
                              style: AppTheme.appTheme.textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: scale.getMargin(
                        top: 15,
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.searchHealthCenterScreen);
                            },
                            child: Container(
                              height: scale.getScaledHeight(80),
                              width: scale.getScaledWidth(150),
                              margin: scale.getMargin(
                                horizontal: 5,
                              ),
                              padding: scale.getPadding(
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: ColorsUtil.darkContainerColor,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                ConstantData.searchHealthcareText,
                                style: AppTheme.appTheme.textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.userProfile);
                            },
                            child: Container(
                              height: scale.getScaledHeight(80),
                              width: scale.getScaledWidth(150),
                              margin: scale.getMargin(
                                horizontal: 5,
                              ),
                              padding: scale.getPadding(
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: ColorsUtil.darkContainerColor,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                ConstantData.userProfileText,
                                style: AppTheme.appTheme.textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ],
          )
              : Container(
            margin: scale.getMargin(vertical: 50),
            child: Center(
              child: CircularProgressIndicator(
                color: ColorsUtil.darkContainerColor,
              ),
            ),
          )
              : Container(
            margin: scale.getMargin(vertical: 100),
            alignment: Alignment.center,
            child: const Text(
              'Please Check your network connection',
            ),
          )
              : GestureDetector(
            onTap: () {
              Get.offAndToNamed(Routes.loginWithEmail);
            },
            child: Center(
              child: Container(
                margin: scale.getMargin(vertical: 100),
                padding: scale.getPadding(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: ColorsUtil.darkContainerColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  'Please click here to login again',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
