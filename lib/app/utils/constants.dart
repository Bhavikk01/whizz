import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConstantData {
  static Map<String, List> stateMap = {};
  static Map<String, List> cityMap = {};
  List<String> countries = [];

  loadData(context) async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/countries_data.json");
    List jsonResult = jsonDecode(data);
    for(var data in jsonResult){
      if(data['states'].isNotEmpty){
        countries.add(data['name']);
        stateMap[countries.last] = data['states'];
        for(var city in stateMap[countries.last]!){
          cityMap[city['name']] = city['cities'];
        }
      }
    }
    log('This is the state map: $stateMap');
    log('This is the city map: $cityMap');
  }

  /* Icons Asset */
  static const appLogo = 'assets/images/app_logo.png';
  static const backArrow = 'assets/icons/back_icon.png';
  static const searchIcon = 'assets/icons/search_icon.png';
  static const filterIcon = 'assets/icons/filter_icon.png';
  static const googleIcon = 'assets/images/google_icon.png';
  static const navigationIcon = 'assets/icons/navigation_icon.png';

  static const appSplash = 'assets/icons/whizz.gif';
  static const loadingIcon = 'assets/icons/loading_icon.gif';


  /* String Constants */
  static const appName = 'Whizz';
  static const continueText = 'Continue';
  static const signUpText = 'Sign Up';
  static const signInText = 'Sign In';
  static const loginInText = 'Login';
  static const verifyOtpText = 'Please verify your OTP';

}
