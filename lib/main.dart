import 'package:Whizz/app/screens/health_care/doctor_panel/controller/doctor_panel_controller.dart';
import 'package:Whizz/app/screens/home/controllers/home_controller.dart';
import 'package:Whizz/app/screens/home/home_screen.dart';

// import 'package:Whizz/app/screens/medical_records/controllers/medical_report_controller.dart';
// import 'package:Whizz/app/screens/medical_records/medical_report_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:Whizz/app/services/auth_services.dart';
import 'package:Whizz/app/utils/app_theme.dart';
import 'package:Whizz/app/utils/colors.dart';
import 'package:Whizz/app/utils/constants.dart';

import 'app/API/api_client.dart';
import 'app/global_controllers/bottom_nav_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/screens/dashboard/dashboard_screen.dart';
import 'app/screens/health_care/doctor_panel/doctor_panel_screen.dart';
import 'app/screens/health_care/search_healthcare/controller/search_healthcare_controller.dart';
import 'app/screens/health_care/search_healthcare/search_healthcare_screen.dart';
import 'app/services/storage.dart';
import 'app/services/user.dart';
import 'app/utils/scale_utility.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await Get.putAsync<StorageService>(() => StorageService().init());
  // Get.put<ApiClient>(ApiClient());
  // Get.put<UserStore>(UserStore());
  // Get.put<AuthServices>(AuthServices());
  Get.put(BottomNavBarController());
  Get.put(DoctorScreenController());
  Get.put(HomeController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConstantData().loadData(context);
    return GetMaterialApp(
      theme: AppTheme.appTheme,
      title: "Application",
      home: DoctorScreen(),
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 7), () {
      Get.offAllNamed(
          UserStore.to.uid.isNotEmpty ? Routes.home : Routes.loginWithEmail);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: Get.context!)
      ..setCurrentDeviceSize();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: scale.fh,
        width: scale.fw,
        decoration: BoxDecoration(
          color: ColorsUtil.brandColor,
          image: const DecorationImage(
              image: AssetImage(
                ConstantData.backgroundImage,
              ),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Image.asset(
            ConstantData.appSplash,
          ),
        ),
      ),
    );
  }
}
