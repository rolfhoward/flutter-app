// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResultModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultModel<T> _$ResultModelFromJson<T>(Map<String, dynamic> json) {
  return ResultModel<T>(
      json['code'] as int, json['message'] as String, json['data']);
}

Map<String, dynamic> _$ResultModelToJson<T>(ResultModel<T> instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data
    };
