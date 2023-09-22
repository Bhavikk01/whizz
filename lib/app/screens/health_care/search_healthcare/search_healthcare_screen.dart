
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:Whizz/app/models/enum/searchByAddress.dart';
import 'package:Whizz/app/utils/app_theme.dart';
import 'package:Whizz/app/utils/colors.dart';
import 'package:Whizz/app/utils/constants.dart';
import 'package:Whizz/app/utils/scale_utility.dart';
import 'package:Whizz/app/widgets/address_picker.dart';
import 'package:Whizz/app/widgets/custom_icon_button.dart';

import 'controller/search_healthcare_controller.dart';

class SearchHealthcareScreen extends GetView<SearchHealthcareController> {
  const SearchHealthcareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.draggableScrollableController = DraggableScrollableController();
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Obx(
              () => GoogleMap(
                initialCameraPosition: controller.cameraPosition.value,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                zoomControlsEnabled: false,
                onMapCreated: (GoogleMapController googleMapController) async {
                  controller.mapController = googleMapController;
                },
              ),
            ),
            DraggableScrollableSheet(
              controller: controller.draggableScrollableController,
              initialChildSize: 0.16,
              minChildSize: 0.16,
              maxChildSize: 0.95,
              snap: true,
              builder: (BuildContext context, ScrollController scrollController) {
                return Container(
                  padding: scale.getPadding(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: ColorsUtil.brandWhite,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: scale.getScaledHeight(10),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              onTap: () {
                                controller.draggableScrollableController.animateTo(
                                  1,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeIn,
                                );
                              },
                              decoration: const InputDecoration(
                                hintText: "Healthcare name",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: scale.getScaledWidth(10),
                          ),
                          SuperTooltip(
                            content: Material(
                              type: MaterialType.transparency,
                              child: Container(
                                height: scale.getScaledHeight(240),
                                padding: scale.getPadding(horizontal: 5, vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Search By',
                                          style: AppTheme.appTheme.textTheme.titleMedium,
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            await controller.applyFilter();
                                            controller.toolTipController.hideTooltip();
                                          },
                                          child: Container(
                                            width: scale.getScaledWidth(80),
                                            height: scale.getScaledHeight(30),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: ColorsUtil.blueColor,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Text(
                                              'Apply',
                                              style: AppTheme.appTheme.textTheme.titleSmall!.copyWith(
                                                color: ColorsUtil.lightTextColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              controller.searchBy.value = SearchByAddress.state;
                                            },
                                            child: Obx(
                                              () => Container(
                                                width: scale.getScaledWidth(80),
                                                height: scale.getScaledHeight(45),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(15),
                                                  border: Border.all(
                                                    color: controller.searchBy.value == SearchByAddress.state
                                                      ? ColorsUtil.darkContainerColor
                                                      : Colors.grey[200]!,
                                                      width: 4
                                                  ),
                                                ),
                                                child: Text(
                                                  'State',
                                                  style: AppTheme.appTheme.textTheme.titleSmall,
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.searchBy.value = SearchByAddress.city;
                                            },
                                            child: Obx(
                                              () => Container(
                                                width: scale.getScaledWidth(80),
                                                height: scale.getScaledHeight(45),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(15),
                                                  border: Border.all(
                                                      color: controller.searchBy.value == SearchByAddress.city
                                                          ? ColorsUtil.darkContainerColor
                                                          : Colors.grey[200]!,
                                                      width: 4
                                                  ),
                                                ),
                                                child: Text(
                                                  'City',
                                                  style: AppTheme.appTheme.textTheme.titleSmall,
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.searchBy.value = SearchByAddress.country;
                                            },
                                            child: Obx(
                                              () => Container(
                                                width: scale.getScaledWidth(80),
                                                height: scale.getScaledHeight(45),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(15),
                                                  border: Border.all(
                                                      color: controller.searchBy.value == SearchByAddress.country
                                                          ? ColorsUtil.darkContainerColor
                                                          : Colors.grey[200]!,
                                                      width: 4
                                                  ),
                                                ),
                                                child: Text(
                                                  'All',
                                                  style: AppTheme.appTheme.textTheme.titleSmall,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Text(
                                      'Change Address',
                                      style: AppTheme.appTheme.textTheme.titleMedium,
                                    ),
                                    const SizedBox(height: 10,),
                                    Obx(
                                      () => AddressPicker(
                                        controller: controller,
                                        userCountry: controller.userCountry.value,
                                        userState: controller.userState.value,
                                        userCity: controller.userCity.value,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            right: scale.getScaledWidth(30),
                            shadowColor: Colors.grey[200]!,
                            arrowTipDistance: 25,
                            barrierColor: Colors.transparent,
                            controller: controller.toolTipController,
                            backgroundColor: Colors.white,
                            borderRadius: 15,
                            arrowBaseWidth: 0,
                            popupDirection: TooltipDirection.down,
                            // arrowLength: 15,
                            borderColor: Colors.transparent,
                            child: CustomIconButton(
                              height: scale.getScaledHeight(50),
                              width: scale.getScaledWidth(50),
                              image: ConstantData.filterIcon,
                              onTap: () {
                                controller.draggableScrollableController.animateTo(
                                  1,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeIn,
                                );
                                Future.delayed(const Duration(milliseconds: 300), () {
                                  controller.toolTipController.showTooltip();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: scale.getScaledHeight(15),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: ListView.separated(
                              itemCount: 10,
                              shrinkWrap: true,
                              primary: false,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: scale.getPadding(vertical: 13),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: scale.getScaledHeight(45),
                                                width: scale.getScaledWidth(45),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(15),
                                                  image: const DecorationImage(
                                                    image: AssetImage(
                                                      'assets/images/appolo_hospital.jpg',
                                                    ),
                                                    fit: BoxFit.cover,
                                                  )
                                                ),
                                              ),
                                              SizedBox(
                                                width: scale.getScaledWidth(10),
                                              ),
                                              SizedBox(
                                                width: 200,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Dr. K.Roshan Rao',
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: AppTheme.appTheme.textTheme.titleSmall!
                                                          .copyWith(
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: scale.getScaledFont(18),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      'Indore, Madhya Pradesh',
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: AppTheme.appTheme.textTheme.titleSmall!
                                                          .copyWith(
                                                        fontWeight: FontWeight.w300,
                                                        fontSize: scale.getScaledFont(13),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.timelapse,
                                                size: scale.getScaledFont(15),
                                                color: ColorsUtil.darkContainerColor,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Mon - Fri',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: AppTheme.appTheme.textTheme.bodySmall!
                                                    .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: scale.getScaledFont(13),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '${DateFormat('hh:mma').format(DateTime.now())} - ${DateFormat('hh:mma').format(DateTime.now())}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: AppTheme.appTheme.textTheme.bodySmall!
                                                .copyWith(
                                              fontSize: scale.getScaledFont(11),
                                            ),
                                          ),
                                        ],
                                      ),
                                      CustomIconButton(
                                        color: ColorsUtil.blueColor,
                                        height: scale.getScaledHeight(40),
                                        width: scale.getScaledWidth(40),
                                        image: ConstantData.navigationIcon,
                                      )
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Container(
                                  height: 1,
                                  width: scale.fw,
                                  color: Colors.grey[300]!,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
