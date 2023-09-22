import 'package:Whizz/app/screens/medical_records/controllers/medical_report_controller.dart';
import 'package:Whizz/app/utils/colors.dart';
import 'package:Whizz/app/utils/constants.dart';
import 'package:Whizz/app/widgets/upload_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/scale_utility.dart';

class MedicalReportScreen extends GetView<MedicalReportController> {
  const MedicalReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                  pinned: true,
                  leading: Icon(Icons.arrow_back),
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  collapsedHeight: scale.getScaledHeight(100),
                  expandedHeight: Get.height / 4.2,
                  backgroundColor: Colors.white,
                  flexibleSpace: LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        height: constraints.maxHeight,
                        width: constraints.maxWidth,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                ConstantData.backgroundTile,
                              ),
                              fit: BoxFit.cover,
                            ),
                            color: ColorsUtil.brandColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Medical Reports",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: scale.getScaledHeight(25)),
                            ),
                            SizedBox(
                              height: scale.getScaledHeight(40),
                            )
                          ],
                        ),
                      );
                    },
                  )),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                childCount: 10,
                (context, index) {
                  return ReportCard();
                },
              ))
            ],
          ),
        ),
        floatingActionButton: UploadButton(
          onTap: () {
            showModalBottomSheet(
                isScrollControlled: true,
                enableDrag: true,
                useSafeArea: true,
                useRootNavigator: true,
                constraints: BoxConstraints(
                  maxHeight: double.infinity,
                ),
                backgroundColor: Colors.transparent,
                barrierColor: ColorsUtil.brandColor.withOpacity(0.5),
                context: context,
                builder: (context) {
                  return const ReportBottomSheet();
                });
          },
        ));
  }
}

class ReportCard extends StatelessWidget {
  const ReportCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();
    return Card(
      margin: EdgeInsets.only(
          left: scale.getScaledWidth(20),
          right: scale.getScaledWidth(20),
          top: scale.getScaledHeight(3)),
      shadowColor: Color(0x33000000),
      elevation: 5,
      shape: RoundedRectangleBorder(),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.titleHeight,
        shape: RoundedRectangleBorder(),
        minLeadingWidth: 35,
        horizontalTitleGap: 20,
        tileColor: Colors.white,
        style: ListTileStyle.list,
        contentPadding: EdgeInsets.only(
            top: scale.getScaledHeight(30),
            bottom: scale.getScaledHeight(15),
            left: scale.getScaledWidth(10)),
        title: Text(
          "Sonography widget",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: scale.getScaledHeight(15)),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: scale.getScaledHeight(20)),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: scale.getScaledHeight(5),
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/location.svg'),
                    SizedBox(
                      width: scale.getScaledHeight(6),
                    ),
                    Text(
                      "Apoorva Digital X-Ray Sonography Indore",
                      style: TextStyle(
                          fontSize: scale.getScaledHeight(9),
                          color: ColorsUtil.greyTextColor),
                    ),
                  ],
                ),
                SizedBox(height: scale.getScaledHeight(5)),
                Text(
                  "23 Sept 2023",
                  style: TextStyle(
                      fontSize: scale.getScaledHeight(7),
                      color: ColorsUtil.greyTextColor),
                ),
                // SizedBox(height: scale.getScaledHeight(10)),
              ],
            )
          ],
        ),
        leading: SvgPicture.asset('assets/icons/file.svg'),
        trailing: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/sharecircle.svg',
              height: scale.getScaledHeight(40),
            )),
      ),
    );
  }
}

class ReportBottomSheet extends StatelessWidget {
  const ReportBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();
    return Container(
      padding: EdgeInsets.only(left: 30, top: 30, right: 20, bottom: 50),
      decoration: ShapeDecoration(
          color: ColorsUtil.brandWhite,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30)))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Upload Report",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: scale.getScaledHeight(30),
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "Report Type"),
          ),
          /*DropdownButtonFormField(
                          isDense: true,
                            value: ,
                            menuMaxHeight: 10,
                            items: [
                              DropdownMenuItem(child: Text("PDF")),
                              DropdownMenuItem(child: Text("PNG")),
                        ],
                            onChanged: (value) {}),*/
          SizedBox(
            height: scale.getScaledHeight(20),
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "Center Location"),
          ),
          SizedBox(
            height: scale.getScaledHeight(30),
          ),
          GestureDetector(
            onTap: () {},
            child: DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(20),
                color: Colors.grey.shade500,
                // borderPadding: EdgeInsets.all(10),
                dashPattern: [1, 5],
                strokeCap: StrokeCap.square,
                child: Container(
                  height: scale.fh / 7,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/cloud_upload.svg",
                        height: scale.getScaledHeight(40),
                      ),
                      SizedBox(
                        height: scale.getScaledHeight(30),
                      ),
                      Text(
                        'choose file from your system',
                        style: TextStyle(
                          color: Color(0xFF4285F4),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 0.14,
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          SizedBox(
            height: scale.getScaledHeight(40),
          ),
          UploadButton(
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
