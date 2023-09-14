import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

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
              ConstantData.loadingIcon,
              height: 180,
              width: 180,
            ),
          ),
        ),
      ),
    );
  }

  static hideOverlay() {
    Get.back();
  }
}