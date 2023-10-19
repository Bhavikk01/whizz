import 'dart:ffi';

import 'package:Whizz/app/utils/app_theme.dart';
import 'package:Whizz/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
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
              TextButton(
                onPressed: controller.onClickPredictButton,
                child: const Text("Predict"),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      ConstantData.backgroundTile,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: const Text("Disease Predictor"),
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
                  TypeAheadField(
                    textFieldConfiguration: TextFieldConfiguration(
                      style: AppTheme.appTheme.textTheme.bodyLarge,
                      controller: controller.controller,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: 'Search your symptoms',
                        suffix: GestureDetector(
                          onTap: () async {
                            if (controller.controller.text.isNotEmpty) {
                              controller.selectedList.add(controller.controller.text);
                              controller.controller.text = '';
                              controller.selectedList.value = controller.selectedList.toSet().toList();
                              await controller.askSymptoms();
                            }
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                            size: scale.getScaledFont(15),
                          ),
                        ),
                      ),
                    ),
                    itemBuilder: (BuildContext context, itemData) {
                      return Container(
                        padding: scale.getPadding(
                          horizontal: 10,
                          vertical: 14,
                        ),
                        margin: scale.getMargin(
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: ColorsUtil.brandColor,
                          border: Border.all(
                            color: Colors.white12,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          itemData as String,
                          style:
                              AppTheme.appTheme.textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                    hideOnEmpty: true,
                    onSuggestionSelected: (Object? suggestion) async {
                      controller.controller.text = '';
                      controller.selectedList.add(suggestion as String);
                      await controller.askSymptoms();
                    },
                    suggestionsCallback: (String pattern) {
                      if (pattern.isNotEmpty) {
                        return controller.diseaseList.where((element) =>
                            element.toLowerCase().contains(pattern));
                      } else {
                        return [];
                      }
                    },
                  ),
                  controller.askDiseaseList.isNotEmpty
                      ? SizedBox(
                          height: scale.getScaledHeight(20),
                        )
                      : Container(),
                  controller.askDiseaseList.isNotEmpty
                      ? Text(
                          'You may have these symptoms',
                          style: TextStyle(
                            color: const Color(0x4F1A203D),
                            fontSize: scale.getScaledHeight(18),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : Container(),
                  controller.askDiseaseList.isNotEmpty
                      ? SizedBox(
                          height: scale.getScaledHeight(20),
                        )
                      : Container(),
                  Obx(
                    () => Wrap(
                        runSpacing: scale.getScaledHeight(20),
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: scale.getScaledWidth(15),
                        children: List.generate(
                          controller.askDiseaseList.length,
                          (index) => GestureDetector(
                            onTap: () async {
                              controller.selectedList
                                  .add(controller.askDiseaseList[index]);
                              controller.selectedList.value =
                                  controller.selectedList.toSet().toList();
                              await controller.askSymptoms();
                            },
                            child: Container(
                              padding: scale.getPadding(
                                  horizontal: 10, vertical: 10),
                              decoration: ShapeDecoration(
                                color: const Color(0x89D1D1D6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(controller.askDiseaseList[index]),
                            ),
                          ),
                        )),
                  ),
                  Obx(
                    () => Container(
                      padding: scale.getPadding(left: 10, right: 10, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Divider(
                            indent: 0,
                            thickness: 2,
                          ),
                          SizedBox(
                            height: scale.getScaledHeight(15),
                          ),
                          controller.selectedList.isEmpty
                              ? Container()
                              : Obx(
                                  () => Wrap(
                                    runSpacing: scale.getScaledHeight(20),
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    spacing: scale.getScaledWidth(15),
                                    direction: Axis.horizontal,
                                    children: List.generate(
                                      controller.selectedList.length,
                                      (index) => Container(
                                        padding: scale.getPadding(
                                            horizontal: 10, vertical: 10),
                                        decoration: ShapeDecoration(
                                          color: const Color(0x89D1D1D6),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        child: Text(
                                            controller.selectedList[index]!),
                                      ),
                                    ),
                                  ),
                                ),
                          SizedBox(
                            height: scale.getScaledHeight(15),
                          ),
                          Obx(
                            () => controller.foundDisease.length > 1
                                ? Container(
                                    width: scale.getScaledWidth(350),
                                    height: scale.getScaledHeight(200),
                                    decoration: ShapeDecoration(
                                      color: const Color(0x3DD9D9D9),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: Obx(
                                      () => controller.containsDisease.value
                                          ? SingleChildScrollView(
                                              scrollDirection: Axis.vertical,
                                              child: Padding(
                                                padding:
                                                    scale.getPadding(top: 10),
                                                child: Wrap(
                                                  runSpacing:
                                                      scale.getScaledHeight(20),
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  spacing:
                                                      scale.getScaledWidth(15),
                                                  children: List.generate(
                                                    controller
                                                        .foundDisease.length,
                                                    (index) => InkWell(
                                                      onTap: () async {
                                                        controller.selectedList
                                                            .add(controller
                                                                    .foundDisease[
                                                                index]);
                                                        controller.selectedList
                                                                .value =
                                                            controller
                                                                .selectedList
                                                                .toSet()
                                                                .toList();
                                                        await controller
                                                            .askSymptoms();
                                                      },
                                                      child: Container(
                                                        padding:
                                                            scale.getPadding(
                                                                horizontal: 10,
                                                                vertical: 10),
                                                        decoration:
                                                            ShapeDecoration(
                                                          color: const Color(
                                                              0x89D1D1D6),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          controller
                                                                  .foundDisease[
                                                              index],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Container(
                                              height: -10,
                                            ),
                                    ),
                                  )
                                : Container(
                                    height: null,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
