import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tooltip/simple_tooltip.dart';
import 'package:whizz/app/utils/colors.dart';
import 'package:whizz/app/utils/constants.dart';

import '../../utils/app_theme.dart';
import '../../utils/scale_utility.dart';
import '../../widgets/custom_drawer.dart';
import 'controller/user_controller.dart';

class UserProfileScreen extends GetView<UserProfileController> {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: Get.context!)
      ..setCurrentDeviceSize();

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: scale.getMargin(left: 15, right: 15),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: const CustomDrawer(),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: scale.getScaledHeight(60),
                    ),
                    CircleAvatar(
                      radius: scale.getScaledFont(80),
                      backgroundImage: const AssetImage(
                        ConstantData.userAvatar,
                      ),
                    ),
                    SizedBox(
                      height: scale.getScaledHeight(15),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bhavik Kothari',
                            style: AppTheme.appTheme.textTheme.titleLarge,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Indore, Madhya Pradesh',
                            style: AppTheme.appTheme.textTheme.bodyLarge,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: scale.getScaledHeight(10),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'About User',
                        style: AppTheme.appTheme.textTheme.titleMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: scale.getPadding(horizontal: 10, vertical: 10),
                      margin: scale.getMargin(vertical: 5),
                      decoration: BoxDecoration(
                        color: ColorsUtil.lightContainerColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Phone : 9588876587',
                                  style: AppTheme.appTheme.textTheme.bodyMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Icon(
                                  Icons.edit,
                                  color: ColorsUtil.blueColor,
                                  size: scale.getScaledFont(15),
                                ),
                              ]
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            'Gender : Male',
                            style: AppTheme.appTheme.textTheme.bodyMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            'Email : kotharibhavik23@gmail.com',
                            style: AppTheme.appTheme.textTheme.bodyMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            'Age: 21',
                            style: AppTheme.appTheme.textTheme.bodyMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5,),
                          SizedBox(
                            child: Text(
                              'Address : Ansh Hostel, Near Rajendra Nagar Railway station',
                              style: AppTheme.appTheme.textTheme.bodyMedium,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: scale.getScaledHeight(10),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Medical History',
                        style: AppTheme.appTheme.textTheme.titleMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: scale.getPadding(horizontal: 10, vertical: 10),
                      margin: scale.getMargin(vertical: 5),
                      decoration: BoxDecoration(
                        color: ColorsUtil.lightContainerColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Blood Group : AB+',
                                  style: AppTheme.appTheme.textTheme.bodyMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Icon(
                                  Icons.edit,
                                  color: ColorsUtil.blueColor,
                                  size: scale.getScaledFont(15),
                                ),
                              ]
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            'Allergies : Dust',
                            style: AppTheme.appTheme.textTheme.bodyMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            'Diseases : Asthama, Blood Pressure, Sugar, Diabetes',
                            style: AppTheme.appTheme.textTheme.bodyMedium,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: scale.getScaledHeight(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: scale.getPadding(horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                            color: ColorsUtil.lightContainerColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                ConstantData.medicalReport,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: scale.getScaledHeight(10),
                              ),
                              Text(
                                'Medical History',
                                style: AppTheme.appTheme.textTheme.bodyLarge,
                              )
                            ],
                          ),
                        ),
                        Obx(
                          () => SimpleTooltip(
                            arrowLength: 1,
                            arrowBaseWidth: 0,
                            show: controller.showAppointmentContainer.value,
                            maxWidth: scale.getScaledWidth(250),
                            maxHeight: scale.getScaledHeight(180),
                            customShadows: [],
                            borderColor: Colors.grey[200]!,
                            arrowTipDistance: scale.getScaledHeight(10),
                            content: TapRegion(
                              onTapOutside: (event) {
                                controller.showAppointmentContainer.value = false;
                              },
                              child: Material(
                                type: MaterialType.transparency,
                                child: Container(),
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                controller.showAppointmentContainer.value = !controller.showAppointmentContainer.value;
                              },
                              child: Container(
                                padding: scale.getPadding(horizontal: 10, vertical: 8),
                                decoration: BoxDecoration(
                                  color: ColorsUtil.lightContainerColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      ConstantData.appointmentIcon,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      height: scale.getScaledHeight(10),
                                    ),
                                    Text(
                                      'Appointments',
                                      style: AppTheme.appTheme.textTheme.bodyLarge,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: scale.getScaledHeight(20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
