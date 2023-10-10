import 'dart:developer';

import 'package:Whizz/app/screens/health_care/appointment/controller/appointment_controller.dart';
import 'package:Whizz/app/utils/colors.dart';
import 'package:Whizz/app/utils/custom_bottom_snackbar.dart';
import 'package:Whizz/app/utils/loading_overlay.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../utils/constants.dart';
import '../../../utils/scale_utility.dart';

class AppointmentScreen extends GetView<AppointmentController> {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();
    return Scaffold(
      backgroundColor: ColorsUtil.brandColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            collapsedHeight: scale.getScaledHeight(80),
            expandedHeight: scale.getScaledHeight(150),
            backgroundColor: Colors.transparent,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(
                        ConstantData.backgroundTile,
                      ),
                      fit: BoxFit.cover,
                    ),
                    color: ColorsUtil.brandColor,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: scale.getScaledWidth(40),
                      ),
                      CircleAvatar(
                        backgroundImage: const NetworkImage(
                          "https://www.aucmed.edu/sites/g/files/krcnkv361/files/styles/atge_3_2_crop_md/public/2021-11/large-Smile-Guy-web.jpg?h=6b55786a&itok=Wy7cQpYS",
                        ),
                        maxRadius: scale.getScaledFont(50),
                      ),
                      SizedBox(
                        width: scale.getScaledWidth(20),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dr. Jane Doe',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: scale.getScaledFont(22),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'General doctor',
                            style: TextStyle(
                              color: const Color(0xFFD1D1D6),
                              fontSize: scale.getScaledFont(12),
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                            ),
                          ),
                          Text(
                            '\$1000',
                            style: TextStyle(
                              color: const Color(0xFF01B001),
                              fontSize: scale.getScaledFont(12),
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              padding: scale.getPadding(horizontal: 15, vertical: 10),
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: scale.getScaledHeight(20),
                  ),
                  Text(
                    'Choose Date',
                    style: TextStyle(
                      color: const Color(0xFFD1D1D6),
                      fontSize: scale.getScaledFont(16),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(300),
                    child: SfDateRangePicker(
                      view: DateRangePickerView.month,
                      selectionMode: DateRangePickerSelectionMode.single,
                      todayHighlightColor: const Color(0xff041c50),
                      selectionShape: DateRangePickerSelectionShape.circle,
                      monthCellStyle: DateRangePickerMonthCellStyle(
                        cellDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        todayTextStyle: TextStyle(
                          color: Colors.black,
                          fontSize: scale.getScaledFont(15),
                        ),
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: scale.getScaledFont(15),
                        ),
                        todayCellDecoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xff041c50),
                          ),
                        ),
                      ),
                      showActionButtons: false,
                      enablePastDates: false,
                      selectionTextStyle: const TextStyle(color: Colors.white),
                      selectionColor: ColorsUtil.brandColor,
                      onSelectionChanged: (DateRangePickerSelectionChangedArgs selection){
                        log(selection.value.toString());
                      },
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),
                  Text(
                    'Choose Time',
                    style: TextStyle(
                      color: const Color(0xFFD1D1D6),
                      fontSize: scale.getScaledFont(16),
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(20),
                  ),
                  Center(
                    child: Obx(
                      () => Wrap(
                        direction: Axis.horizontal,
                        spacing: 20,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        alignment: WrapAlignment.center,
                        runSpacing: 20,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.selectedTime.value = 0;
                            },
                            child: Container(
                              width: scale.getScaledWidth(80),
                              height: scale.getScaledHeight(26),
                              decoration: ShapeDecoration(
                                color: controller.selectedTime.value == 0 ? ColorsUtil.brandColor: null ,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    width: 0.50,
                                    color: Color(0xFFD1D1D6),
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "3.00 pm",
                                  style: TextStyle(
                                    color: controller.selectedTime.value == 0 ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.selectedTime.value = 1;
                            },
                            child: Container(
                              width: scale.getScaledWidth(80),
                              height: scale.getScaledHeight(26),
                              decoration: ShapeDecoration(
                                color: controller.selectedTime.value == 1 ? ColorsUtil.brandColor: null ,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    width: 0.50,
                                    color: Color(0xFFD1D1D6),
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "3:30 pm",
                                  style: TextStyle(
                                    color: controller.selectedTime.value == 1 ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.selectedTime.value = 2;
                            },
                            child: Container(
                              width: scale.getScaledWidth(80),
                              height: scale.getScaledHeight(26),
                              decoration: ShapeDecoration(
                                color: controller.selectedTime.value == 2 ? ColorsUtil.brandColor: null ,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 0.50, color: Color(0xFFD1D1D6)),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "4:00 pm",
                                  style: TextStyle(
                                    color: controller.selectedTime.value == 2 ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.selectedTime.value = 3;
                            },
                            child: Container(
                              width: scale.getScaledWidth(80),
                              height: scale.getScaledHeight(26),
                              decoration: ShapeDecoration(
                                color: controller.selectedTime.value == 3 ? ColorsUtil.brandColor: null ,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    width: 0.50,
                                    color: Color(0xFFD1D1D6),
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "4:30 pm",
                                  style: TextStyle(
                                    color: controller.selectedTime.value == 3 ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.selectedTime.value = 4;
                            },
                            child: Container(
                              width: scale.getScaledWidth(80),
                              height: scale.getScaledHeight(26),
                              decoration: ShapeDecoration(
                                color: controller.selectedTime.value == 4 ? ColorsUtil.brandColor: null ,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    width: 0.50,
                                    color: Color(0xFFD1D1D6),
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "5:00 pm",
                                  style: TextStyle(
                                    color: controller.selectedTime.value == 4 ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.selectedTime.value = 5;
                            },
                            child: Container(
                              width: scale.getScaledWidth(80),
                              height: scale.getScaledHeight(26),
                              decoration: ShapeDecoration(
                                color: controller.selectedTime.value == 5 ? ColorsUtil.brandColor: null ,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    width: 0.50, color: Color(0xFFD1D1D6),
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "5:30 pm",
                                  style: TextStyle(
                                    color: controller.selectedTime.value == 5 ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: scale.getScaledWidth(110),
                        height: scale.getScaledHeight(43),
                        child: ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF7F5F5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: scale.getScaledHeight(20),
                      ),
                      SizedBox(
                        width: scale.getScaledWidth(110),
                        height: scale.getScaledHeight(43),
                        child: ElevatedButton(
                          onPressed: () {
                            LoadingOverlay.showOverlay();
                            Future.delayed(const Duration(seconds: 3), () {
                              LoadingOverlay.hideOverlay();
                              Get.back();
                              customSnackBar(
                                  type: AnimatedSnackBarType.success,
                                  message: 'Appointment Booked successfully'
                              );
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF6B6B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            "Book",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
