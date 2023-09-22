import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';

class LoadingOverlay {

  static showOverlay() {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      traversalEdgeBehavior: TraversalEdgeBehavior.leaveFlutterView,
      builder: (context) => WillPopScope(
        onWillPop: () async => true,
        child: Material(
          type: MaterialType.transparency,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image.asset(
              ConstantData.appLoading,
              height: 200,
              width: 200,
            ),
          ),
        ),
      ),
    );
  }

  static hideOverlay() {
    Future.delayed(const Duration(milliseconds: 500), () {
      Get.back();
    });
  }
}