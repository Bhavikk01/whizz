import 'package:Whizz/app/screens/medical_records/controllers/medical_report_controller.dart';
import 'package:Whizz/app/utils/colors.dart';
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: true,
              leading: Icon(Icons.arrow_back),
              expandedHeight: Get.height / 4.2,
              backgroundColor: Colors.white,
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                        color: ColorsUtil.brandColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Medical Reports", style: TextStyle(color: Colors.white, fontSize: 30),),
                        SizedBox(height: 40,)
                      ],
                    ),
                  );
                },
              )),
          SliverFillRemaining(
            child: ListView.builder(itemBuilder: (context, index) {
              return ReportCard();
            }, itemCount: 10),
          )
        ],
      ),
    );
  }
}

class ReportCard extends StatelessWidget {
  const ReportCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 15, right: 15, top: 5),
      shape: RoundedRectangleBorder(),
      child: ListTile(
        tileColor: Colors.white,
        style: ListTileStyle.list,
        contentPadding: EdgeInsets.only(top: 15, bottom: 15, left: 10),
        title: Text("Sonography widget",style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5,),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/location.svg'),
                    SizedBox(width: 6,),
                    Text("Apoorva Digital X-Ray Sonography Indore", style: TextStyle(fontSize: 13, color: ColorsUtil.greyTextColor),),
                  ],
                ),
                SizedBox(height: 5),
                Text("23 Sept 2023", style: TextStyle(fontSize: 10,color: ColorsUtil.greyTextColor),),
               SizedBox(height: 8),
              ],
            )
          ],
        ),
        leading: SvgPicture.asset('assets/icons/file.svg'),
        trailing: IconButton(onPressed: (){},icon: SvgPicture.asset('assets/icons/sharecircle.svg',height: 80)),
      ),
    );
  }
}
