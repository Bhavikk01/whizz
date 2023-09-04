import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoadingOverlay {

  static showOverlay() {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      traversalEdgeBehavior: TraversalEdgeBehavior.leaveFlutterView,
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: Material(
          type: MaterialType.transparency,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Lottie.asset(
              'assets/icons/loading_icon.json',
              height: 120,
              width: 120,
              repeat: true
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