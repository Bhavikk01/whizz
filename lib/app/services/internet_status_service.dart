import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../utils/custom_bottom_snackbar.dart';

class InternetService {

  Future<bool> checkInternetSourceStatus() async {
    try{
      var connection = await Connectivity().checkConnectivity();
      if(connection == ConnectivityResult.none){
        customSnackBar(
          message: 'No Internet connection',
          type: AnimatedSnackBarType.warning,
        );
        return false;
      }else{
        return true;
      }
    }catch(err){
      return false;
    }
  }

  Future<bool> checkInternetStatus() async {
    Connectivity().onConnectivityChanged.listen((event) async {
      try{
        await InternetConnectionChecker().hasConnection.then((value) {
          return value;
        });
      }catch(err){
        log('Internet status: $err');
      }
    });
    return false;
  }
}