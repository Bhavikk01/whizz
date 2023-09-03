import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:whizz/app/API/api_client.dart';
import 'package:whizz/app/models/user_model.dart';
import '../routes/app_pages.dart';
import '../utils/custom_bottom_snackbar.dart';
import '../utils/loading_overlay.dart';
import 'user.dart';

class AuthServices extends GetxController {
  static AuthServices get to => Get.find();
  // FirebaseAuth auth = FirebaseAuth.instance;
  String otp = '';
  int? resendToken;

  verifyPhoneNumber(String phoneNumber) async {
    if(await checkUserByPhone(phoneNumber) != null){
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91$phoneNumber',
        verificationCompleted: (PhoneAuthCredential credential) async {
          otp = credential.smsCode!;
        },
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? forceResendingToken) {
          resendToken = forceResendingToken;
        },
        forceResendingToken: resendToken,
        codeAutoRetrievalTimeout: (String verificationId) {},
        timeout: const Duration(seconds: 60),
      );
      LoadingOverlay.hideOverlay();
    }else{
      LoadingOverlay.hideOverlay();
      customSnackBar(
        type: AnimatedSnackBarType.error,
        message: 'No user exist with this number',
      );
    }
  }

  registerPhoneNumber(String phoneNumber) async {
    if(await checkUserByPhone(phoneNumber) == null){
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91$phoneNumber',
        verificationCompleted: (PhoneAuthCredential credential) async {
          otp = credential.smsCode!;
        },
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? forceResendingToken) {
          resendToken = forceResendingToken;
        },
        forceResendingToken: resendToken,
        codeAutoRetrievalTimeout: (String verificationId) {},
        timeout: const Duration(seconds: 60),
      );
    }else{
      customSnackBar(
        type: AnimatedSnackBarType.error,
        message: 'This number is already linked with other user',
      );
    }
  }

  verifyOtp(String phoneNumber, String otp) async {
    try {
      LoadingOverlay.showOverlay();
      if(this.otp == otp){
        UserModel? user = await checkUserByPhone(phoneNumber);
        if(user != null){
          await handleSignInByEmail(user.email!, user.password!);
        }else{
          LoadingOverlay.hideOverlay();
          customSnackBar(
            type: AnimatedSnackBarType.error,
            message: 'NO user exist with this phone number',
          );
        }
      }
    } catch (err) {
      LoadingOverlay.hideOverlay();
      customSnackBar(
        type: AnimatedSnackBarType.error,
        message: '$err',
      );
    }
  }

  verifyRegistrationOtp(String phoneNumber, String otp, UserModel user) async {
    try {
      if(this.otp == otp){
        await handleSignUp(user);
      }
    } catch (err) {
      customSnackBar(
        type: AnimatedSnackBarType.error,
        message: '$err',
      );
    }
  }

  Future<UserModel?> checkUserByPhone(String phoneNumber) async {
    try{
      Response res = await ApiClient.to.checkUserByPhone(phoneNumber);
      if (res.statusCode == 200) {
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
            UserModel user = UserModel.fromJson(res.body['data']);
            await UserStore.to.saveProfile(user.id!);
            LoadingOverlay.hideOverlay();
            Get.offAllNamed(Routes.home);
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
        return false;
      }
    } catch (err) {
      LoadingOverlay.hideOverlay();
      customSnackBar(
        type: AnimatedSnackBarType.error,
        message: '$err',
      );
      return false;
    }
  }

  handleSignUp(UserModel user) async {
    var value = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: user.email!, password: user.password!);
    if (value.user != null) {
      await ApiClient.to.addUserData(
        user.toJson(),
        onSuccess: (res) async {
          await UserStore.to.saveProfile(user.id!);
          Get.offAllNamed(Routes.home);
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

}
