import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:whizz/app/services/auth_services.dart';
import 'package:whizz/app/utils/app_theme.dart';
import 'package:whizz/app/utils/constants.dart';

import 'app/API/api_client.dart';
import 'app/routes/app_pages.dart';
import 'app/screens/healthcare_center_detail_screen/healthcare_center_detail_screen.dart';
import 'app/services/storage.dart';
import 'app/services/user.dart';
import 'app/utils/scale_utility.dart';
import 'firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Get.putAsync<StorageService>(() => StorageService().init());
  Get.put<ApiClient>(ApiClient());
  Get.put<UserStore>(UserStore());
  Get.put<AuthServices>(AuthServices());
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
      home: const SplashScreen(),
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
    Future.delayed(const Duration(seconds: 5), () {
      Get.offAllNamed(UserStore.to.uid.isNotEmpty
          ? Routes.home
          : Routes.healthCenterScreen
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: Get.context!)..setCurrentDeviceSize();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 350,
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage(
                ConstantData.appSplash,
              ),
              fit: BoxFit.cover
            )
          ),
        ),
      ),
    );
  }
}

