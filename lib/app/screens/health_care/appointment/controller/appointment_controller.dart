import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:get/get.dart';

import '../../../../API/api_client.dart';
import '../../../../models/doctor_model.dart';
import '../../../../utils/custom_bottom_snackbar.dart';

class AppointmentController extends GetxController{

  Rx<DoctorModel> doctorModel = DoctorModel().obs;
  Rx<int> selectedTime = 0.obs;

  @override
  Future<void> onInit() async {
    doctorModel.value.id = Get.arguments['id'] ?? '';
    await getDoctorData();
    super.onInit();
  }

  getDoctorData() async {
    if(doctorModel.value.id != ''){
      await ApiClient.to.getDoctorData(
          doctorModel.value.id?? '',
          onSuccess: (res) {
            if(res.body['status']){
              doctorModel.value = DoctorModel.fromJson(res.body['data']);
            }else{
              customSnackBar(
                type: AnimatedSnackBarType.error,
                message: '${res.body['message']}',
              );
            }
          },
          onError: (err){
            customSnackBar(
              type: AnimatedSnackBarType.error,
              message: '${err.body['error']}',
            );
          }
      );
    }
  }
}