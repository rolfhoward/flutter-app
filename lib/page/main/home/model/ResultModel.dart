
import 'package:flutter_app/page/main/home/model/ResultPageModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ResultModel.g.dart';

//flutter packages pub run build_runner build
@JsonSerializable()
class ResultModel{
  int code;
  String message;
  ResultPageModel data;

  ResultModel(this.code, this.message, this.data,);

  factory ResultModel.fromJson(Map<String, dynamic> json) => _$ResultModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResultModelToJson(this);
}