
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:Whizz/app/utils/app_theme.dart';
import 'package:Whizz/app/utils/colors.dart';
import 'package:Whizz/app/widgets/custom_icon_button.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constants.dart';
import '../../../utils/scale_utility.dart';
import '../../../widgets/custom_search_field.dart';
import '../../../widgets/tab_indicator.dart';
import 'controller/healthcare_controller.dart';

class HealthcareCenterDetailScreen extends GetView<HealthcareController> {
  const HealthcareCenterDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: SingleChildScrollView(
            child: Obx(
              () => !controller.isLoading.value ? Column(
                children: [
                  ListTile(
                    title: Row(
                      children: [
                        CustomIconButton(
                          image: ConstantData.backArrow,
                          height: scale.getScaledHeight(35),
                          width: scale.getScaledWidth(35),
                          onTap: () {
                            Get.back();
                          },
                          iconColor: ColorsUtil.brandColor,
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
                                controller.healthcare.name!,
                                style: AppTheme.appTheme.textTheme.titleLarge,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '3.5/5 ',
                                    style: AppTheme.appTheme.textTheme.titleSmall,
                                  ),
                                  RatingBar.builder(
                                    initialRating: 3.5,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    ignoreGestures: true,
                                    itemCount: 5,
                                    itemSize: scale.getScaledFont(20),
                                    unratedColor: ColorsUtil.lightContainerColor,
                                    itemPadding: scale.getPadding(horizontal: 2),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: ColorsUtil.darkContainerColor,
                                    ),
                                    onRatingUpdate: (rating) {},
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
                    child: Padding(
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
                                      color: ColorsUtil.brandColor,
                                      size: scale.getScaledFont(18),
                                    ),
                                    SizedBox(
                                      width: scale.getScaledWidth(5),
                                    ),
                                    SizedBox(
                                      width: scale.getScaledWidth(280),
                                      child: Text(
                                        '${controller.city['name']}, ${controller.state['name']}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTheme
                                            .appTheme.textTheme.titleSmall!
                                            .copyWith(
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
                                      color: ColorsUtil.brandColor,
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
                                        style: AppTheme
                                            .appTheme.textTheme.titleSmall!
                                            .copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: scale.getScaledFont(14),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(15),
                  ),
                  Container(
                    height: scale.getScaledHeight(41),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: Colors.grey[300]!,
                        ),
                      ),
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: MediaQuery.of(context).size.height * 0.70,
                          child: TabBarView(
                            children: [
                              _basicDetailsTab(scale, context),
                              _servicesTab(scale, context),
                              _doctorDetailsTab(scale, context),
                              _reviewTab(scale, context),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ) : Container(),
            ),
          ),
        ),
      ),
    );
  }

  _doctorDetailsTab(ScalingUtility scale, context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      controller: controller.scrollController,
      child: Column(
        children: [
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.separated(
              itemCount: controller.doctorList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var doctor = controller.doctorList[index];
                return Container(
                  padding: scale.getPadding(horizontal: 20, vertical: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 230,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              doctor.doctorName!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTheme.appTheme.textTheme.titleSmall!
                                  .copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: scale.getScaledFont(18),
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              doctor.specialty!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTheme.appTheme.textTheme.titleSmall!
                                  .copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: scale.getScaledFont(13),
                              ),
                            ),
                            Text(
                              '₹${doctor.cost!}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTheme.appTheme.textTheme.bodySmall!.copyWith(
                                color: Colors.green,
                                fontSize: scale.getScaledFont(13),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed(Routes.doctorAppointment);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: scale.getPadding(horizontal: 15),
                          backgroundColor: doctor.available!
                              ? ColorsUtil.blueColor
                              : ColorsUtil.greyTextColor,
                        ),
                        child: Text(
                          'Book Now',
                          style: AppTheme.appTheme.textTheme.bodyMedium!.copyWith(
                            fontSize: scale.getScaledFont(10),
                            color: ColorsUtil.brandWhite,
                          ),
                        ),
                      ),
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
        ],
      ),
    );
  }

  _basicDetailsTab(ScalingUtility scale, context) {
    return Padding(
      padding: scale.getPadding(horizontal: 10),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: controller.scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: scale.getScaledHeight(15),
            ),
            Text(
              'About This Healthcare Center',
              style: AppTheme.appTheme.textTheme.titleMedium,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              textAlign: TextAlign.justify,
              "The Apollo Hospitals, Indore is a joint venture between Apollo Hospitals Enterprises Limited (AHEL) & Rajshree Hospital & Research Centre Pvt. Ltd.\n\nIt offers high-end tertiary care across various medical disciplines, with a special focus on Cardiology & Cardiothoracic Surgery, Neurology, and Neurosurgery, Nephrology, and Urology, Orthopaedics, Gastroenterology, Emergency & Trauma. The 180 bedded hospital's strength lies in the perfect balance of excellent infrastructure, latest technology, and dedicated manpower, all orchestrated to provide patient services to the highest standards. Centres of Excellence Apollo Hospitals.\n\nIndore has established Centres of Excellence across various key specialties. The goal of each Centre of Excellence is to ensure that care of the highest possible standards is offered whilst also forging ahead in research, meeting and surpassing benchmarks set by the world's best healthcare providers, tracking and standardizing best practices, and achieving excellence in academics.",
              style: AppTheme.appTheme.textTheme.bodyMedium,
            ),
            SizedBox(
              height: scale.getScaledHeight(13),
            ),
            Text(
              'Timings',
              style: AppTheme.appTheme.textTheme.titleMedium,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.timelapse,
                  size: scale.getScaledFont(18),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Mon - Fri',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.appTheme.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: scale.getScaledFont(15),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '${DateFormat('hh : mm a').format(DateTime.now())} - ${DateFormat('hh : mm a').format(DateTime.now())}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTheme.appTheme.textTheme.bodyMedium!.copyWith(
                fontSize: scale.getScaledFont(14),
              ),
            ),
            SizedBox(
              height: scale.getScaledHeight(13),
            ),
            Text(
              'Photos',
              style: AppTheme.appTheme.textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              runSpacing: 10,
              spacing: 12,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: List.generate(
                5 > 4 ? 4 : 5,
                (index) => index == 3 && 5 > 4
                    ? Container(
                        height: scale.getScaledHeight(160),
                        width: scale.getScaledWidth(160),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ColorsUtil.darkContainerColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          '${5 - 4} +',
                          style: AppTheme.appTheme.textTheme.bodySmall!
                              .copyWith(fontSize: scale.getScaledFont(20)),
                        ),
                      )
                    : Container(
                        height: scale.getScaledHeight(160),
                        width: scale.getScaledWidth(160),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image:
                                AssetImage('assets/images/appolo_hospital.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Contact Details',
              style: AppTheme.appTheme.textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.call,
                  color: Colors.black,
                  size: scale.getScaledFont(15),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '+91 95888-76587',
                  style: AppTheme.appTheme.textTheme.bodySmall!
                      .copyWith(fontSize: scale.getScaledFont(15)),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Icon(
                  Icons.mail,
                  color: Colors.black,
                  size: scale.getScaledFont(15),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'kotharibhavik23@gmail.com',
                  style: AppTheme.appTheme.textTheme.bodySmall!
                      .copyWith(fontSize: scale.getScaledFont(15)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _medicineStockTab(ScalingUtility scale, context) {
    return Container(
      margin: scale.getMargin(horizontal: 13),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: controller.scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: scale.getMargin(vertical: 15),
              child: TextFormField(
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      size: scale.getScaledFont(30),
                    ),
                  ),
                  hintText: 'Search Here',
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                  text: 'Total Stock: ',
                  style: AppTheme.appTheme.textTheme.bodyMedium!
                      .copyWith(fontSize: scale.getScaledFont(16)),
                  children: [
                    TextSpan(
                      text: '12',
                      style: AppTheme.appTheme.textTheme.titleMedium!.copyWith(
                        color: Colors.red,
                      ),
                    ),
                  ]),
            ),
            Container(
              margin: scale.getMargin(top: 10, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: scale.getScaledWidth(40),
                    child: Text(
                      'S.No',
                      maxLines: 1,
                      style: AppTheme.appTheme.textTheme.bodyMedium!.copyWith(
                        fontSize: scale.getScaledFont(14),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: scale.getScaledWidth(90),
                    child: Text(
                      'Name',
                      style: AppTheme.appTheme.textTheme.bodyMedium!.copyWith(
                        fontSize: scale.getScaledFont(14),
                      ),
                      maxLines: 1,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: scale.getScaledWidth(90),
                    child: Text(
                      'Dosage',
                      maxLines: 1,
                      style: AppTheme.appTheme.textTheme.bodyMedium!.copyWith(
                        fontSize: scale.getScaledFont(14),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: scale.getScaledWidth(100),
                    child: Text(
                      'Category',
                      maxLines: 1,
                      style: AppTheme.appTheme.textTheme.bodyMedium!.copyWith(
                        fontSize: scale.getScaledFont(14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: scale.getPadding(vertical: 5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    ColorsUtil.darkContainerColor,
                  ],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.separated(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: scale.getPadding(vertical: 10, horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: scale.getScaledWidth(40),
                            padding: scale.getPadding(horizontal: 1),
                            child: Text(
                              '${index + 1}.',
                              style: AppTheme.appTheme.textTheme.bodyMedium!
                                  .copyWith(
                                fontSize: scale.getScaledFont(14),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: scale.getScaledWidth(90),
                            padding: scale.getPadding(horizontal: 1),
                            child: Text(
                              'Nemusolite',
                              style: AppTheme.appTheme.textTheme.bodyMedium!
                                  .copyWith(
                                fontSize: scale.getScaledFont(14),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: scale.getScaledWidth(90),
                            padding: scale.getPadding(horizontal: 1),
                            child: Text(
                              '650 MG',
                              style: AppTheme.appTheme.textTheme.bodyMedium!
                                  .copyWith(
                                fontSize: scale.getScaledFont(14),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: scale.getScaledWidth(100),
                            padding: scale.getPadding(horizontal: 1),
                            child: Text(
                              'Azithromycin',
                              style: AppTheme.appTheme.textTheme.bodyMedium!
                                  .copyWith(
                                fontSize: scale.getScaledFont(14),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
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
          ],
        ),
      ),
    );
  }

  _reviewTab(ScalingUtility scale, context) {
    return Container(
      margin: scale.getPadding(horizontal: 10),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: controller.scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: scale.getScaledHeight(15),
            ),
            Row(
              children: [
                Text(
                  'Rating:  ',
                  style: AppTheme.appTheme.textTheme.titleMedium,
                ),
                Text(
                  '3.5/5 ',
                  style: AppTheme.appTheme.textTheme.bodyMedium!.copyWith(
                    fontSize: scale.getScaledFont(17),
                  ),
                ),
                RatingBar.builder(
                  initialRating: 3.5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  ignoreGestures: true,
                  itemCount: 5,
                  itemSize: scale.getScaledFont(24),
                  unratedColor: ColorsUtil.lightContainerColor,
                  itemPadding: scale.getPadding(horizontal: 2),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: ColorsUtil.darkContainerColor,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ],
            ),
            Container(
              padding: scale.getPadding(vertical: 5),
              margin: scale.getMargin(vertical: 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    ColorsUtil.darkContainerColor,
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.separated(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: scale.getPadding(horizontal: 12, vertical: 13),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: scale.getScaledFont(20),
                                backgroundImage: const AssetImage(
                                  ConstantData.googleIcon,
                                ),
                              ),
                              SizedBox(
                                width: scale.getScaledWidth(15),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: scale.getScaledWidth(250),
                                    child: Text(
                                      'Dr. K.Roshan Rao',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTheme.appTheme.textTheme.titleSmall!
                                          .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: scale.getScaledFont(18),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      Text(
                                        '3.5/5 ',
                                        style: AppTheme.appTheme.textTheme.bodyMedium,
                                      ),
                                      RatingBar.builder(
                                        initialRating: 3.5,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        ignoreGestures: true,
                                        itemCount: 5,
                                        itemSize: scale.getScaledFont(18),
                                        unratedColor: Colors.white,
                                        itemPadding: scale.getPadding(horizontal: 2),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.red,
                                        ),
                                        onRatingUpdate: (rating) {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "The Apollo Hospitals, Indore is a joint venture between Apollo Hospitals Enterprises Limited (AHEL) & Rajshree Hospital & Research Centre Pvt. Ltd.\n\nIt offers high-end tertiary care across various medical disciplines, with a special focus on Cardiology & Cardiothoracic Surgery, Neurology, and Neurosurgery, Nephrology, and Urology, Orthopaedics, Gastroenterology, Emergency & Trauma.",
                            textAlign: TextAlign.justify,
                            style: AppTheme.appTheme.textTheme.titleSmall!
                                .copyWith(
                              fontWeight: FontWeight.w300,
                              fontSize: scale.getScaledFont(13),
                            ),
                          ),

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
          ],
        ),
      ),
    );
  }

  _servicesTab(ScalingUtility scale, context) {
    return Container(
      margin: scale.getMargin(horizontal: 15),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: controller.scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: scale.getMargin(vertical: 15),
              child: Text(
                'Services We Offer',
                style: AppTheme.appTheme.textTheme.titleMedium,
              ),
            ),
            Container(
              padding: scale.getPadding(vertical: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    ColorsUtil.darkContainerColor,
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.separated(
                  itemCount: 10,
                  shrinkWrap: true,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index){
                    return Padding(
                      padding: scale.getPadding(vertical: 8),
                      child: Row(
                        children: [
                          SizedBox(
                            width: scale.getScaledWidth(15),
                          ),
                          Container(
                            height: scale.getScaledHeight(7),
                            width: scale.getScaledWidth(7),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.pinkAccent,
                            ),
                          ),
                          SizedBox(
                            width: scale.getScaledWidth(20),
                          ),
                          SizedBox(
                            width: scale.getScaledWidth(270),
                            child: Text(
                              'Aortic Anuerysm Surgery / Endovascular Repair',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: AppTheme.appTheme.textTheme.bodyMedium,
                            ),
                          ),
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
              )
            ),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}