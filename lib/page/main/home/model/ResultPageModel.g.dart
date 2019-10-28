// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResultPageModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultPageModel _$ResultPageModelFromJson(Map<String, dynamic> json) {
  return ResultPageModel(
      json['endRow'] as int,
      json['firstPage'] as int,
      json['hasNextPage'] as bool,
      json['hasPreviousPage'] as bool,
      json['isFirstPage'] as bool,
      json['isLastPage'] as bool,
      json['lastPage'] as int,
      json['navigateFirstPage'] as int,
      json['navigateLastPage'] as int,
      json['navigatePages'] as int,
      json['nextPage'] as int,
      json['pageNum'] as int,
      json['pageSize'] as int,
      json['pages'] as int,
      json['prePage'] as int,
      json['size'] as int,
      json['startRow'] as int,
      json['total'] as int);
}

Map<String, dynamic> _$ResultPageModelToJson(ResultPageModel instance) =>
    <String, dynamic>{
      'endRow': instance.endRow,
      'firstPage': instance.firstPage,
      'hasNextPage': instance.hasNextPage,
      'hasPreviousPage': instance.hasPreviousPage,
      'isFirstPage': instance.isFirstPage,
      'isLastPage': instance.isLastPage,
      'lastPage': instance.lastPage,
      'navigateFirstPage': instance.navigateFirstPage,
      'navigateLastPage': instance.navigateLastPage,
      'navigatePages': instance.navigatePages,
      'nextPage': instance.nextPage,
      'pageNum': instance.pageNum,
      'pageSize': instance.pageSize,
      'pages': instance.pages,
      'prePage': instance.prePage,
      'size': instance.size,
      'startRow': instance.startRow,
      'total': instance.total
    };
