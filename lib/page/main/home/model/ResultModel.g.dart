// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResultModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultModel _$ResultModelFromJson(Map<String, dynamic> json) {
  return ResultModel(
      json['code'] as int,
      json['message'] as String,
      json['data'] == null
          ? null
          : ResultPageModel.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ResultModelToJson(ResultModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data
    };
