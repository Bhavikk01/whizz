import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:Whizz/app/models/enum/searchByAddress.dart';
import 'package:Whizz/app/utils/app_theme.dart';
import 'package:Whizz/app/utils/colors.dart';
import 'package:Whizz/app/utils/constants.dart';
import 'package:Whizz/app/utils/scale_utility.dart';
import 'package:Whizz/app/widgets/address_picker.dart';
import 'package:Whizz/app/widgets/custom_card_widget.dart';
import 'package:Whizz/app/widgets/custom_icon_button.dart';
import 'package:Whizz/app/widgets/custom_search_field.dart';

import '../../../models/healthcare_center_model.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/custom_bottom_snackbar.dart';
import 'controller/search_healthcare_controller.dart';

class SearchHealthcareScreen extends GetView<SearchHealthcareController> {
  SearchHealthcareScreen({Key? key}) : super(key: key);
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    controller.draggableScrollableController = DraggableScrollableController();
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();
    controller.initialLoad();
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
              initialChildSize: 0.164,
              minChildSize: 0.164,
              maxChildSize: 0.90,
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
                        GestureDetector(
                          onTap: () {},
                          child: const Divider(
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
                                  controller: controller.searchController,
                                  hintText: "Search Hospital",
                                  onTap: () {
                                    controller.draggableScrollableController.animateTo(
                                      1,
                                      duration: const Duration(milliseconds: 200),
                                      curve: Curves.easeIn,
                                    );
                                    controller.isSearching.value = true;
                                    controller.searchedHealthcare.clear();
                                    if(controller.searchController.text.isEmpty){
                                      controller.searchedHealthcare.addAll(controller.healthcareCenters);
                                    }else {
                                      controller.searchedHealthcare.addAll(controller.healthcareCenters.where((element) => element.name!.toLowerCase().startsWith(controller.searchController.text.toLowerCase())));
                                    }
                                  },
                                  onChange: (value){
                                    controller.searchedHealthcare.clear();
                                    if(value.isEmpty){
                                      controller.searchedHealthcare.addAll(controller.healthcareCenters);
                                    }else {
                                      controller.searchedHealthcare.addAll(
                                      controller.healthcareCenters.where(
                                        (element) => element.name!.toLowerCase().startsWith(value.toLowerCase()))
                                      );
                                    }
                                  },
                                  onClose: (){
                                    controller.isSearching.value = false;
                                  },
                                  focusNode: focusNode,
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
                                  padding: scale.getPadding(
                                    horizontal: 5,
                                    vertical: 5,
                                  ),
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
                                              if(controller.searchBy.value == SearchByAddress.state && controller.userState.value.isEmpty){
                                                customSnackBar(
                                                  type: AnimatedSnackBarType.info,
                                                  message: 'Please select your state',
                                                );
                                              }else if(controller.searchBy.value == SearchByAddress.city && controller.userCity.value.isEmpty){
                                                customSnackBar(
                                                  type: AnimatedSnackBarType.info,
                                                  message: 'Please select your city',
                                                );
                                              }else if (controller.searchBy.value == SearchByAddress.country && controller.userCountry.value.isEmpty){
                                                customSnackBar(
                                                  type: AnimatedSnackBarType.info,
                                                  message: 'Please select your country',
                                                );
                                              }else {
                                                controller.toolTipController.hideTooltip();
                                                await controller.applyFilter();
                                              }
                                            },
                                            child: Container(
                                              width: scale.getScaledWidth(80),
                                              height: scale.getScaledHeight(30),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: ColorsUtil.brandColor,
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
                                                    borderRadius:
                                                    BorderRadius.circular(15),
                                                    border: Border.all(
                                                      color: controller.searchBy.value == SearchByAddress.state
                                                          ? ColorsUtil.brandColor
                                                          : Colors.grey[200]!,
                                                      width: 4,
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
                                                          ? ColorsUtil.brandColor
                                                          : Colors.grey[200]!,
                                                      width: 4,
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
                                                    () =>
                                                    Container(
                                                      width: scale.getScaledWidth(80),
                                                      height: scale.getScaledHeight(45),
                                                      alignment: Alignment.center,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(15),
                                                        border: Border.all(
                                                          color: controller.searchBy.value == SearchByAddress.country
                                                              ? ColorsUtil.brandColor
                                                              : Colors.grey[200]!,
                                                          width: 4,
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
                                      const SizedBox(
                                        height: 10,
                                      ),
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
                              shadowColor: Colors.black38,
                              shadowSpreadRadius: 0,
                              arrowTipDistance: 25,
                              barrierColor: Colors.black38,
                              controller: controller.toolTipController,
                              backgroundColor: Colors.white,
                              borderRadius: 15,
                              arrowBaseWidth: 0,
                              popupDirection: TooltipDirection.down,
                              borderColor: Colors.transparent,
                              child: CustomIconButton(
                                height: scale.getScaledHeight(40),
                                width: scale.getScaledWidth(40),
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
                              child: Obx(
                                () => !controller.isSearching.value ? ListView.separated(
                                  itemCount: controller.isLoading.value ? 5 : controller.healthcareCenters.length,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  primary: false,
                                  itemBuilder: (context, index) {
                                    dynamic city;
                                    dynamic state;
                                    HealthcareCenter center = HealthcareCenter();
                                    if(!controller.isLoading.value){
                                      center = controller.healthcareCenters[index];
                                      var countryIso = ConstantData.countryMap.values.toList();
                                      var countryIndex = countryIso.indexOf(center.address!.country!);
                                      var country = ConstantData.countryMap.keys.toList()[countryIndex];
                                      log('this is the country $country');
                                      state = ConstantData.stateMap[country]!.firstWhere((element) => element['state_code'] == center.address!.state);
                                      city = ConstantData.cityMap[state['name']]!.firstWhere((element) => element['id'] == int.parse(center.address!.city!));
                                    }
                                    return controller.isLoading.value ? Shimmer.fromColors(
                                        baseColor: Colors.black12,
                                        highlightColor: Colors.black26,
                                        direction: ShimmerDirection.ltr,
                                        child: CustomCardWidget(
                                          height: scale.getScaledHeight(100),
                                        )
                                    ) : CustomCardWidget(
                                      color: ColorsUtil.brandWhite,
                                      height: scale.getScaledHeight(100),
                                      child: ListTile(
                                        onTap: () {
                                          Get.toNamed(
                                            Routes.healthCenterScreen,
                                            arguments: {
                                              'healthcareId': center.id
                                            }
                                          );
                                        },
                                        leading: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.network(
                                            center.photoUrl != null
                                                ? center.photoUrl!.isNotEmpty
                                                ? center.photoUrl!.first
                                                : 'https://t3.ftcdn.net/jpg/00/45/20/70/360_F_45207005_oWfbp8uUsuEV74nNLbGS4HyrybFXQek4.jpg'
                                                : 'https://t3.ftcdn.net/jpg/00/45/20/70/360_F_45207005_oWfbp8uUsuEV74nNLbGS4HyrybFXQek4.jpg',
                                            height: scale.getScaledHeight(45),
                                            width: scale.getScaledWidth(45),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        title: Text(
                                          center.name!,
                                          maxLines: 1,
                                        ),
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
                                                  ConstantData.locationIcon,
                                                  height: scale.getScaledHeight(10),
                                                ),
                                                SizedBox(
                                                  width: scale.getScaledWidth(5),
                                                ),
                                                Text(
                                                  '${city['name']}, ${state['name']}',
                                                  style: TextStyle(
                                                    color: Colors.black.withOpacity(0.3499999940395355),
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
                                                  ConstantData.timeIcon,
                                                  height: scale.getScaledHeight(8),
                                                ),
                                                SizedBox(
                                                  width: scale.getScaledWidth(5),
                                                ),
                                                Text(
                                                  'Mon_Fri',
                                                  style: TextStyle(
                                                    color: Colors.black.withOpacity(0.3499999940395355),
                                                    fontSize: scale.getScaledFont(12),
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'open ${center.timings} hours',
                                              style: TextStyle(
                                                color: const Color(0xFF0BA336),
                                                fontSize: scale.getScaledFont(10),
                                                fontWeight: FontWeight.w400,
                                                height: 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        trailing: GestureDetector(
                                          onTap: () {
                                            controller.mapController.animateCamera(
                                              CameraUpdate.newCameraPosition(
                                                CameraPosition(
                                                  target: LatLng(
                                                    center.address!.latitude!,
                                                    center.address!.longitude!,
                                                  ),
                                                  zoom: 19
                                                ),
                                              ),
                                            );
                                            controller.draggableScrollableController.animateTo(
                                              0,
                                              duration: const Duration(milliseconds: 200),
                                              curve: Curves.easeIn,
                                            );
                                          },
                                          child: SvgPicture.asset(
                                            ConstantData.navigationIcon,
                                            height: scale.getScaledHeight(35),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (BuildContext context, int index) {
                                    return SizedBox(
                                      height: scale.getScaledHeight(10),
                                    );
                                  },
                                ) : ListView.separated(
                                  itemCount: controller.isLoading.value ? 5 : controller.searchedHealthcare.length,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  primary: false,
                                  itemBuilder: (context, index) {
                                    dynamic city;
                                    dynamic state;
                                    HealthcareCenter center = HealthcareCenter();
                                    if(!controller.isLoading.value){
                                      center = controller.searchedHealthcare[index];
                                      var countryIso = ConstantData.countryMap.values.toList();
                                      var countryIndex = countryIso.indexOf(center.address!.country!);
                                      var country = ConstantData.countryMap.keys.toList()[countryIndex];
                                      log('this is the country $country');
                                      state = ConstantData.stateMap[country]!.firstWhere((element) => element['state_code'] == center.address!.state);
                                      city = ConstantData.cityMap[state['name']]!.firstWhere((element) => element['id'] == int.parse(center.address!.city!));
                                    }
                                    return controller.isLoading.value ? Shimmer.fromColors(
                                        baseColor: Colors.black12,
                                        highlightColor: Colors.black26,
                                        direction: ShimmerDirection.ltr,
                                        child: CustomCardWidget(
                                          height: scale.getScaledHeight(100),
                                        )
                                    ) : CustomCardWidget(
                                      color: ColorsUtil.brandWhite,
                                      height: scale.getScaledHeight(100),
                                      child: ListTile(
                                        onTap: () {
                                          Get.toNamed(
                                              Routes.healthCenterScreen,
                                              arguments: {
                                                'healthcareId': center.id
                                              }
                                          );
                                        },
                                        leading: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.network(
                                            center.photoUrl != null
                                                ? center.photoUrl!.isNotEmpty
                                                ? center.photoUrl!.first
                                                : 'https://t3.ftcdn.net/jpg/00/45/20/70/360_F_45207005_oWfbp8uUsuEV74nNLbGS4HyrybFXQek4.jpg'
                                                : 'https://t3.ftcdn.net/jpg/00/45/20/70/360_F_45207005_oWfbp8uUsuEV74nNLbGS4HyrybFXQek4.jpg',
                                            height: scale.getScaledHeight(45),
                                            width: scale.getScaledWidth(45),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        title: Text(
                                          center.name!,
                                        ),
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
                                                  ConstantData.locationIcon,
                                                  height: scale.getScaledHeight(10),
                                                ),
                                                SizedBox(
                                                  width: scale.getScaledWidth(5),
                                                ),
                                                Text(
                                                  '${city['name']}, ${state['name']}',
                                                  style: TextStyle(
                                                    color: Colors.black.withOpacity(0.3499999940395355),
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
                                                  ConstantData.timeIcon,
                                                  height: scale.getScaledHeight(8),
                                                ),
                                                SizedBox(
                                                  width: scale.getScaledWidth(5),
                                                ),
                                                Text(
                                                  'Mon_Fri',
                                                  style: TextStyle(
                                                    color: Colors.black.withOpacity(0.3499999940395355),
                                                    fontSize: scale.getScaledFont(12),
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'open ${center.timings} hours',
                                              style: TextStyle(
                                                color: const Color(0xFF0BA336),
                                                fontSize: scale.getScaledFont(10),
                                                fontWeight: FontWeight.w400,
                                                height: 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        trailing: GestureDetector(
                                          onTap: () {
                                            controller.mapController.animateCamera(
                                              CameraUpdate.newCameraPosition(
                                                CameraPosition(
                                                    target: LatLng(
                                                      center.address!.latitude!,
                                                      center.address!.longitude!,
                                                    ),
                                                    zoom: 19
                                                ),
                                              ),
                                            );
                                            controller.draggableScrollableController.animateTo(
                                              0,
                                              duration: const Duration(milliseconds: 200),
                                              curve: Curves.easeIn,
                                            );
                                          },
                                          child: SvgPicture.asset(
                                            ConstantData.navigationIcon,
                                            height: scale.getScaledHeight(35),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (BuildContext context, int index) {
                                    return SizedBox(
                                      height: scale.getScaledHeight(10),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
