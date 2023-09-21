import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whizz/app/API/api_routes.dart';
import 'package:whizz/app/models/enum/searchByAddress.dart';
import 'package:whizz/app/services/user.dart';

import '../models/user_model.dart';
import '../utils/constants.dart';

class ApiClient extends GetConnect implements GetxService {
  static ApiClient get to => Get.find();

  Future<Response> checkUserByPhone(String phoneNumber) async {
    try {
      log('--------------Calling API: ${ApiRoutes.baseUrl}user/phone/$phoneNumber ---------------');
      Response res = await httpClient.get(
        '${ApiRoutes.baseUrl}user/phone/$phoneNumber',
      );
      log('--------------Data Received---------------');
      log(res.body.toString());
      log('----------Finishing API Call------------');
      if (validateResponse(res)) {
        return res;
      } else {
        return Response(
          statusCode: res.statusCode,
          body: {'status': false, 'error': 'Unhealthy Response'},
        );
      }
    } catch (err) {
      Get.snackbar(
        'Auth',
        '$err',
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      );
      return Response(statusCode: 404, body: {'status': false, 'error': '$err'});
    }
  }

  getUserById(String id,
      {required Function(Response res) onSuccess,
      required Function(Response error) onError}) async {
    try {
      log('--------------Calling API: ${ApiRoutes.baseUrl}user/$id ---------------');
      log('--------------Data Sending---------------');
      log(id);
      Response res = await httpClient.get(
        '${ApiRoutes.baseUrl}user/$id',
      );
      log('--------------Data Received---------------');
      log(res.body.toString());
      log('----------Finishing API Call------------');
      if (validateResponse(res)) {
        onSuccess(res);
      } else {
        onError(
          Response(
            statusCode: res.statusCode,
            body: {'error': 'Unhealthy Response'},
          ),
        );
      }
    } catch (err) {
      onError(
        Response(
          statusCode: 404,
          body: {'error': '$err'},
        ),
      );
    }
  }

  bool validateResponse(Response res) {
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  addUserData(Map<String, dynamic> user,
      {required Function(Response res) onSuccess,
      required Function(Response error) onError}) async {
    try {
      log('--------------Calling API: ${ApiRoutes.baseUrl}user/create ---------------');
      log('--------------Data Sending---------------');
      log(user.toString());
      Response res = await httpClient.post(
        '${ApiRoutes.baseUrl}user/create',
        body: user,
      );
      log('--------------Data Received---------------');
      log(res.body.toString());
      log('----------Finishing API Call------------');
      if (validateResponse(res)) {
        onSuccess(res);
      } else {
        onError(
          Response(
            statusCode: res.statusCode,
            body: {'error': 'Unhealthy Response'},
          ),
        );
      }
    } catch (err) {
      onError(
        Response(
          statusCode: 404,
          body: {'error': '$err'},
        ),
      );
    }
  }

  getNearByHealthcare(SearchByAddress searchMode,
      {required Function(Response res) onSuccess,
      required Function(Response error) onError,
      required UserAddress userAddress}) async {
    try{
      if (searchMode == SearchByAddress.city) {
        var countryCode = ConstantData.countryMap[userAddress.country];
        var cityCode = ConstantData.cityMap[userAddress.state]!.firstWhere((element) => element['name'] == userAddress.city);
        var stateCode = ConstantData.stateMap[userAddress.country]!.firstWhere((element) => element['name'] == userAddress.state);
        log('--------------Calling API: ${ApiRoutes.baseUrl}nearbyHealthcare?country=$countryCode&state=${stateCode['state_code']}&city=${cityCode['id']} ---------------');
        Response res = await httpClient.get(
          '${ApiRoutes.baseUrl}nearbyHealthcare?country=$countryCode&state=${stateCode['state_code']}&city=${cityCode['id']}',
        );
        log('--------------Data Received---------------');
        log(res.body.toString());
        log('----------Finishing API Call------------');
        if (validateResponse(res)) {
          onSuccess(res);
        } else {
          onError(
            Response(
              statusCode: res.statusCode,
              body: {'error': 'Unhealthy Response'},
            ),
          );
        }
      } else if (searchMode == SearchByAddress.state) {
        var countryCode = ConstantData.countryMap[userAddress.country];
        var stateCode = ConstantData.stateMap[userAddress.country]!.firstWhere((element) => element['name'] == userAddress.state);
        log('--------------Calling API: ${ApiRoutes.baseUrl}nearbyHealthcare?country=$countryCode&state=${stateCode['state_code']} ---------------');
        Response res = await httpClient.get(
          '${ApiRoutes.baseUrl}nearbyHealthcare?country=$countryCode&state=${stateCode['state_code']}',
        );
        log('--------------Data Received---------------');
        log(res.body.toString());
        log('----------Finishing API Call------------');
        if (validateResponse(res)) {
          onSuccess(res);
        } else {
          onError(
            Response(
              statusCode: res.statusCode,
              body: {'error': 'Unhealthy Response'},
            ),
          );
        }
      }else{
        var countryCode = ConstantData.countryMap[userAddress.country];
        log('--------------Calling API: ${ApiRoutes.baseUrl}nearbyHealthcare?country=$countryCode ---------------');
        Response res = await httpClient.get(
          '${ApiRoutes.baseUrl}nearbyHealthcare?country=$countryCode',
        );
        log('--------------Data Received---------------');
        log(res.body.toString());
        log('----------Finishing API Call------------');
        if (validateResponse(res)) {
          onSuccess(res);
        } else {
          onError(
            Response(
              statusCode: res.statusCode,
              body: {'error': 'Unhealthy Response'},
            ),
          );
        }
      }
    }catch(err){
      onError(
        Response(
          statusCode: 404,
          body: {'error': '$err'},
        ),
      );
    }
  }

  getAllPillsReminder({required Function(Response res) onSuccess,
        required Function(Response error) onError}) async {
    try{
      log('--------------Calling API: ${ApiRoutes.baseUrl}user/getUserPills/${UserStore.to.uid} ---------------');
      Response res = await httpClient.get(
        '${ApiRoutes.baseUrl}user/getUserPills/${UserStore.to.uid}',
      );
      log('--------------Data Received---------------');
      log(res.body.toString());
      log('----------Finishing API Call------------');
      if (validateResponse(res)) {
        onSuccess(res);
      } else {
        onError(
          Response(
            statusCode: res.statusCode,
            body: {'error': 'Unhealthy Response'},
          ),
        );
      }
    }catch(err){
      onError(
        Response(
          statusCode: 404,
          body: {'error': '$err'},
        ),
      );
    }
  }
}
