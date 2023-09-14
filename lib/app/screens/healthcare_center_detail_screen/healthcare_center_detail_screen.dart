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
import 'controller/healthcare_controller.dart';

// class HealthcareCenterDetailScreen extends GetView<HealthcareController> {
class HealthcareCenterDetailScreen extends StatelessWidget {
  const HealthcareCenterDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();
    return Scaffold(
      body: DefaultTabController(
        length: 6,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
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
                              initialRating: 4.5,
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
              toolbarHeight: 70,
              pinned: true,
              expandedHeight: scale.getScaledHeight(170),
              elevation: 0,
              bottom: PreferredSize(
                preferredSize: const Size(double.maxFinite, 60),
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
                  indicatorColor: ColorsUtil.darkContainerColor,
                  unselectedLabelColor: Colors.black,
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: scale.getPadding(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: scale.getScaledHeight(105),
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
                        height: scale.getScaledHeight(5),
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
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                margin: scale.getMargin(horizontal: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Visibility(
                      visible: false,
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
                        indicatorColor: ColorsUtil.darkContainerColor,
                        unselectedLabelColor: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: TabBarView(
                        children: [
                          Container(),
                          Container(),
                          Container(),
                          Container(),
                          Container(),
                          Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
