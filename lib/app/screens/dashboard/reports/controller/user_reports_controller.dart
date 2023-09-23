import 'package:Whizz/app/models/reports_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserReportsController extends GetxController {
  PlatformFile? selectedFile;
  var filePath = "".obs;

  TextEditingController locationController = TextEditingController();
  TextEditingController reportTypeController = TextEditingController();

  RxList<ReportsModel> userReports = <ReportsModel>[].obs;

  @override
  Future<void> onInit() async {
    await loadReports();
    super.onInit();
  }

  uploadReport() async {
    userReports.add(
      ReportsModel(
        id: '',
        reportLocation: locationController.text,
        reportType: reportTypeController.text,
        time: DateTime.now(),
        url: filePath.value,
        fileName: selectedFile!.name,
      )
    );
    filePath.value = "";
    reportTypeController.text = "";
    locationController.text = "";
    Get.back();
    //TODO: Have to implement the uploading reports feature.
  }

  loadReports() async {
    //TODO: Have to implement the loading feature of reports.
  }

}