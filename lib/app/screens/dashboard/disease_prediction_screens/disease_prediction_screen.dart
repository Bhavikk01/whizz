import 'package:Whizz/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/scale_utility.dart';
import '../../../widgets/custom_search_field.dart';
import 'controller/disease_prediction_controller.dart';

class DiseasePredictionScreen extends GetView<DiseasePredictionController> {
  const DiseasePredictionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();
    //  Get.put(PredictorController());
    return Scaffold(
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
              title: Text("Disease Predictor"),
              centerTitle: true,
              titlePadding: EdgeInsets.only(bottom: scale.getScaledHeight(43)),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: scale.getPadding(left: 10, right: 10, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Wrap(
                    runSpacing: scale.getScaledHeight(20),
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: scale.getScaledWidth(15),
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (context, cnt) => Container(
                          height: 10,
                          width: 10,
                          color: Colors.black,
                        ),
                      )
                      // Container(height: 10,width: 30,color: Colors.black,),
                      // Container(height: 10,width: 30,color: Colors.orange,),
                    ],
                  ),
                  CustomSearchField(
                    controller: controller.controller,
                    onClose: () {},
                    height: scale.getScaledHeight(50),
                    hintText: "Enter Symptoms",
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(20),
                  ),
                  Container(
                    // width: scale.getScaledWidth(350),
                    height: scale.getScaledHeight(138),
                    decoration: ShapeDecoration(
                      color: Color(0x3DD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: scale.getScaledHeight(20),
                ),
                Text(
                  'You may have these symptoms',
                  style: TextStyle(
                    color: Color(0x4F1A203D),
                    fontSize: scale.getScaledHeight(18),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: scale.getScaledHeight(20),
                ),
                Wrap(
                  runSpacing: scale.getScaledHeight(10),
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: scale.getScaledWidth(15),
                  children: [
                    Container(
                      width: scale.getScaledWidth(200),
                      height: scale.getScaledHeight(38),
                      decoration: ShapeDecoration(
                        color: Color(0x89D1D1D6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Container(
                      width: scale.getScaledWidth(100),
                      height: scale.getScaledHeight(38),
                      decoration: ShapeDecoration(
                        color: Color(0x89D1D1D6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Container(
                      width: scale.getScaledWidth(100),
                      height: scale.getScaledHeight(38),
                      decoration: ShapeDecoration(
                        color: Color(0x89D1D1D6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Container(
                      width: scale.getScaledWidth(100),
                      height: scale.getScaledHeight(38),
                      decoration: ShapeDecoration(
                        color: Color(0x89D1D1D6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Container(
                      width: scale.getScaledWidth(100),
                      height: scale.getScaledHeight(38),
                      decoration: ShapeDecoration(
                        color: Color(0x89D1D1D6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
