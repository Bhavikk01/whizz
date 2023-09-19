import 'package:freezed_annotation/freezed_annotation.dart';

part 'pills_model.freezed.dart';
part 'pills_model.g.dart';

@freezed
class PillsModel with _$PillsModel{
  
  const factory PillsModel({
    required String uid,
    required String userId,
    required String pillName,
    required String dosage,
    required String interval,
    required List<String> pillsInterval,
    required List<String> pillsDuration,
    required bool isRange,
    required bool isIndividual,
  }) = _PillsModel;

  factory PillsModel.fromJson(Map<String, Object?> json)  => _$PillsModelFromJson(json);
}
