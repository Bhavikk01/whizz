// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HistoryModel _$$_HistoryModelFromJson(Map<String, dynamic> json) =>
    _$_HistoryModel(
      userId: json['userId'] as String,
      historyData: (json['historyData'] as List<dynamic>)
          .map((e) => HistoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_HistoryModelToJson(_$_HistoryModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'historyData': instance.historyData,
    };

_$_HistoryData _$$_HistoryDataFromJson(Map<String, dynamic> json) =>
    _$_HistoryData(
      pillId: json['pillId'] as String,
      timeTaken:
          (json['timeTaken'] as List<dynamic>).map((e) => e as String).toList(),
      timeToTake: (json['timeToTake'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_HistoryDataToJson(_$_HistoryData instance) =>
    <String, dynamic>{
      'pillId': instance.pillId,
      'timeTaken': instance.timeTaken,
      'timeToTake': instance.timeToTake,
    };
