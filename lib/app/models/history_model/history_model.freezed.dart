// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HistoryModel _$HistoryModelFromJson(Map<String, dynamic> json) {
  return _HistoryModel.fromJson(json);
}

/// @nodoc
mixin _$HistoryModel {
  String get userId => throw _privateConstructorUsedError;
  List<HistoryData> get historyData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryModelCopyWith<HistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryModelCopyWith<$Res> {
  factory $HistoryModelCopyWith(
          HistoryModel value, $Res Function(HistoryModel) then) =
      _$HistoryModelCopyWithImpl<$Res, HistoryModel>;
  @useResult
  $Res call({String userId, List<HistoryData> historyData});
}

/// @nodoc
class _$HistoryModelCopyWithImpl<$Res, $Val extends HistoryModel>
    implements $HistoryModelCopyWith<$Res> {
  _$HistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? historyData = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      historyData: null == historyData
          ? _value.historyData
          : historyData // ignore: cast_nullable_to_non_nullable
              as List<HistoryData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HistoryModelCopyWith<$Res>
    implements $HistoryModelCopyWith<$Res> {
  factory _$$_HistoryModelCopyWith(
          _$_HistoryModel value, $Res Function(_$_HistoryModel) then) =
      __$$_HistoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, List<HistoryData> historyData});
}

/// @nodoc
class __$$_HistoryModelCopyWithImpl<$Res>
    extends _$HistoryModelCopyWithImpl<$Res, _$_HistoryModel>
    implements _$$_HistoryModelCopyWith<$Res> {
  __$$_HistoryModelCopyWithImpl(
      _$_HistoryModel _value, $Res Function(_$_HistoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? historyData = null,
  }) {
    return _then(_$_HistoryModel(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      historyData: null == historyData
          ? _value._historyData
          : historyData // ignore: cast_nullable_to_non_nullable
              as List<HistoryData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HistoryModel implements _HistoryModel {
  const _$_HistoryModel(
      {required this.userId, required final List<HistoryData> historyData})
      : _historyData = historyData;

  factory _$_HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_HistoryModelFromJson(json);

  @override
  final String userId;
  final List<HistoryData> _historyData;
  @override
  List<HistoryData> get historyData {
    if (_historyData is EqualUnmodifiableListView) return _historyData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_historyData);
  }

  @override
  String toString() {
    return 'HistoryModel(userId: $userId, historyData: $historyData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other._historyData, _historyData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, userId, const DeepCollectionEquality().hash(_historyData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HistoryModelCopyWith<_$_HistoryModel> get copyWith =>
      __$$_HistoryModelCopyWithImpl<_$_HistoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HistoryModelToJson(
      this,
    );
  }
}

abstract class _HistoryModel implements HistoryModel {
  const factory _HistoryModel(
      {required final String userId,
      required final List<HistoryData> historyData}) = _$_HistoryModel;

  factory _HistoryModel.fromJson(Map<String, dynamic> json) =
      _$_HistoryModel.fromJson;

  @override
  String get userId;
  @override
  List<HistoryData> get historyData;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryModelCopyWith<_$_HistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

HistoryData _$HistoryDataFromJson(Map<String, dynamic> json) {
  return _HistoryData.fromJson(json);
}

/// @nodoc
mixin _$HistoryData {
  String get pillId => throw _privateConstructorUsedError;
  List<String> get timeTaken => throw _privateConstructorUsedError;
  List<String> get timeToTake => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryDataCopyWith<HistoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryDataCopyWith<$Res> {
  factory $HistoryDataCopyWith(
          HistoryData value, $Res Function(HistoryData) then) =
      _$HistoryDataCopyWithImpl<$Res, HistoryData>;
  @useResult
  $Res call({String pillId, List<String> timeTaken, List<String> timeToTake});
}

/// @nodoc
class _$HistoryDataCopyWithImpl<$Res, $Val extends HistoryData>
    implements $HistoryDataCopyWith<$Res> {
  _$HistoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pillId = null,
    Object? timeTaken = null,
    Object? timeToTake = null,
  }) {
    return _then(_value.copyWith(
      pillId: null == pillId
          ? _value.pillId
          : pillId // ignore: cast_nullable_to_non_nullable
              as String,
      timeTaken: null == timeTaken
          ? _value.timeTaken
          : timeTaken // ignore: cast_nullable_to_non_nullable
              as List<String>,
      timeToTake: null == timeToTake
          ? _value.timeToTake
          : timeToTake // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HistoryDataCopyWith<$Res>
    implements $HistoryDataCopyWith<$Res> {
  factory _$$_HistoryDataCopyWith(
          _$_HistoryData value, $Res Function(_$_HistoryData) then) =
      __$$_HistoryDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String pillId, List<String> timeTaken, List<String> timeToTake});
}

/// @nodoc
class __$$_HistoryDataCopyWithImpl<$Res>
    extends _$HistoryDataCopyWithImpl<$Res, _$_HistoryData>
    implements _$$_HistoryDataCopyWith<$Res> {
  __$$_HistoryDataCopyWithImpl(
      _$_HistoryData _value, $Res Function(_$_HistoryData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pillId = null,
    Object? timeTaken = null,
    Object? timeToTake = null,
  }) {
    return _then(_$_HistoryData(
      pillId: null == pillId
          ? _value.pillId
          : pillId // ignore: cast_nullable_to_non_nullable
              as String,
      timeTaken: null == timeTaken
          ? _value._timeTaken
          : timeTaken // ignore: cast_nullable_to_non_nullable
              as List<String>,
      timeToTake: null == timeToTake
          ? _value._timeToTake
          : timeToTake // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HistoryData implements _HistoryData {
  const _$_HistoryData(
      {required this.pillId,
      required final List<String> timeTaken,
      required final List<String> timeToTake})
      : _timeTaken = timeTaken,
        _timeToTake = timeToTake;

  factory _$_HistoryData.fromJson(Map<String, dynamic> json) =>
      _$$_HistoryDataFromJson(json);

  @override
  final String pillId;
  final List<String> _timeTaken;
  @override
  List<String> get timeTaken {
    if (_timeTaken is EqualUnmodifiableListView) return _timeTaken;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timeTaken);
  }

  final List<String> _timeToTake;
  @override
  List<String> get timeToTake {
    if (_timeToTake is EqualUnmodifiableListView) return _timeToTake;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timeToTake);
  }

  @override
  String toString() {
    return 'HistoryData(pillId: $pillId, timeTaken: $timeTaken, timeToTake: $timeToTake)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryData &&
            (identical(other.pillId, pillId) || other.pillId == pillId) &&
            const DeepCollectionEquality()
                .equals(other._timeTaken, _timeTaken) &&
            const DeepCollectionEquality()
                .equals(other._timeToTake, _timeToTake));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      pillId,
      const DeepCollectionEquality().hash(_timeTaken),
      const DeepCollectionEquality().hash(_timeToTake));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HistoryDataCopyWith<_$_HistoryData> get copyWith =>
      __$$_HistoryDataCopyWithImpl<_$_HistoryData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HistoryDataToJson(
      this,
    );
  }
}

abstract class _HistoryData implements HistoryData {
  const factory _HistoryData(
      {required final String pillId,
      required final List<String> timeTaken,
      required final List<String> timeToTake}) = _$_HistoryData;

  factory _HistoryData.fromJson(Map<String, dynamic> json) =
      _$_HistoryData.fromJson;

  @override
  String get pillId;
  @override
  List<String> get timeTaken;
  @override
  List<String> get timeToTake;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryDataCopyWith<_$_HistoryData> get copyWith =>
      throw _privateConstructorUsedError;
}
