import 'dart:developer';

import 'package:Whizz/app/screens/home/controllers/home_controller.dart';
import 'package:Whizz/app/utils/colors.dart';
import 'package:Whizz/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/scale_utility.dart';

class NewHomeScreen extends GetView<HomeController> {
  NewHomeScreen({Key? key}) : super(key: key);
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsUtil.brandColor,
        body: CustomScrollView(
          // physics: NeverScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              // floating: true,
              backgroundColor: ColorsUtil.brandColor,
              expandedHeight: Get.height / 5,
              collapsedHeight: scale.getScaledHeight(120),
              elevation: 0,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(ConstantData.backgroundTile),
                            fit: BoxFit.cover)),
                    padding: EdgeInsets.symmetric(
                        vertical: scale.getScaledHeight(40),
                        horizontal: scale.getScaledWidth(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text.rich(TextSpan(children: [
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
                        ])),
                        SvgPicture.asset(
                          "assets/icons/appIcon.svg",
                          height: 100,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            SliverFillRemaining(
              // hasScrollBody: false,
              fillOverscroll: false,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(70)))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        height: scale.fh / 6,
                        width: scale.fw,
                        child: GestureDetector(
                          onHorizontalDragStart: (drag){
                            log(drag.toString());
                            // pageController.
                          },
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 60,
                                    backgroundColor: Colors.amber,
                                  ),
                                  SizedBox(
                                    width: scale.getScaledWidth(15),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Medicine Alert',
                                        style: TextStyle(
                                          color: Color(0xFF4285F4),
                                          fontSize: scale.getScaledFont(20),
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
                                            child: Text("View"),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Color(0xFF4285F4),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15, vertical: 5)),
                                          ),
                                          SizedBox(
                                            width: scale.getScaledWidth(10),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {},
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SvgPicture.asset(
                                                    "assets/icons/plusIcon.svg"),
                                                SizedBox(
                                                  width: scale.getScaledWidth(5),
                                                ),
                                                SvgPicture.asset(
                                                    "assets/icons/pillIcon.svg"),
                                              ],
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    ColorsUtil.brandWhite,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10)),
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
                                  SmoothPageIndicator(

                                      controller: pageController, count: 3)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      color: Color(0xFF4577E9),
                      child: Container(
                        height: scale.fh / 4,
                        width: Get.width,
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Positioned(
                                    left: scale.getScaledWidth(10),
                                    top: scale.getScaledHeight(8),
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: Color(0xFF335EB4),
                                    )),
                                Positioned(
                                    left: 5,
                                    top: 100,
                                    child: CircleAvatar(
                                      radius: 7,
                                      backgroundColor: Color(0xFF335EB4),
                                    )),
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
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    // letterSpacing: -0.41,
                                  ),
                                ),
                                // SizedBox(height: scale.getScaledHeight(20),),
                                Text(
                                  'Predicting illness with AI precision \nbased on symptoms, for \nproactive healthcare',
                                  style: TextStyle(
                                    color: Colors.white
                                        .withOpacity(0.6499999761581421),
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.41,
                                  ),
                                ),

                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Check Now"),
                                  style: ElevatedButton.styleFrom(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                      shape: StadiumBorder(),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      backgroundColor: ColorsUtil.brandWhite,
                                      foregroundColor: Color(0xff4578EA)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      color: Color(0xFF4577E9),
                      child: Container(
                        height: scale.fh / 4,
                        width: Get.width,
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Positioned(
                                    left: scale.getScaledWidth(10),
                                    top: scale.getScaledHeight(8),
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: Color(0xFF335EB4),
                                    )),
                                Positioned(
                                    left: 5,
                                    top: 100,
                                    child: CircleAvatar(
                                      radius: 7,
                                      backgroundColor: Color(0xFF335EB4),
                                    )),
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
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    // letterSpacing: -0.41,
                                  ),
                                ),
                                // SizedBox(height: scale.getScaledHeight(20),),
                                Text(
                                  'Empowering you with insights for\n your health journey.',
                                  style: TextStyle(
                                    color: Colors.white
                                        .withOpacity(0.6499999761581421),
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.41,
                                  ),
                                ),

                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Check Reports"),
                                  style: ElevatedButton.styleFrom(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                      shape: StadiumBorder(),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      backgroundColor: ColorsUtil.brandWhite,
                                      foregroundColor: Color(0xff4578EA)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
