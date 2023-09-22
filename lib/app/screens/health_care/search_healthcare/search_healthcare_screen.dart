import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:whizz/app/models/enum/searchByAddress.dart';
import 'package:whizz/app/utils/app_theme.dart';
import 'package:whizz/app/utils/colors.dart';
import 'package:whizz/app/utils/constants.dart';
import 'package:whizz/app/utils/scale_utility.dart';
import 'package:whizz/app/widgets/address_picker.dart';
import 'package:whizz/app/widgets/custom_card_widget.dart';
import 'package:whizz/app/widgets/custom_icon_button.dart';
import 'package:whizz/app/widgets/custom_search_field.dart';

import 'controller/search_healthcare_controller.dart';

class SearchHealthcareScreen extends GetView<SearchHealthcareController> {
  SearchHealthcareScreen({Key? key}) : super(key: key);
  final FocusNode focusNode = FocusNode();

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
                onTap: (value) {
                  // focusNode.nextFocus();
                  controller.draggableScrollableController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                  );
                },
              ),
            ),
            DraggableScrollableSheet(
              controller: controller.draggableScrollableController,
              initialChildSize: 0.16,
              minChildSize: 0.16,
              maxChildSize: 0.90,
              snap: true,
              // expand: true,
              builder:
                  (BuildContext context, ScrollController scrollController) {
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
                      GestureDetector(
                        onTap: () {},
                        child: Divider(
                          color: Colors.grey,
                          thickness: 2,
                          indent: 140,
                          endIndent: 140,
                        ),
                      ),
                      SizedBox(
                        height: scale.getScaledHeight(10),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                                height: scale.getScaledHeight(40),
                                child: CustomSearchField(
                                  hintText: "Search Hospital",
                                  onTap: () {
                                    controller.draggableScrollableController
                                        .animateTo(
                                      1,
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.easeIn,
                                    );
                                  },
                                  focusNode: focusNode,
                                )),
                          ),
                          SizedBox(
                            width: scale.getScaledWidth(10),
                          ),
                          SuperTooltip(
                            content: Material(
                              type: MaterialType.transparency,
                              child: Container(
                                height: scale.getScaledHeight(240),
                                padding: scale.getPadding(
                                    horizontal: 5, vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Search By',
                                          style: AppTheme
                                              .appTheme.textTheme.titleMedium,
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            await controller.applyFilter();
                                            controller.toolTipController
                                                .hideTooltip();
                                          },
                                          child: Container(
                                            width: scale.getScaledWidth(80),
                                            height: scale.getScaledHeight(30),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: ColorsUtil.brandColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Text(
                                              'Apply',
                                              style: AppTheme.appTheme.textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                color:
                                                    ColorsUtil.lightTextColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              controller.searchBy.value =
                                                  SearchByAddress.state;
                                            },
                                            child: Obx(
                                              () => Container(
                                                width: scale.getScaledWidth(80),
                                                height:
                                                    scale.getScaledHeight(45),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  border: Border.all(
                                                      color: controller.searchBy
                                                                  .value ==
                                                              SearchByAddress
                                                                  .state
                                                          ? ColorsUtil
                                                              .brandColor
                                                          : Colors.grey[200]!,
                                                      width: 4),
                                                ),
                                                child: Text(
                                                  'State',
                                                  style: AppTheme.appTheme
                                                      .textTheme.titleSmall,
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.searchBy.value =
                                                  SearchByAddress.city;
                                            },
                                            child: Obx(
                                              () => Container(
                                                width: scale.getScaledWidth(80),
                                                height:
                                                    scale.getScaledHeight(45),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  border: Border.all(
                                                      color: controller.searchBy
                                                                  .value ==
                                                              SearchByAddress
                                                                  .city
                                                          ? ColorsUtil
                                                              .brandColor
                                                          : Colors.grey[200]!,
                                                      width: 4),
                                                ),
                                                child: Text(
                                                  'City',
                                                  style: AppTheme.appTheme
                                                      .textTheme.titleSmall,
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.searchBy.value =
                                                  SearchByAddress.country;
                                            },
                                            child: Obx(
                                              () => Container(
                                                width: scale.getScaledWidth(80),
                                                height:
                                                    scale.getScaledHeight(45),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  border: Border.all(
                                                      color: controller.searchBy
                                                                  .value ==
                                                              SearchByAddress
                                                                  .country
                                                          ? ColorsUtil
                                                              .brandColor
                                                          : Colors.grey[200]!,
                                                      width: 4),
                                                ),
                                                child: Text(
                                                  'All',
                                                  style: AppTheme.appTheme
                                                      .textTheme.titleSmall,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Text(
                                      'Change Address',
                                      style: AppTheme
                                          .appTheme.textTheme.titleMedium,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Obx(
                                      () => AddressPicker(
                                        controller: controller,
                                        userCountry:
                                            controller.userCountry.value,
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
                              height: scale.getScaledHeight(40),
                              width: scale.getScaledWidth(40),
                              image: ConstantData.filterIcon,
                              onTap: () {
                                controller.draggableScrollableController
                                    .animateTo(
                                  1,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeIn,
                                );
                                Future.delayed(
                                    const Duration(milliseconds: 300), () {
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
                              physics:const BouncingScrollPhysics(),
                              // padding: EdgeInsets.symmetric(vertical: scale.getScaledHeight(15)),

                              primary: false,
                              itemBuilder: (context, index) {
                                return CustomCardWidget(
                                    color: ColorsUtil.brandWhite,
                                    height: 100,
                                    child: ListTile(
                                      leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          "https://t3.ftcdn.net/jpg/00/45/20/70/360_F_45207005_oWfbp8uUsuEV74nNLbGS4HyrybFXQek4.jpg",
                                          height: scale.getScaledHeight(45),
                                          width: scale.getScaledWidth(45),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      // leading: SvgPicture.asset("assets/icons/hospital2_svg.svg",height: scale.getScaledHeight(50),fit: BoxFit.fill,),
                                      title: Text("Dr. Bhavik Kothari"),
                                      subtitle: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            height: scale.getScaledHeight(5),
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  "assets/icons/location.svg"),
                                              SizedBox(
                                                width: scale.getScaledWidth(5),
                                              ),
                                              Text(
                                                'Indore, Madhya Pradesh',
                                                style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(
                                                          0.3499999940395355),
                                                  fontSize: 12,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w400,
                                                  height: 0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  "assets/icons/time_svg.svg"),
                                              SizedBox(
                                                width: scale.getScaledWidth(5),
                                              ),
                                              Text(
                                                'Mon_Fri',
                                                style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(
                                                          0.3499999940395355),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  height: 0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'open 24 hours',
                                            style: TextStyle(
                                              color: Color(0xFF0BA336),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      trailing: SvgPicture.asset(
                                        "assets/icons/navigation_svg.svg",
                                        height: scale.getScaledHeight(35),
                                      ),
                                    ));
                              }, separatorBuilder: (BuildContext context, int index) {
                                return SizedBox(height: scale.getScaledHeight(10),);
                            },
                              /*   separatorBuilder: (context, index) {
                                return Container(
                                  height: 1,
                                  width: scale.fw,
                                  color: Colors.grey[300]!,
                                );
                              },*/
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
/*Container(
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
                                )*/
