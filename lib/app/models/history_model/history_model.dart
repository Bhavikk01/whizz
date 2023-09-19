
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_model.freezed.dart';
part 'history_model.g.dart';

@freezed
class HistoryModel with _$HistoryModel {

  const factory HistoryModel({
    required String userId,
    required List<HistoryData> historyData,
  }) = _HistoryModel;

  factory HistoryModel.fromJson(Map<String, Object?> json)  => _$HistoryModelFromJson(json);

}

@freezed
class HistoryData with _$HistoryData {

  const factory HistoryData({
    required String pillId,
    required List<String> timeTaken,
    required List<String> timeToTake,
  }) = _HistoryData;

  factory HistoryData.fromJson(Map<String, Object?> json)  => _$HistoryDataFromJson(json);

}