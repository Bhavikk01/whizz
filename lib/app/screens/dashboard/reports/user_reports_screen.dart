import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:Whizz/app/utils/colors.dart';
import 'package:Whizz/app/utils/constants.dart';
import 'package:Whizz/app/widgets/upload_button.dart';
import 'package:pdf_thumbnail/pdf_thumbnail.dart';
import 'package:pdfx/pdfx.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/custom_bottom_snackbar.dart';
import '../../../utils/scale_utility.dart';
import 'controller/user_reports_controller.dart';
import 'widgets/report_tile.dart';

class UserReportsScreen extends GetView<UserReportsController> {
  const UserReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              elevation: 0,
              collapsedHeight: scale.getScaledHeight(80),
              expandedHeight: scale.getScaledHeight(150),
              backgroundColor: Colors.white,
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
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Medical Reports",
                          style:
                              AppTheme.appTheme.textTheme.titleLarge!.copyWith(
                            fontSize: scale.getScaledFont(25),
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: scale.getScaledHeight(40),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Obx(
              () => SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: controller.userReports.length,
                  (context, index) {
                    return ReportTile(report: controller.userReports[index]);
                  },
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: UploadButton(
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            isDismissible: false,
            enableDrag: true,
            useSafeArea: true,
            useRootNavigator: true,
            showDragHandle: true,
            constraints: const BoxConstraints(
              maxHeight: double.infinity,
            ),
            backgroundColor: Colors.transparent,
            barrierColor: ColorsUtil.brandColor.withOpacity(0.5),
            context: context,
            builder: (context) {
              return ReportBottomSheet();
            },
          );
        },
      ),
    );
  }
}

class ReportBottomSheet extends StatelessWidget {
  ReportBottomSheet({Key? key}) : super(key: key);

  final controller = Get.find<UserReportsController>();

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();
    return Container(
      padding: const EdgeInsets.only(top: 10),
      decoration: ShapeDecoration(
        color: ColorsUtil.brandWhite,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              leading: IconButton(
                onPressed: () {
                  controller.filePath.value = "";
                  controller.reportTypeController.text = "";
                  controller.locationController.text = "";
                  Get.back();
                },
                icon: const Icon(Icons.close),
              ),
              iconTheme: IconThemeData(color: ColorsUtil.brandColor),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: const Text(
                "Upload Record",
                style: TextStyle(color: Colors.black),
              ),
              titleTextStyle: TextStyle(
                color: ColorsUtil.brandColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: scale.getScaledHeight(30),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(46),
                    child: TextFormField(
                      style: TextStyle(
                        fontSize: scale.getScaledFont(17),
                      ),
                      controller: controller.reportTypeController,
                      decoration: const InputDecoration(
                        hintText: "Report Type",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(20),
                  ),
                  TextFormField(
                  controller: controller.locationController,
                    decoration: const InputDecoration(
                      hintText: "Center Location",
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(30),
                  ),
                  GestureDetector(
                    onTap: () async {
                      FilePickerResult? result = await FilePicker.platform.pickFiles();
                      if (result != null) {
                        File file = File(result.files.single.path!);
                        controller.selectedFile = result.files.single;
                        controller.filePath.value = file.path;
                      } else {
                        customSnackBar(
                          type: AnimatedSnackBarType.info,
                          message: 'File upload failed',
                        );
                      }
                    },
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(20),
                      color: Colors.grey.shade500,
                      dashPattern: const [1, 5],
                      strokeCap: StrokeCap.square,
                      child: Obx(
                        () => Container(
                          constraints: BoxConstraints(
                            minHeight: scale.fh / 7,
                            maxHeight: controller.filePath.value.endsWith('.pdf')
                                ? scale.getScaledHeight(320)
                                : scale.getScaledHeight(220),
                          ),
                          width: double.infinity,
                          child: Obx(
                            () => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                controller.filePath.isEmpty
                                    ? SvgPicture.asset(
                                        ConstantData.uploadIcon,
                                        height: scale.getScaledHeight(40),
                                      )
                                    : controller.filePath.value.endsWith('.pdf')
                                        ? Container(
                                            padding:
                                                scale.getPadding(horizontal: 10),
                                            child: PdfThumbnail.fromFile(
                                              controller.filePath.value,
                                              currentPage: 0,
                                              height: 300,
                                              backgroundColor: Colors.transparent,
                                            ),
                                          )
                                        : Image.file(
                                            File(controller.filePath.value),
                                            height: scale.getScaledHeight(150),
                                            fit: BoxFit.cover,
                                          ),
                                SizedBox(
                                  height: scale.getScaledHeight(30),
                                ),
                                Text(
                                  controller.filePath.isEmpty
                                      ? 'Choose file from your system'
                                      : controller.selectedFile!.name,
                                  style: TextStyle(
                                    color: ColorsUtil.blueColor,
                                    fontSize: scale.getScaledFont(13),
                                    fontWeight: FontWeight.w500,
                                    height: 0.14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(40),
                  ),
                  UploadButton(
                    onTap: () async {
                      if(controller.reportTypeController.text.isEmpty){
                        customSnackBar(
                          type: AnimatedSnackBarType.warning,
                          message: 'Please provide report type',
                        );
                      }else if(controller.locationController.text.isEmpty){
                        customSnackBar(
                          type: AnimatedSnackBarType.warning,
                          message: 'Please provide report location',
                        );
                      }else if(controller.filePath.value.isEmpty){
                        customSnackBar(
                          type: AnimatedSnackBarType.warning,
                          message: 'Please select a document',
                        );
                      }else {
                        await controller.uploadReport();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
