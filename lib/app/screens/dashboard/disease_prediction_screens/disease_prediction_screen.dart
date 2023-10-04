import 'dart:ffi';

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
            actions: [
              TextButton(onPressed: controller.onClickPredictButton, child: Text("Predict")),
              // SizedBox(width: scale.getScaledWidth(5),)
            ],
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
              titlePadding: EdgeInsets.only(bottom: scale.getScaledHeight(30)),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: scale.getPadding(left: 10, right: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // SizedBox(
                  //   height: scale.getScaledHeight(20),
                  // ),
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
                  Obx(
                        ()=>Wrap(
                        runSpacing: scale.getScaledHeight(20),
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: scale.getScaledWidth(15),
                        children: List.generate(
                            controller.askDiseaseList.length,
                                (index) => GestureDetector(
                              onTap: () async{

                                controller.selectedList.add(
                                    controller.askDiseaseList[index]);
                                controller.selectedList.value = controller.selectedList.toSet().toList();
                                await controller.askSymptoms();

                              },
                              child: Container(
                                // width: scale.getScaledWidth(50),
                                padding: scale.getPadding(
                                    horizontal: 10, vertical: 10),
                                decoration: ShapeDecoration(
                                  color: Color(0x89D1D1D6),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),

                                child: Text(
                                    controller.askDiseaseList[index]),
                              ),
                            ))
                      // Container(height: 10,width: 30,color: Colors.black,),
                      // Container(height: 10,width: 30,color: Colors.orange,),

                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(20),
                  ),
                  Divider(indent: 100,endIndent: 100,thickness: 2,)
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: scale.getPadding(left: 10, right: 10, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  controller.selectedList.value==null?SliverToBoxAdapter(child: Container(),):Obx(
                      ()=>Wrap(
                        runSpacing: scale.getScaledHeight(20),
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: scale.getScaledWidth(15),
                        direction: Axis.horizontal,
                        children: List.generate(

                            controller.selectedList!.value!.length,
                            (index) => Container(
                                  // width: scale.getScaledWidth(50),
                                  padding: scale.getPadding(
                                      horizontal: 10, vertical: 10),
                                  decoration: ShapeDecoration(
                                    color: Color(0x89D1D1D6),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),

                                  child: Text(controller.selectedList[index]!),
                                ))),
                  ),

                  SizedBox(
                    height: scale.getScaledHeight(15),
                  ),
                  CustomSearchField(
                    controller: controller.controller,
                    onClose: () {
                      controller.foundDisease.value = [''];
                    },
                    onChange: (String disease) {
                      if (disease.isEmpty) {
                        controller.foundDisease.value = [''];
                      } else {
                        controller.searchDisease(disease);
                      }
                    },
                    height: scale.getScaledHeight(50),
                    hintText: "Enter Symptoms",
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(20),
                  ),
                  Obx(() => controller.foundDisease.length > 1
                      ? Container(
                          width: scale.getScaledWidth(350),
                          height: scale.getScaledHeight(200),
                          decoration: ShapeDecoration(
                            color: Color(0x3DD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Obx(() => controller.containsDisease.value
                              ? SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Padding(
                                    padding: scale.getPadding(top: 10),
                                    child: Wrap(
                                        runSpacing: scale.getScaledHeight(20),
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        spacing: scale.getScaledWidth(15),
                                        children: List.generate(
                                            controller.foundDisease.length,
                                            (index) => InkWell(
                                                  onTap: () async{
                                                    controller.selectedList.add(
                                                        controller
                                                                .foundDisease[
                                                            index]);
                                                    controller.selectedList.value = controller.selectedList.toSet().toList();
                                                    await controller.askSymptoms();
                                                  },
                                                  child: Container(
                                                    // width: scale.getScaledWidth(50),
                                                    padding: scale.getPadding(
                                                        horizontal: 10,
                                                        vertical: 10),
                                                    decoration: ShapeDecoration(
                                                      color: Color(0x89D1D1D6),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                    ),

                                                    child: Text(controller
                                                        .foundDisease[index]),
                                                  ),
                                                ))),
                                  ),
                                )
                              : Container(
                                  height: -10,
                                )),
                        )
                      : Container(
                          height: null,
                        )),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
