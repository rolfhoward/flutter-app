import 'package:json_annotation/json_annotation.dart';

import 'JellyGardenUserListModel.dart';
part 'ResultPageModel.g.dart';

@JsonSerializable()
class ResultPageModel{
  int endRow;
  int firstPage;
  bool hasNextPage;
  bool hasPreviousPage;
  bool isFirstPage;
  bool isLastPage;
  int lastPage;
  int navigateFirstPage;
  int navigateLastPage;
  int navigatePages;
  int nextPage;
  int pageNum;
  int pageSize;
  int pages;
  int prePage;
  int size;
  int startRow;
  int total;
//  List<JellyGardenUserModel> list;

  ResultPageModel(this.endRow, this.firstPage, this.hasNextPage,
      this.hasPreviousPage, this.isFirstPage, this.isLastPage, this.lastPage,
      this.navigateFirstPage, this.navigateLastPage, this.navigatePages,
      this.nextPage, this.pageNum, this.pageSize, this.pages, this.prePage,
      this.size, this.startRow, this.total);

  factory ResultPageModel.fromJson(Map<String, dynamic> srcJson) => _$ResultPageModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResultPageModelToJson(this);


}