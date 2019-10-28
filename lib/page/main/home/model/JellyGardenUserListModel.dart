
import 'package:flutter_app/page/main/home/model/ResultPageModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'JellyGardenUserListModel.g.dart';

@JsonSerializable()
class JellyGardenUserListModel extends ResultPageModel{
  List<JellyGardenUserModel> list;
  JellyGardenUserListModel(int endRow, int firstPage, bool hasNextPage, bool hasPreviousPage, bool isFirstPage, bool isLastPage, int lastPage, int navigateFirstPage, int navigateLastPage, int navigatePages, int nextPage, int pageNum, int pageSize, int pages, int prePage, int size, int startRow, int total) : super(endRow, firstPage, hasNextPage, hasPreviousPage, isFirstPage, isLastPage, lastPage, navigateFirstPage, navigateLastPage, navigatePages, nextPage, pageNum, pageSize, pages, prePage, size, startRow, total);

  factory JellyGardenUserListModel.fromJson(Map<String, dynamic> json)=>_$JellyGardenUserListModelFromJson(json);

  Map<String, dynamic> toJson()=>_$JellyGardenUserListModelToJson(this);
}

@JsonSerializable()
class JellyGardenUserModel {
  int id;
  String nickName;
  String password;
  double registerDate;
  int sex;
  String username;
  String photo;

  JellyGardenUserModel(this.id, this.nickName, this.password, this.registerDate,
      this.sex, this.username, this.photo);

  factory JellyGardenUserModel.fromJson(Map<String, dynamic> json)=>_$JellyGardenUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$JellyGardenUserModelToJson(this);
}