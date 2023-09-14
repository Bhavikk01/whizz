import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:whizz/app/utils/app_theme.dart';
import 'package:whizz/app/utils/colors.dart';
import 'package:whizz/app/widgets/custom_icon_button.dart';
import '../../utils/constants.dart';
import '../../utils/scale_utility.dart';
import '../../widgets/custom_card_widget.dart';
import '../../widgets/custom_search_field.dart';
import '../../widgets/tab_indicator.dart';
import 'controller/healthcare_controller.dart';

class HealthcareCenterDetailScreen extends GetView<HealthcareController> {
  const HealthcareCenterDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 6,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: scale.getScaledHeight(30),
              ),
              ListTile(
                title: Row(
                    children: [
                      CustomIconButton(
                        image: ConstantData.backArrow,
                        height: scale.getScaledHeight(45),
                        width: scale.getScaledWidth(45),
                        onTap: () {
                          // Get.back();
                        },
                      ),
                      SizedBox(
                        width: scale.getScaledWidth(10),
                      ),
                      SizedBox(
                        width: scale.getScaledWidth(260),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hospital Name',
                              style: AppTheme.appTheme.textTheme.titleLarge,
                            ),
                            Row(
                              children: [
                                Text(
                                  '4.5/5 ',
                                  style: AppTheme.appTheme.textTheme.titleSmall,
                                ),
                                RatingBar.builder(
                                  initialRating: 3.5,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: scale.getScaledFont(20),
                                  unratedColor: ColorsUtil.lightContainerColor,
                                  itemPadding: scale.getPadding(horizontal: 2),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: ColorsUtil.darkContainerColor,
                                  ),
                                  onRatingUpdate: (rating) {

                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: true ? Padding(
                  padding: scale.getPadding(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: scale.getScaledHeight(20),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: Colors.red,
                            size: scale.getScaledFont(18),
                          ),
                          SizedBox(
                            width: scale.getScaledWidth(5),
                          ),
                          SizedBox(
                            width: scale.getScaledWidth(280),
                            child: Text(
                              'Indore, Madhya Pradesh',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTheme.appTheme.textTheme.titleSmall!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: scale.getScaledFont(14),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: scale.getScaledHeight(8),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: Colors.red,
                            size: scale.getScaledFont(18),
                          ),
                          SizedBox(
                            width: scale.getScaledWidth(5),
                          ),
                          SizedBox(
                            width: scale.getScaledWidth(280),
                            child: Text(
                              'Open From ${DateFormat('hh : mm a').format(DateTime.now())} To ${DateFormat('hh : mm a').format(DateTime.now())}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTheme.appTheme.textTheme.titleSmall!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: scale.getScaledFont(14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ) : Container(),
              ),
              SizedBox(
                height: scale.getScaledHeight(15),
              ),
              Container(
                height: scale.getScaledHeight(42),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 2,
                      color: Colors.grey[300]!,
                    )
                  )
                ),
                child: TabBar(
                  tabs: const [
                    Tab(
                      text: 'Basic Details',
                    ),
                    Tab(
                      text: 'Services',
                    ),
                    Tab(
                      text: 'Infrastructure',
                    ),
                    Tab(
                      text: 'Medicine Stock',
                    ),
                    Tab(
                      text: 'Doctor Details',
                    ),
                    Tab(
                      text: 'Reviews & Feedback',
                    ),
                  ],
                  isScrollable: true,
                  indicatorWeight: 4,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: ColorsUtil.darkContainerColor,
                  labelStyle: AppTheme.appTheme.textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: scale.getScaledFont(16),
                  ),
                  indicator: TabIndicator(),
                  indicatorColor: ColorsUtil.darkContainerColor,
                  unselectedLabelColor: Colors.black,
                ),
              ),
              Container(
                color: Colors.white,
                margin: scale.getMargin(horizontal: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: true
                          ? MediaQuery.of(context).size.height*0.70
                          : MediaQuery.of(context).size.height*0.79,
                      child: TabBarView(
                        children: [
                          Container(),
                          Container(),
                          Container(),
                          Container(),
                          _doctorListTab(scale, context),
                          Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _doctorListTab(ScalingUtility scale, context) {
    return Column(
      children: [
        SizedBox(
          height: scale.getScaledHeight(15),
        ),
        CustomSearchField(
          height: scale.getScaledHeight(65),
          width: scale.getScaledWidth(320),
          suffixIcon: IconButton(
            onPressed: () {

            },
            icon: Icon(
              Icons.search,
              size: scale.getScaledFont(30),
            ),
          ),
          hintText: 'Search Here',
        ),
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Expanded(
            child: ListView.builder(
              itemCount: 50,
              primary: false,
              itemBuilder: (context, index){
                return CustomCardWidget(
                  padding: scale.getPadding(horizontal: 15.0, vertical: 10.0,),
                  margin: scale.getMargin(horizontal: 5.0, vertical: 6.0,),
                  color: Colors.white,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: scale.getScaledWidth(20),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Doctor Name',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTheme.appTheme.textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: scale.getScaledFont(16),
                            ),
                          ),
                          Text(
                            'Doctors Description',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTheme.appTheme.textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: scale.getScaledFont(13),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
