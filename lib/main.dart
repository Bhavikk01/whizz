import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:whizz/app/services/auth_services.dart';

import 'app/API/api_client.dart';
import 'app/routes/app_pages.dart';
import 'app/services/storage.dart';
import 'app/services/user.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await Get.putAsync<StorageService>(() => StorageService().init());
  Get.put(ApiClient());
  Get.put(AuthServices());
  Get.put(UserStore());
  runApp(const MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
