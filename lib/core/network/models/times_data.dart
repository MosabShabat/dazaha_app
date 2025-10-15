//tims_data
import 'package:json_annotation/json_annotation.dart';

part 'times_data.g.dart';

@JsonSerializable()
class TimesData {
  TimesData({required this.uuid, required this.from, required this.to});

  final String? uuid;
  final String? from;
  final String? to;

  factory TimesData.fromJson(Map<String, dynamic> json) =>
      _$TimesDataFromJson(json);

  Map<String, dynamic> toJson() => _$TimesDataToJson(this);
}
