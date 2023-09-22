import 'package:Whizz/app/screens/medical_records/controllers/medical_report_controller.dart';
import 'package:Whizz/app/utils/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/scale_utility.dart';

class MedicalReportScreen extends GetView<MedicalReportController> {
  MedicalReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [Center(child: Text("Medical Reports"))],
        ),
        floatingActionButton: GestureDetector(
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
                  return Container(
                    padding: EdgeInsets.only(left: 30,top: 30,right: 20,bottom: 50),
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
                          decoration:
                              InputDecoration(hintText: "Center Location"),
                        ),
                        SizedBox(
                          height: scale.getScaledHeight(30),
                        ),
                        GestureDetector(
                          onTap: (){},
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                              radius: Radius.circular(20),
                              color: Colors.grey.shade500,
                              // borderPadding: EdgeInsets.all(10),
                              dashPattern: [1,5],
                              strokeCap: StrokeCap.square,

                              child: Container(
                            height: scale.fh / 7,
                            width: double.infinity,

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset("assets/icons/cloud_upload.svg",height: scale.getScaledHeight(40),),
                                SizedBox(height: scale.getScaledHeight(30),),
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
                        SizedBox(height: scale.getScaledHeight(40),),
                        GestureDetector(
                          onTap: (){},
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Container(
                                padding:
                                EdgeInsets.only(left: 35, right: 45, top: 7, bottom: 7),
                                child: Text(
                                  "Upload",
                                  style: TextStyle(color: ColorsUtil.brandWhite),
                                ),
                                decoration: ShapeDecoration(
                                    shape: StadiumBorder(), color: ColorsUtil.brandColor),
                              ),
                              Positioned(
                                  right: -2,
                                  child: SvgPicture.asset(
                                    "assets/icons/upload_svg.svg",
                                    height: scale.getScaledHeight(30),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Container(
                padding:
                    EdgeInsets.only(left: 35, right: 45, top: 7, bottom: 7),
                child: Text(
                  "Upload",
                  style: TextStyle(color: ColorsUtil.brandWhite),
                ),
                decoration: ShapeDecoration(
                    shape: StadiumBorder(), color: ColorsUtil.brandColor),
              ),
              Positioned(
                  right: -2,
                  child: SvgPicture.asset(
                    "assets/icons/upload_svg.svg",
                    height: scale.getScaledHeight(30),
                  ))
            ],
          ),
        ));
  }
}

class ReportCard extends StatelessWidget {
  const ReportCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(),
    );
  }
}
