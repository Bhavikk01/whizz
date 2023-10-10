import 'package:Whizz/app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'app/screens/dashboard/disease_prediction_screens/disease_prediction_screen.dart';
import 'app/screens/dashboard/disease_report_screen/disease_report_screen.dart';
class TempApp extends StatelessWidget {
  const TempApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.appTheme,
      title: "Application",
      home: DiseaseReportScreen(),
      // getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
