import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:Whizz/app/utils/scale_utility.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';

class AddressPicker extends StatelessWidget {
  final dynamic controller;
  final String userCountry;
  final String userState;
  final String userCity;
  const AddressPicker({required this.controller, required this.userCountry, required this.userState, required this.userCity, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Column(
      children: [
        Container(
          padding: scale.getPadding(top: 4),
          child: CustomDropdown(
            hintText: 'Country*',
            fillColor: ColorsUtil.fieldColor,
            hintStyle: Theme.of(context).textTheme.labelLarge,
            listItemStyle: Theme.of(context).textTheme.labelLarge,
            selectedStyle: Theme.of(context).textTheme.titleSmall,
            excludeSelected: true,
            items: ConstantData.stateMap.keys.toList(),
            controller: controller.userCountryController,
            onChanged: (value) {
              log('Hello world $value');
              controller.userCountry.value = value;
              controller.userState.value = '';
              controller.userCity.value = '';
              controller.userStateController.text = '';
              controller.userCityController.text = '';
            },
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: scale.getPadding(right: 2, bottom: 4, top: 8),
                child: CustomDropdown(
                  hintText: 'State*',
                  fillColor: ColorsUtil.fieldColor,
                  hintStyle: Theme.of(context).textTheme.labelLarge,
                  listItemStyle: Theme.of(context).textTheme.labelLarge,
                  selectedStyle: Theme.of(context).textTheme.titleSmall,
                  excludeSelected: true,
                  items: controller.userCountry.value != '' ?
                  ConstantData.stateMap[controller.userCountry.value]?.map((e) => e['name'] as String).toList() :
                  ['Select Country First'],
                  controller: controller.userStateController,
                  onChanged: (value) {
                    log('Hello world $value');
                    if (value != 'Select Country First') {
                      controller.userState.value = value;
                      controller.userCity.value = '';
                      controller.userCityController.text = '';
                    } else {
                      controller.userStateController.text = '';
                    }
                  },
                )
              ),
            ),
            Expanded(
              child: Container(
                padding: scale.getPadding(left: 2, bottom: 4, top: 8),
                child: CustomDropdown(
                  hintText: 'City',
                  fillColor: ColorsUtil.fieldColor,
                  hintStyle: Theme.of(context).textTheme.labelLarge,
                  listItemStyle: Theme.of(context).textTheme.labelLarge,
                  selectedStyle: Theme.of(context).textTheme.titleSmall,
                  excludeSelected: true,
                  items: controller.userState.value != '' ?
                  ConstantData.cityMap[controller.userState.value]!.isNotEmpty ?
                  ConstantData.cityMap[controller.userState.value]?.map((e) => e['name'] as String).toList() :
                  ['City Not Available'] :
                  ['Select State First'],
                  controller: controller.userCityController,
                  onChanged: (value) {
                    log('Hello world $value');
                    if (value != 'Select State First' && value != 'City Not Available') {
                      controller.userCity.value = value;
                    } else {
                      controller.userCityController.text = '';
                    }
                  },
                )
              ),
            ),
          ],
        ),
      ],
    );
  }
}
