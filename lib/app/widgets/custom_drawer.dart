
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:whizz/app/utils/scale_utility.dart';

import '../global_controllers/drawer_controller.dart';
import '../utils/constants.dart';
import 'custom_icon_button.dart';


class CustomDrawer extends GetView<CustomDrawerController> {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();
    return SuperTooltip(
      controller: controller.toolTipController,
      popupDirection: TooltipDirection.down,
      // arrowLength: 20,
      arrowLength: 1,
      arrowBaseWidth: 0,
      arrowTipDistance: scale.getScaledHeight(25),
      content: Material(
        type: MaterialType.transparency,
        child: Container(
          height: scale.getScaledHeight(200),
          width: scale.getScaledWidth(250),
          padding: scale.getPadding(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      hasShadow: false,
      child: CustomIconButton(
        image: ConstantData.menuIcon,
        height: scale.getScaledHeight(45),
        width: scale.getScaledWidth(45),
        onTap: () {
          controller.toolTipController.showTooltip();
        },
      ),
    );
  }
}
