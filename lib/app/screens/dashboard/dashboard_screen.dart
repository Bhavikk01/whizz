import 'dart:developer';

import 'package:Whizz/app/screens/home/controllers/home_controller.dart';
import 'package:Whizz/app/utils/app_theme.dart';
import 'package:Whizz/app/utils/scale_utility.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../routes/app_pages.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';

class DashboardScreen extends GetView<HomeController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      backgroundColor: ColorsUtil.brandColor,
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: ColorsUtil.brandColor,
            collapsedHeight: scale.getScaledHeight(100),
            elevation: 0,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        ConstantData.backgroundTile,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: scale.getPadding(left: 20, right: 15, top: 50),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Good Morning\n",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: scale.getScaledFont(20),
                                    fontWeight: FontWeight.w500,
                                    // height: 0.06,
                                    letterSpacing: -0.41,
                                  ),
                                ),
                                TextSpan(
                                  text: "Bhavik",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: scale.getScaledFont(30),
                                    fontWeight: FontWeight.w500,
                                    height: 1.50,
                                    letterSpacing: -0.41,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/icons/appIcon.svg",
                            // height: 100,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SliverFillRemaining(
            fillOverscroll: true,
            child: Container(
              padding:
                  scale.getPadding(left: 10, right: 10, top: 35, bottom: 15),
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70),
                  ),
                ),
              ),
              child: SingleChildScrollView(
                // primary: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Card(
                      elevation: 10,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 15, top: 15, bottom: 10),
                        width: scale.fw,
                        child: GestureDetector(
                          onHorizontalDragStart: (drag) {
                            log(drag.toString());
                            // pageController.
                          },
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircularPercentIndicator(
                                    radius: scale.getScaledWidth(60),
                                    lineWidth: scale.getScaledWidth(8),
                                    backgroundColor: Colors.black26,
                                    progressColor: ColorsUtil.blueColor,
                                    restartAnimation: true,
                                    animation: true,
                                    animateFromLastPercent: true,
                                    animationDuration: 1000,
                                    percent: 0.6,
                                    center: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Due at",
                                          style: AppTheme
                                              .appTheme.textTheme.bodySmall!
                                              .copyWith(
                                            color: Colors.black,
                                            fontSize: scale.getScaledFont(14),
                                          ),
                                        ),
                                        Text(
                                          '10 : 00 PM',
                                          style: AppTheme.appTheme.textTheme.bodySmall!.copyWith(
                                            fontSize: scale.getScaledFont(10),
                                          ),
                                        ),
                                        SizedBox(
                                          height: scale.getScaledHeight(8),
                                        ),
                                        Text(
                                          "Last Taken at",
                                          style: AppTheme.appTheme.textTheme.bodySmall!.copyWith(
                                            color: Colors.black,
                                            fontSize: scale.getScaledFont(12),
                                          ),
                                        ),
                                        Text(
                                          '10 : 00 PM',
                                          style: AppTheme.appTheme.textTheme.bodySmall!.copyWith(
                                            fontSize: scale.getScaledFont(10),
                                          ),
                                        ),
                                        Text(
                                          'Not On Time',
                                          style: AppTheme
                                              .appTheme.textTheme.bodySmall!
                                              .copyWith(
                                            fontSize: scale.getScaledFont(10),
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: scale.getScaledWidth(15),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: scale.getScaledWidth(180),
                                        child: Text(
                                          'Paracetamol',
                                          maxLines: 1,
                                          style: AppTheme
                                              .appTheme.textTheme.bodyLarge!
                                              .copyWith(
                                            color: ColorsUtil.blueColor,
                                            fontSize: scale.getScaledFont(20),
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -0.41,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: scale.getScaledHeight(3),
                                      ),
                                      Text(
                                        'Medicine Alert',
                                        style: AppTheme
                                            .appTheme.textTheme.bodyLarge!
                                            .copyWith(
                                          color: ColorsUtil.blueColor,
                                          fontSize: scale.getScaledFont(15),
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.41,
                                        ),
                                      ),
                                      SizedBox(
                                        height: scale.getScaledHeight(7),
                                      ),
                                      Row(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: ColorsUtil.blueColor,
                                              padding: scale.getPadding(
                                                horizontal: 15,
                                                vertical: 5,
                                              ),
                                            ),
                                            child: const Text("View"),
                                          ),
                                          SizedBox(
                                            width: scale.getScaledWidth(10),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: ColorsUtil.brandWhite,
                                              padding: scale.getPadding(
                                                horizontal: 13,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SvgPicture.asset(
                                                  ConstantData.addIcon,
                                                  height: scale.getScaledFont(15),
                                                ),
                                                SizedBox(
                                                  width: scale.getScaledWidth(8),
                                                ),
                                                SvgPicture.asset(
                                                  ConstantData.pillIcon,
                                                  height: scale.getScaledFont(15),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  DotsIndicator(
                                    dotsCount: 3,
                                    position: 1,
                                    decorator: DotsDecorator(
                                      size: Size(scale.getScaledHeight(7), scale.getScaledHeight(7)),
                                      activeSize: Size(scale.getScaledWidth(20), scale.getScaledHeight(7)),
                                      activeShape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: scale.getScaledHeight(10),
                    ),
                    Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      color: ColorsUtil.blueColor,
                      child: SizedBox(
                        height: scale.getScaledHeight(180),
                        width: Get.width,
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Positioned(
                                  left: scale.getScaledWidth(10),
                                  top: scale.getScaledHeight(8),
                                  child: const CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Color(0xFF335EB4),
                                  ),
                                ),
                                const Positioned(
                                  left: 5,
                                  top: 100,
                                  child: CircleAvatar(
                                    radius: 7,
                                    backgroundColor: Color(0xFF335EB4),
                                  ),
                                ),
                                Image.asset("assets/images/doctorPredict.png")
                              ],
                            ),
                            SizedBox(
                              width: scale.getScaledWidth(10),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Disease Predictor',
                                  style: AppTheme
                                      .appTheme.textTheme.displayMedium!
                                      .copyWith(
                                    fontSize: scale.getScaledFont(20),
                                  ),
                                ),
                                SizedBox(
                                  width: scale.getScaledWidth(200),
                                  child: Text(
                                    'Predicting illness with AI precision based on symptoms, for proactive healthcare',
                                    textAlign: TextAlign.start,
                                    style: AppTheme
                                        .appTheme.textTheme.displaySmall!
                                        .copyWith(
                                      fontSize: scale.getScaledFont(12),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    textStyle: TextStyle(
                                      fontSize: scale.getScaledFont(14),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    shape: const StadiumBorder(),
                                    padding: scale.getPadding(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    backgroundColor: ColorsUtil.brandWhite,
                                    foregroundColor: const Color(0xff4578EA),
                                  ),
                                  child: const Text("Check Now"),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      color: const Color(0xFF4577E9),
                      child: SizedBox(
                        height: scale.getScaledHeight(160),
                        width: Get.width,
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Positioned(
                                  left: scale.getScaledWidth(10),
                                  top: scale.getScaledHeight(8),
                                  child: const CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Color(0xFF335EB4),
                                  ),
                                ),
                                const Positioned(
                                  left: 5,
                                  top: 100,
                                  child: CircleAvatar(
                                    radius: 7,
                                    backgroundColor: Color(0xFF335EB4),
                                  ),
                                ),
                                Image.asset("assets/images/report_doctor.png")
                              ],
                            ),
                            SizedBox(
                              width: scale.getScaledWidth(10),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'View Report',
                                  style: AppTheme
                                      .appTheme.textTheme.displayMedium!
                                      .copyWith(
                                    fontSize: scale.getScaledFont(20),
                                  ),
                                ),
                                SizedBox(
                                  width: scale.getScaledWidth(200),
                                  child: Text(
                                    'Empowering you with insights for your health journey.',
                                    textAlign: TextAlign.start,
                                    style: AppTheme
                                        .appTheme.textTheme.displaySmall!
                                        .copyWith(
                                      fontSize: scale.getScaledFont(12),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.userReports);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    textStyle: TextStyle(
                                      fontSize: scale.getScaledFont(14),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    shape: const StadiumBorder(),
                                    padding: scale.getPadding(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    backgroundColor: ColorsUtil.brandWhite,
                                    foregroundColor: const Color(0xff4578EA),
                                  ),
                                  child: const Text("Check Reports"),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
