import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class HomeController extends GetxController {
  // var isExpanded
  late DraggableScrollableController draggableScrollableController ;
  late GoogleMapController controller;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    draggableScrollableController = DraggableScrollableController();

  }

}
