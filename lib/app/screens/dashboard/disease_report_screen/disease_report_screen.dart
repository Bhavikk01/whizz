import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/scale_utility.dart';

class DiseaseReportScreen extends StatefulWidget {
  const DiseaseReportScreen({Key? key}) : super(key: key);

  @override
  State<DiseaseReportScreen> createState() => _DiseaseReportScreenState();
}

class _DiseaseReportScreenState extends State<DiseaseReportScreen> {
  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {},
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
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: Color(0xFF2B447C),
              maxRadius: scale.getScaledWidth(22),
              child: Icon(Icons.arrow_downward,
                  color: Colors.white, size: scale.getScaledHeight(25)),
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
                      child: Text(
                        "5",
                        style: TextStyle(
                            color: Color(0xFFFC3E32),
                            fontWeight: FontWeight.bold,
                            fontSize: scale.getScaledFont(15)),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      height: scale.getScaledHeight(5),
                    ),
                    Text(
                      'Arthritis',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: scale.getScaledFont(20),
                        fontWeight: FontWeight.w600,
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
                  child: Text(
                    'Arthritis is the swelling and tenderness of one or more of your joints. The main symptoms of arthritis are joint pain and stiffness, which typically worsen with age. The most common types of arthritis are osteoarthritis and rheumatoid arthritis',
                    style: TextStyle(
                      color: Color(0xFFE7E7E7),
                      fontSize: scale.getScaledFont(11),
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ],
          )),
          SliverFillRemaining(
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
                        child: Wrap(
                            runAlignment: WrapAlignment.center,
                            spacing: 10,
                            children: List.generate(
                                20,
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
                                        "Arthritis",
                                        style: TextStyle(
                                          color: Color(0xFFFCFCFC),
                                          fontSize: scale.getScaledFont(12),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    )))),
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
                        child: Wrap(
                            runAlignment: WrapAlignment.center,
                            spacing: 10,
                            children: List.generate(
                                20,
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
                                        "Exercise",
                                        style: TextStyle(
                                          color: Color(0xFFFCFCFC),
                                          fontSize: scale.getScaledFont(12),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    )))),
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
