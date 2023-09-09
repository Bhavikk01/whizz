import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:whizz/app/services/auth_services.dart';
import 'package:whizz/app/utils/app_theme.dart';

import 'app/API/api_client.dart';
import 'app/routes/app_pages.dart';
import 'app/services/storage.dart';
import 'app/services/user.dart';
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
    return GetMaterialApp(
      theme: AppTheme.appTheme,
      title: "Application",
      initialRoute: UserStore.to.uid.isNotEmpty
          ? Routes.home
          : Routes.loginWithEmail,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
