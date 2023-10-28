import 'dart:io';

import 'package:Whizz/app/screens/dashboard/disease_report_screen/controller/disease_report_controller.dart';
import 'package:Whizz/app/services/pdf_service/pdf_class.dart';
import 'package:Whizz/app/services/pdf_service/whizz_report.dart';
import 'package:Whizz/app/services/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/scale_utility.dart';

class DiseaseReportScreen extends GetView<DiseaseReportController> {
  const DiseaseReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () async {
              File file = await WhizzReport(
                diseaseDescription: controller.description.value,
                precautions: controller.precaution,
                symptoms: controller.symptoms,
                user: UserStore.to.profile,
                severity: controller.range.value
              ).generate();
              PdfApi.openFile(file);
            },
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  height: scale.getScaledHeight(40),
                  padding:
                      scale.getPadding(left: 35, right: 45, top: 7, bottom: 7),
                  decoration: ShapeDecoration(
                    shape: const StadiumBorder(),
                    color: ColorsUtil.brandColor,
                  ),
                  child: Center(
                    child: Text(
                      "Preview Report",
                      style: TextStyle(color: ColorsUtil.brandWhite),
                    ),
                  ),
                ),
                Positioned(
                    child: CircleAvatar(
                      maxRadius: scale.getScaledWidth(20),
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.remove_red_eye_rounded,
                        color: Colors.black,
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () async {
              File file = await WhizzReport(
                  diseaseDescription: controller.description.value,
                  precautions: controller.precaution,
                  symptoms: controller.symptoms,
                  user: UserStore.to.profile,
                  severity: controller.range.value
              ).generate();
              //TODO: Have to call upload API for file uploading
              controller.uploadReport(file);
            },
            child: CircleAvatar(
              backgroundColor: const Color(0xFF2B447C),
              maxRadius: scale.getScaledWidth(22),
              child: SvgPicture.asset(
                ConstantData.uploadIcon,
                color: Colors.white,
                height: scale.getScaledHeight(15),
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: ColorsUtil.brandColor,
            // pinned: true,
            collapsedHeight: scale.getScaledHeight(100),
            expandedHeight: scale.getScaledHeight(110),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          ConstantData.backgroundTile,
                        ),
                        fit: BoxFit.cover)),
              ),
              title: Text("Disease Report"),
              centerTitle: true,
              titlePadding: EdgeInsets.only(bottom: scale.getScaledHeight(43)),
            ),
          ),
          SliverToBoxAdapter(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: scale.getMargin(left: 20, top: 50),
                height: scale.getScaledHeight(162),
                width: scale.getScaledWidth(130),
                decoration: BoxDecoration(
                    color: Color(0xFFFC3E32),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Obx(
                        () => Text(
                          controller.range.value.toString(),
                          style: TextStyle(
                              color: const Color(0xFFFC3E32),
                              fontWeight: FontWeight.bold,
                              fontSize: scale.getScaledFont(15)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: scale.getScaledHeight(5),
                    ),
                    Obx(
                      () => Text(
                        controller.diseaseName.value,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: scale.getScaledFont(20),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: scale.getPadding(left: 8, right: 8),
                margin: scale.getMargin(top: 50, right: 20),
                height: scale.getScaledHeight(162),
                width: scale.getScaledWidth(180),
                decoration: BoxDecoration(
                    color: Color(0xFF2B447C),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Center(
                  child: Obx(
                    () => Text(
                      controller.description.value,
                      style: TextStyle(
                        color: const Color(0xFFE7E7E7),
                        fontSize: scale.getScaledFont(11),
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
            ],
          )),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              margin: scale.getMargin(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: scale.getScaledHeight(20),
                  ),
                  Text(
                    'Symptoms',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6299999952316284),
                      fontSize: scale.getScaledFont(18),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(13),
                  ),
                  Container(
                    padding: scale.getPadding(left: 5, top: 2, right: 2),
                    height: scale.getScaledHeight(60),
                    width: scale.getScaledHeight(320),
                    //color: Colors.orange,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Obx(
                            ()=> Wrap(
                              runAlignment: WrapAlignment.center,
                              spacing: 10,
                              children: List.generate(
                                  controller.symptoms.length,
                                  (index) => Container(
                                        padding: scale.getPadding(
                                            horizontal: 10, vertical: 10),
                                        decoration: ShapeDecoration(
                                          color: Color(0xD3FFA500),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        child: Text(
                                          controller.symptoms[index].toString(),
                                          style: TextStyle(
                                            color: Color(0xFFFCFCFC),
                                            fontSize: scale.getScaledFont(12),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ))),
                        )),
                  ),
                  Divider(
                    height: scale.getScaledHeight(10),
                    thickness: 1,
                    color: Color(0xFFD1D1D6),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(30),
                  ),
                  Text(
                    'You should take this precautions',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6299999952316284),
                      fontSize: scale.getScaledFont(18),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(13),
                  ),
                  Container(
                    padding: scale.getPadding(left: 5, top: 2, right: 2),
                    height: scale.getScaledHeight(60),
                    width: scale.getScaledHeight(320),
                    //color: Colors.orange,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Obx(
                            ()=>Wrap(
                              runAlignment: WrapAlignment.center,
                              spacing: 10,
                              children: List.generate(
                                  controller.precaution.length,
                                  (index) => Container(
                                        padding: scale.getPadding(
                                            horizontal: 10, vertical: 10),
                                        decoration: ShapeDecoration(
                                          color: Color(0xD327B479),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        child: Text(
                                         controller.precaution[index].toString(),
                                          style: TextStyle(
                                            color: Color(0xFFFCFCFC),
                                            fontSize: scale.getScaledFont(12),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ))),
                        )),
                  ),
                  Divider(
                    height: scale.getScaledHeight(10),
                    thickness: 1,
                    color: Color(0xFFD1D1D6),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
