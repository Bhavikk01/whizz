import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:whizz/app/API/api_client.dart';
import 'package:whizz/app/models/user_model.dart';
import '../routes/app_pages.dart';
import '../utils/custom_bottom_snackbar.dart';
import '../utils/loading_overlay.dart';
import 'user.dart';

class AuthServices extends GetxController {
  static AuthServices get to => Get.find();
  String otp = '';
  String verificationId = '';
  int? resendToken;

  Future<bool> registerPhoneNumber(String phoneNumber) async {
    try{
      if (await checkUserByPhone(phoneNumber) == null) {
        log('Here is the function');
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '+91$phoneNumber',
          verificationCompleted: (PhoneAuthCredential credential) async {},
          verificationFailed: (FirebaseAuthException e) {},
          codeSent: (String verificationId, int? forceResendingToken) {
            resendToken = forceResendingToken;
            this.verificationId = verificationId;
          },
          forceResendingToken: resendToken,
          codeAutoRetrievalTimeout: (String verificationId) {},
          timeout: const Duration(seconds: 60),
        );
        return true;
      } else {
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: 'This number is already linked with other user',
        );
        return false;
      }
    }catch(err){
      customSnackBar(
        type: AnimatedSnackBarType.error,
        message: 'This number is already linked with other user',
      );
      return false;
    }
  }

  verifyRegistrationOtp(String phoneNumber, String otp, UserModel user) async {
    try {
      LoadingOverlay.showOverlay();
      final credential = PhoneAuthProvider.credential(
        smsCode: otp,
        verificationId: verificationId,
      );
      final value = await FirebaseAuth.instance.signInWithCredential(credential);
      if(value.user != null){
        await handleSignUp(user);
      }else{
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: 'Please enter the correct OTP',
        );
        LoadingOverlay.hideOverlay();
      }
    } catch (err) {
      log('Here I am');
      LoadingOverlay.hideOverlay();
      customSnackBar(
        type: AnimatedSnackBarType.error,
        message: '$err',
      );
    }
  }

  Future<UserModel?> checkUserByPhone(String phoneNumber) async {
    try{
      Response res = await ApiClient.to.checkUserByPhone(phoneNumber);
      if (res.body['status']) {
        UserModel userModel = UserModel.fromJson(res.body['data']);
        return userModel;
      } else {
        return null;
      }
    }catch(err){
      return null;
    }
  }

  handleSignInByEmail(String email, String password) async {
    try {
      LoadingOverlay.showOverlay();
      var value = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      if (value.user != null) {
        await ApiClient.to.getUserById(
          value.user!.uid,
          onSuccess: (res) async {
            if(res.body['status']){
              UserModel user = UserModel.fromJson(res.body['data']);
              await UserStore.to.saveProfile(user.id!);
              LoadingOverlay.hideOverlay();
              Get.offAllNamed(Routes.home);
            }else{
              LoadingOverlay.hideOverlay();
              customSnackBar(
                type: AnimatedSnackBarType.info,
                message: 'No user found with this credentials please register yourself',
              );
            }
          },
          onError: (err){
            LoadingOverlay.hideOverlay();
            customSnackBar(
              type: AnimatedSnackBarType.error,
              message: '${err.body['error']}',
            );
          }
        );
      } else {
        LoadingOverlay.hideOverlay();
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: 'User does not exist with this credentials',
        );
      }
    } catch (err) {
      LoadingOverlay.hideOverlay();
      customSnackBar(
        type: AnimatedSnackBarType.error,
        message: '$err',
      );
    }
  }

  handleSignUp(UserModel user) async {
    try{
      var emailCredential = EmailAuthProvider.credential(email: user.email!, password: user.password!);
      var value = await FirebaseAuth.instance.currentUser!.linkWithCredential(emailCredential);
      if (value.user != null) {
        await ApiClient.to.addUserData(user.copyWith(id: value.user!.uid).toJson(), onSuccess: (res) async {
          if (res.body['status']) {
            await UserStore.to.saveProfile(value.user!.uid);
            LoadingOverlay.hideOverlay();
            Get.offAllNamed(Routes.signUpDetails);
          } else {
            await FirebaseAuth.instance.currentUser!.delete();
            LoadingOverlay.hideOverlay();
            customSnackBar(
              type: AnimatedSnackBarType.warning,
              message: '${res.body['message']}',
            );
          }
        }, onError: (err) async {
          await FirebaseAuth.instance.currentUser!.delete();
          LoadingOverlay.hideOverlay();
          customSnackBar(
            type: AnimatedSnackBarType.error,
            message: '${err.body['error']}',
          );
        });
      }
    }catch(err){
      LoadingOverlay.hideOverlay();
      customSnackBar(
        type: AnimatedSnackBarType.error,
        message: '$err',
      );
    }
  }

  uploadUserData(UserModel user) async {
    await ApiClient.to.addUserData(
        user.toJson(),
        onSuccess: (res) async {
          if(res.body['status']){
            await UserStore.to.saveProfile(user.id!);
            Get.offAllNamed(Routes.home);
          }else{
            await FirebaseAuth.instance.currentUser!.delete();
            customSnackBar(
              type: AnimatedSnackBarType.warning,
              message: '${res.body['message']}',
            );
          }
        },
        onError: (err) {
          customSnackBar(
            type: AnimatedSnackBarType.error,
            message: '${err.body['error']}',
          );
        }
    );
  }
}
