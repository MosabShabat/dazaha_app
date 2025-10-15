import 'package:json_annotation/json_annotation.dart';

part 'sizes.g.dart';

@JsonSerializable()
class Sizes {
  Sizes({required this.uuid, required this.title, required this.image});

  final String? uuid;
  final String? title;
  final String? image;

  factory Sizes.fromJson(Map<String, dynamic> json) => _$SizesFromJson(json);

  Map<String, dynamic> toJson() => _$SizesToJson(this);
}
