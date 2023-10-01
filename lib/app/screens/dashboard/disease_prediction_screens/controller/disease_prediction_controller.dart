import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DiseasePredictionController extends GetxController {
  TextEditingController controller = TextEditingController();

  List<String>predictedDiseaseList =["A","ABC","QQ","OPLA"];

  // List<String> selectedList = [];
  RxList<String> selectedList=[''].obs;

  /*
  * TODO
  *  CALL ASK API WHEN USER HAS SELECTED THE BUBBLE
  *
  *
  *
  *
  * */
}