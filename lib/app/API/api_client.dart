import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whizz/app/API/api_routes.dart';

class ApiClient extends GetConnect implements GetxService {
  static ApiClient get to => Get.find();

  Future<Response> checkUserByPhone(String phoneNumber) async {
    try {
      Response res = await httpClient.get(
        '${ApiRoutes.baseUrl}user?phone=$phoneNumber',
      );
      if (validateResponse(res)) {
        return res.body;
      } else {
        return Response(
          statusCode: res.statusCode,
          body: {'error': 'Unhealthy Response'},
        );
      }
    } catch (err) {
      Get.snackbar(
        'Auth',
        '$err',
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      );
      return Response(statusCode: 404, body: {'error': '$err'});
    }
  }

  getUserById(String id,
      {required Function(Response res) onSuccess,
      required Function(Response error) onError}) async {
    try {
      Response res = await httpClient.get(
        '${ApiRoutes.baseUrl}user/$id',
      );
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
      Get.snackbar(
        'Auth',
        '$err',
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      );
      return Response(statusCode: 404, body: {'error': '$err'});
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
      Response res = await httpClient.post(
        '${ApiRoutes.baseUrl}user/create',
        body: user,
      );
      if (validateResponse(res)) {
        onSuccess(res.body);
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
      return Response(statusCode: 404, body: {'error': '$err'});
    }
  }
}
