import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HealthcareController extends GetxController {

  RxBool showCollapsedHeader = false.obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {

    });
  }

}