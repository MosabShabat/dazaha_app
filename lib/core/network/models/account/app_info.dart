import 'package:json_annotation/json_annotation.dart';

part 'app_info.g.dart';

@JsonSerializable()
class AppInfo {
    AppInfo({
        required this.title,
        required this.description,
    });

    final String? title;
    final String? description;

    factory AppInfo.fromJson(Map<String, dynamic> json) => _$AppInfoFromJson(json);

    Map<String, dynamic> toJson() => _$AppInfoToJson(this);

}
