import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConstantData {
  static Map<String, List> stateMap = {};
  static Map<String, List> cityMap = {};
  static Map<String, String> countryMap = {};

  // List<String> countries = [];
  loadData(context) async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/countries_data.json");
    List jsonResult = jsonDecode(data);
    for(var data in jsonResult){
      if(data['states'].isNotEmpty){
        countryMap[data['name']] = data['iso3'];
        stateMap[countryMap.keys.last] = data['states'];
        for(var state in stateMap[countryMap.keys.last]!){
          cityMap[state['name']] = state['cities'];
        }
      }
    }
    log('This is the state map: $stateMap');
    log('This is the city map: $cityMap');
    log('This is the country map: $countryMap');
  }

  /* Icons Asset */

  ///Bottom Navigation Icon

  static const homeIcon = 'assets/icons/home_icon.svg';
  static const appointmentIcon = 'assets/icons/appointment_icon.svg';
  static const searchIcon = 'assets/icons/search_icon.svg';
  static const profileIcon = 'assets/icons/profile_icon.svg';

  static const appLogo = 'assets/images/app_logo.png';
  static const backArrow = 'assets/icons/back_icon.png';
  static const filterIcon = 'assets/icons/filter_icon.png';
  static const googleIcon = 'assets/images/google_icon.png';
  static const userAvatar = 'assets/images/user_avatar.png';
  static const menuIcon = 'assets/icons/menu_icon.png';
  static const navigationIcon = 'assets/icons/navigation_icon.png';

  static const appSplash = 'assets/icons/whizz.gif';
  static const loadingIcon = 'assets/icons/loading_icon.gif';


  /* String Constants */
  static const appName = 'Whizz';
  static const continueText = 'Continue';
  static const signUpText = 'Sign Up';
  static const signInText = 'Sign In';
  static const loginInText = 'Login';
  static const userProfileText = 'User Profile';
  static const viewReminderText = 'View Reminder';
  static const setNewReminderText = 'Set new Reminder';
  static const verifyOtpText = 'Please verify your OTP';
  static const searchHealthcareText = 'Search Healthcare';

}
