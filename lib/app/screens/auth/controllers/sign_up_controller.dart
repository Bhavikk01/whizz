
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SignUpController extends GetxController {
  late RxString dob;



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    dob = "".obs;
  }

  void dobOnTap()async{

    DateTime? pickedDate = await showDatePicker(context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),);
    if(pickedDate!=null)
    {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
    }
  }

}
