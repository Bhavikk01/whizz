import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:whizz/app/API/api_client.dart';
import 'package:whizz/app/models/user_model.dart';
import '../routes/app_pages.dart';
import 'user.dart';

class AuthServices extends GetxController {
  static AuthServices get to => Get.find();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  String otp = '';
  int? resendToken;

  verifyPhoneNumber(String phoneNumber) async {
    if(await checkUserByPhone(phoneNumber) != null){
      await auth.verifyPhoneNumber(
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

    }
  }

  registerPhoneNumber(String phoneNumber) async {
    if(await checkUserByPhone(phoneNumber) == null){
      await auth.verifyPhoneNumber(
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
      Get.snackbar(
        'Auth',
        'This number is already linked with other user',
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      );
    }
  }

  verifyOtp(String phoneNumber, String otp) async {
    try {
      if(this.otp == otp){
        UserModel? user = await checkUserByPhone(phoneNumber);
        if(user != null){
          await handleSignInByEmail(user.email!, user.password!);
        }else{
          Get.snackbar(
            'Auth',
            'NO user exist with this phone number',
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          );
        }
      }
    } catch (err) {
      Get.snackbar(
        'Auth',
        '$err',
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      );
    }
  }

  verifyRegistrationOtp(String phoneNumber, String otp, UserModel user) async {
    try {
      if(this.otp == otp){
        await handleSignUp(user);
      }
    } catch (err) {
      Get.snackbar(
        'Auth',
        '$err',
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
      Get.snackbar(
        'Auth',
        '$err',
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
      );
      return null;
    }
  }

  handleSignInByEmail(String email, String password) async {
    try {
      var value = await auth.signInWithEmailAndPassword(email: email, password: password);
      if (value.user != null) {
        await ApiClient.to.getUserById(
          value.user!.uid,
          onSuccess: (res) async {
            UserModel user = UserModel.fromJson(res.body['data']);
            await UserStore.to.saveProfile(user.id!);
            Get.offAllNamed(Routes.home);
          },
          onError: (err){
            Get.snackbar(
              'Auth',
              '$err',
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            );
          }
        );
      } else {
        Get.snackbar(
          'Auth',
          'User does not exist with this credentials',
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        );
        return false;
      }
    } catch (err) {
      Get.snackbar(
        'Auth',
        '$err',
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      );
      return false;
    }
  }

  handleSignUp(UserModel user) async {
    var value = await auth.createUserWithEmailAndPassword(email: user.email!, password: user.password!);
    if (value.user != null) {
      await ApiClient.to.addUserData(
        user.toJson(),
        onSuccess: (res) async {
          await UserStore.to.saveProfile(user.id!);
          Get.offAllNamed(Routes.home);
        },
        onError: (err) {
          Get.snackbar(
            'Auth',
            '$err',
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          );
        }
      );
    }
  }

}
