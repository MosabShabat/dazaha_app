import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  
  String? fieldName;
  List<String>? messages;

  ApiErrorModel({this.fieldName, this.messages});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);


 String getAllErrors() {
    if (messages == null || messages!.isEmpty) return "Unknown Error";
    return messages!.join(', ');
  }

}
