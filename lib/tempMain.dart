import 'package:Whizz/app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'app/screens/dashboard/disease_prediction_screens/disease_prediction_screen.dart';
class TempApp extends StatelessWidget {
  const TempApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     theme: AppTheme.appTheme,
     home:DiseasePredictionScreen(),
    );
  }
}
