import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../API/api_client.dart';
import '../models/user_model.dart';
import '../routes/app_pages.dart';
import '../utils/custom_bottom_snackbar.dart';
import 'storage.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  final _isLogin = false.obs;
  RxList<Map<String, dynamic>> skipPills = <Map<String, dynamic>>[].obs;
  RxList<String> users = <String>[].obs;
  String uid = '';
  String userIdKey = 'userIdKey';
  final _profile = UserModel().obs;

  bool get isLogin => _isLogin.value;

  UserModel get profile => _profile.value;

  bool get hasToken => uid.isNotEmpty;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getProfile();
  }

  Future<void> getProfile() async {
    uid = StorageService.to.getString(userIdKey);
    try {
      if (uid.isNotEmpty) {
        await ApiClient.to.getUserById(
          uid,
          onSuccess: (res) async {
            _profile(UserModel.fromJson(res.body['data']));
          },
          onError: (err) {
            customSnackBar(
              type: AnimatedSnackBarType.info,
              message: err.body['error'],
            );
          },
        );
      }
      _isLogin.value = true;
    } catch (err) {
      log('This is the error: $err');
      _isLogin.value = false;
    }
  }

  Future<void> saveProfile(String profile) async {
    await StorageService.to.setString(userIdKey, profile);
    await getProfile();
    uid = profile;
  }

  Future<void> onLogout() async {
    await StorageService.to.remove(userIdKey);
    _isLogin.value = false;
    uid = '';
    Get.offAllNamed(Routes.loginWithEmail);
  }

  Future<void> switchUser(String uid) async {
    await saveProfile(uid);
  }
}
