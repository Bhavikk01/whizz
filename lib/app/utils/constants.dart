import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

class ConstantData {
  static Map<String, List> stateMap = {};
  static Map<String, List> cityMap = {};
  static Map<String, String> countryMap = {};


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

  ///App Assets
  static const appLogo = 'assets/images/app_logo.svg';
  static const appSplash = 'assets/icons/loading_icon.gif';
  static const appLoading = 'assets/icons/loading_icon.gif';
  static const backgroundTile = 'assets/images/background_tile.png';
  static const backgroundImage = 'assets/images/background_screen.png';

  ///Bottom Navigation Icons
  static const homeIcon = 'assets/icons/home_icon.svg';
  static const appointmentIcon = 'assets/icons/appointment_icon.svg';
  static const searchIcon = 'assets/icons/search_icon.svg';
  static const profileIcon = 'assets/icons/profile_icon.svg';

  ///Other Icons
  static const filterIcon = 'assets/icons/filter_svg.svg';
  static const locationIcon = 'assets/icons/location.svg';
  static const timeIcon = 'assets/icons/time_svg.svg';
  static const hospitalIcon = 'assets/icons/hospital_svg.svg';
  static const backArrow = 'assets/icons/back_icon.svg';
  static const googleIcon = 'assets/images/google_icon.png';
  static const userAvatar = 'assets/images/user_avatar.png';
  static const menuIcon = 'assets/icons/menu_icon.png';
  static const navigationIcon = 'assets/icons/navigation_icon.svg';
  static const fileIcon = 'assets/icons/file.svg';
  static const shareCircle = 'assets/icons/sharecircle.svg';
  static const uploadIcon = 'assets/icons/cloud_upload.svg';
  static const pillIcon = 'assets/icons/pillIcon.svg';
  static const addIcon = 'assets/icons/plusIcon.svg';

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
