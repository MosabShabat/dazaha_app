import 'package:json_annotation/json_annotation.dart';

part 'pages.g.dart';

@JsonSerializable()
class Pages {
  int? currentPage;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Pages(
      {this.currentPage,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  factory Pages.fromJson(Map<String, dynamic> json) => _$PagesFromJson(json);
  Map<String, dynamic> toJson() => _$PagesToJson(this);
}
