import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:get/get.dart';
import 'package:whizz/app/utils/loading_overlay.dart';

import '../../../API/api_client.dart';
import '../../../models/history_model/history_model.dart';
import '../../../models/pills_models/pills_model.dart';
import '../../../services/internet_status_service.dart';
import '../../../utils/custom_bottom_snackbar.dart';
class HomeController extends GetxController {
  RxList<HistoryData> historyList = <HistoryData>[].obs;
  RxList<PillsModel> reminderList = <PillsModel>[].obs;
  var loadingUserData = false.obs;
  var haveInternet = true.obs;
  var pillIndex = 0.obs;
  var pillsTaken = 0.obs;
  var pillsToTake = 0.obs;

  @override
  Future<void> onInit() async {
    haveInternet.value = await InternetService().checkInternetSourceStatus();
    if(haveInternet.value){
      await getUserData();
    }
    super.onInit();
  }

  getUserData() async {
    LoadingOverlay.showOverlay();
    loadingUserData.value = true;
    await ApiClient.to.getAllPillsReminder(
      onSuccess: (res) {
        if(res.body['status']){
          for(var reminder in res.body['data']){
            var currentDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
            PillsModel pillsModel = PillsModel.fromJson(reminder);
            if (pillsModel.isIndividual) {
              List<DateTime> dates = pillsModel.pillsDuration.map((e) => DateTime.parse(e)).toList();
              if (dates.contains(currentDate)) {
                reminderList.add(pillsModel);
              }
            } else if(pillsModel.isRange) {
              List<DateTime> dates = pillsModel.pillsDuration.map((e) => DateTime.parse(e)).toList();
              var checkInRange = dates.first.isBefore(currentDate) && dates.last.isAfter(currentDate);
              if (checkInRange || dates.first.isAtSameMomentAs(currentDate) || dates.last.isAtSameMomentAs(currentDate)) {
                reminderList.add(pillsModel);
              }
            }
          }
          loadingUserData.value = false;
        }else{
          loadingUserData.value = false;
          customSnackBar(
            type: AnimatedSnackBarType.error,
            message: res.body['message'],
          );
        }
      },
      onError: (err) {
        loadingUserData.value = false;
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: '${err.body['error']}',
        );
      }
    );
    LoadingOverlay.hideOverlay();
  }

  String checkDue() {

    if(reminderList.isNotEmpty){
      for (var interval in reminderList[pillIndex.value].pillsInterval) {
        var nextIndex = reminderList[pillIndex.value].pillsInterval.indexOf(interval) + 1;
        var diff = 180;
        if(nextIndex < reminderList[pillIndex.value].pillsInterval.length){
          diff = DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            int.parse(reminderList[pillIndex.value].pillsInterval[nextIndex].substring(0, 2)),
            int.parse(reminderList[pillIndex.value].pillsInterval[nextIndex].substring(5, 7)),
          ).difference(
            DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
              int.parse(interval.substring(0, 2)),
              int.parse(interval.substring(5, 7)),
            ),
          ).inMinutes;
        }else if(nextIndex-2 < reminderList[pillIndex.value].pillsInterval.length && (nextIndex-2) >= 0){
          diff = DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            int.parse(reminderList[pillIndex.value].pillsInterval[nextIndex-2].substring(0, 2)),
            int.parse(reminderList[pillIndex.value].pillsInterval[nextIndex-2].substring(5, 7)),
          ).difference(
            DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
              int.parse(interval.substring(0, 2)),
              int.parse(interval.substring(5, 7)),
            ),
          ).inMinutes;
        }
        if(diff >= 180){
          diff = 180;
        }
        if(diff < 0){
          diff = -diff;
        }
        if (DateTime.now().difference(
            DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
              int.parse(interval.substring(0, 2)),
              int.parse(interval.substring(5, 7)),
            )
        ).inMinutes <= diff/2 && diff > 0) {
          if (historyList.isNotEmpty) {
            List<DateTime> timeTaken = historyList[pillIndex.value].timeTaken.map((e) => DateTime(DateTime.now().year,DateTime.now().month, DateTime.now().day, int.parse(e.substring(0,2)),  int.parse(e.substring(5,7)))).toList();
            if(timeTaken.any((element) =>
            element.difference(DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
                int.parse(interval.substring(0, 2)),
                int.parse(interval.substring(5, 7))))
                .inMinutes <= diff/2 && element.difference(DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
                int.parse(interval.substring(0, 2)),
                int.parse(interval.substring(5, 7))))
                .inMinutes >= -diff/2)){
            }else{
              if (int.parse(interval.substring(0, 2)) == 12) {
                return '${interval.substring(0, 2)} : ${interval.substring(5, 7)} PM';
              } else if (int.parse(interval.substring(0, 2)) > 12) {
                int diff = int.parse(interval.substring(0, 2)) - 12;
                if (diff > 9) {
                  return '$diff : ${interval.substring(5, 7)} ${(int.parse(interval.substring(0, 2)) - 12) == 12 ? 'AM' : 'PM'}';
                } else {
                  return '0$diff : ${interval.substring(5, 7)} PM';
                }
              } else {
                if (int.parse(interval.substring(0, 2)) > 9) {
                  return '${int.parse(interval.substring(0, 2))} : ${interval.substring(5, 7)} AM';
                } else {
                  return '0${int.parse(interval.substring(0, 2))} : ${interval.substring(5, 7)} AM';
                }
              }
            }
          } else {
            if (int.parse(interval.substring(0, 2)) == 12) {
              return '${interval.substring(0, 2)} : ${interval.substring(5, 7)} PM';
            } else if (int.parse(interval.substring(0, 2)) > 12) {
              int diff = int.parse(interval.substring(0, 2)) - 12;
              if (diff > 9) {
                return '$diff : ${interval.substring(5, 7)} ${(int.parse(interval.substring(0, 2)) - 12) == 12 ? 'AM' : 'PM'}';
              } else {
                return '0$diff : ${interval.substring(5, 7)} PM';
              }
            } else {
              if (int.parse(interval.substring(0, 2)) > 9) {
                return '${int.parse(interval.substring(0, 2))} : ${interval.substring(5, 7)} AM';
              } else {
                return '0${int.parse(interval.substring(0, 2))} : ${interval.substring(5, 7)} AM';
              }
            }
          }
        }
      }
    }
    return '';
  }

}
