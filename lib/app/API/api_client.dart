import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:Whizz/app/API/api_routes.dart';
import 'package:Whizz/app/models/enum/searchByAddress.dart';
import 'package:Whizz/app/services/user.dart';

import '../models/user_model.dart';
import '../utils/constants.dart';

class ApiClient extends GetConnect implements GetxService {
  static ApiClient get to => Get.find();

  Future<Response> checkUserByPhone(String phoneNumber) async {
    try {
      log('=============== Calling API: ${ApiRoutes.baseUrl}user/phone/$phoneNumber ================');
      Response res = await httpClient.get(
        '${ApiRoutes.baseUrl}user/phone/$phoneNumber',
      );
      log('================================ Data Received ==========================================');
      log(res.body.toString());
      log('================================ Finishing API Call =====================================');
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
      return Response(
          statusCode: 404, body: {'status': false, 'error': '$err'});
    }
  }

  getUserById(String id,
      {required Function(Response res) onSuccess,
      required Function(Response error) onError}) async {
    try {
      log('===================== Calling API: ${ApiRoutes.baseUrl}user/$id ==============');
      log('================================ Data Sending ===========================================');
      log(id);
      Response res = await httpClient.get(
        '${ApiRoutes.baseUrl}user/$id',
      );
      log('================================ Data Received ==========================================');
      log(res.body.toString());
      log('================================ Finishing API Call =====================================');
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

  bool validateResponse(res) {
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
      log('================================ Data Sending ==========================================');
      log(user.toString());
      Response res = await httpClient.post(
        '${ApiRoutes.baseUrl}user/create',
        body: user,
      );
      log('================================ Data Received ==========================================');
      log(res.body.toString());
      log('================================ Finishing API Call =====================================');
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
    try {
      if (searchMode == SearchByAddress.city) {
        var countryCode = ConstantData.countryMap[userAddress.country];
        var cityCode = ConstantData.cityMap[userAddress.state]!
            .firstWhere((element) => element['name'] == userAddress.city);
        var stateCode = ConstantData.stateMap[userAddress.country]!
            .firstWhere((element) => element['name'] == userAddress.state);
        log('--------------Calling API: ${ApiRoutes.baseUrl}nearbyHealthcare?country=$countryCode&state=${stateCode['state_code']}&city=${cityCode['id']} ---------------');
        Response res = await httpClient.get(
          '${ApiRoutes.baseUrl}nearbyHealthcare?country=$countryCode&state=${stateCode['state_code']}&city=${cityCode['id']}',
        );
        log('================================ Data Received ==========================================');
        log(res.body.toString());
        log('================================ Finishing API Call =====================================');
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
        var stateCode = ConstantData.stateMap[userAddress.country]!
            .firstWhere((element) => element['name'] == userAddress.state);
        log('--------------Calling API: ${ApiRoutes.baseUrl}nearbyHealthcare?country=$countryCode&state=${stateCode['state_code']} ---------------');
        Response res = await httpClient.get(
          '${ApiRoutes.baseUrl}nearbyHealthcare?country=$countryCode&state=${stateCode['state_code']}',
        );
        log('================================ Data Received ==========================================');
        log(res.body.toString());
        log('================================ Finishing API Call =====================================');
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
      } else {
        var countryCode = ConstantData.countryMap[userAddress.country];
        log('--------------Calling API: ${ApiRoutes.baseUrl}nearbyHealthcare?country=$countryCode ---------------');
        Response res = await httpClient.get(
          '${ApiRoutes.baseUrl}nearbyHealthcare?country=$countryCode',
        );
        log('================================ Data Received ==========================================');
        log(res.body.toString());
        log('================================ Finishing API Call =====================================');
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
    } catch (err) {
      onError(
        Response(
          statusCode: 404,
          body: {'error': '$err'},
        ),
      );
    }
  }

  getAllPillsReminder(
      {required Function(Response res) onSuccess,
      required Function(Response error) onError}) async {
    try {
      log('--------------Calling API: ${ApiRoutes.baseUrl}user/getUserPills/${UserStore.to.uid} ---------------');
      Response res = await httpClient.get(
        '${ApiRoutes.baseUrl}user/getUserPills/${UserStore.to.uid}',
      );
      log('================================ Data Received ==========================================');
      log(res.body.toString());
      log('================================ Finishing API Call =====================================');
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

  updateUserData(Map<String, dynamic> user,
      {required Function(Response res) onSuccess,
      required Function(Response error) onError}) async {
    try {
      log('--------------Calling API: ${ApiRoutes.baseUrl}user/update---------------');
      log('================================ Data Sending ==========================================');
      log(user.toString());
      Response res = await httpClient.put(
        '${ApiRoutes.baseUrl}user/update',
        body: user,
      );
      log('================================ Data Received ==========================================');
      log(res.body.toString());
      log('================================ Finishing API Call =====================================');
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

  getHealthcareData(String healthcareId,
      {required Function(dynamic res) onSuccess,
      required Function(dynamic err) onError}) async {
    try {
      log('--------------Calling API: ${ApiRoutes.baseUrl}getHealthcareCenterById/$healthcareId ---------------');
      Response res = await httpClient.get(
        '${ApiRoutes.baseUrl}getHealthcareCenterById/$healthcareId',
      );
      log('================================ Data Received ==========================================');
      log(res.body.toString());
      log('================================ Finishing API Call =====================================');
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

  getDoctorData(String doctorId,
      {required Function(dynamic res) onSuccess,
      required Function(dynamic err) onError}) async {
    try {
      log('--------------Calling API: ${ApiRoutes.baseUrl}getdoctorById/$doctorId ---------------');
      Response res = await httpClient.get(
        '${ApiRoutes.baseUrl}getdoctorById/$doctorId',
      );
      log('================================ Data Received ==========================================');
      log(res.body.toString());
      log('================================ Finishing API Call =====================================');
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

  getDoctorList(String healthcareId,
      {required Function(dynamic res) onSuccess,
      required Function(dynamic err) onError}) async {
    try {
      log('--------------Calling API: ${ApiRoutes.baseUrl}getDoctors/$healthcareId ---------------');
      Response res = await httpClient.get(
        '${ApiRoutes.baseUrl}get_doctors_by_hid/$healthcareId',
      );
      log('================================ Data Received ==========================================');
      log(res.body.toString());
      log('================================ Finishing API Call =====================================');
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

  Future<dynamic> askDisease(
      {required Function(Response res) onSuccess,
      required Function(Response error) onError,
      required List<dynamic> diseaseList}) async {
    String askList = diseaseList.join('-');
    // try {
    log('--------------Calling API: Ask Disease   ---------------');
    Response res = await httpClient.post(
      '${ApiRoutes.baseUrl}ask/',
      body: {"selection": askList},
    );
    log('================================ Data Received ==========================================');
    log(res.body.toString());
    log('================================ Finishing API Call =====================================');

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
    // }catch (err) {
    //
    //   onError(
    //     Response(
    //       statusCode: 404,
    //       body: {'error': '$err'},
    //     ),
    //   );
    // }
  }

  predictDisease(
      {required Function(Response res) onSuccess,
      required Function(Response error) onError,
      required List<dynamic> symptoms}) async {
    String predictList = symptoms.join('-');
    log(name: "Predict List", predictList.toString());
    try {
      log('--------------Calling API: Predict Disease   ---------------');
      Response res = await httpClient.post(
        '${ApiRoutes.baseUrl}predict/',
        body: {"symptoms": predictList},
      );
      log('================================ Data Received ==========================================');
      log(res.body.toString());
      log('================================ Finishing API Call =====================================');

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

  uploadUserReport(
      {required File file,
      required String type,
      required String location,
      required Function(Map<String, dynamic> res) onSuccess,
      required Function(Response err) onError}) async {
    try {
      log('--------------Calling API: upload report   ---------------');
      var request = http.MultipartRequest('POST', Uri.parse('${ApiRoutes.baseUrl}user/reports/add'));
      request.fields.addAll({
        'type': type,
        'location': location,
        'time': DateTime.now().toIso8601String(),
        'userId': UserStore.to.uid,
      });
      request.files.add(await http.MultipartFile.fromPath('report', file.path));

      http.StreamedResponse res = await request.send();
      log('================================ Data Received ==========================================');
      log(await res.stream.bytesToString());
      log('================================ Finishing API Call =====================================');
      if (validateResponse(res)) {
        var data = jsonDecode(await res.stream.bytesToString());
        onSuccess(data);
      } else {
        onError(
          Response(
            statusCode: 404,
            body: {'error': '${res.stream}'},
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
}
