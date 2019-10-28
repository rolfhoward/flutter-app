
import 'package:json_annotation/json_annotation.dart';
part 'ResultModel.g.dart';

//flutter packages pub run build_runner build
@JsonSerializable()
class ResultModel<T>{
  int code;
  String message;
  dynamic data;

  ResultModel(this.code, this.message, this.data,);

  factory ResultModel.fromJson(Map<String, dynamic> json) => _$ResultModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResultModelToJson(this);
}