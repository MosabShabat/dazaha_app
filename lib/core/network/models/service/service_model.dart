import 'package:json_annotation/json_annotation.dart';

part 'service_model.g.dart';

@JsonSerializable()
class ServiceModel {
    ServiceModel({
        required this.subServices,
        required this.instructions,
        required this.intros,
    });

    @JsonKey(name: 'sub_services') 
    final List<Intro>? subServices;
    final List<Instruction>? instructions;
    final List<Intro>? intros;

    factory ServiceModel.fromJson(Map<String, dynamic> json) => _$ServiceModelFromJson(json);

    Map<String, dynamic> toJson() => _$ServiceModelToJson(this);

}

@JsonSerializable()
class Instruction {
    Instruction({
        required this.uuid,
        required this.title,
    });

    final String? uuid;
    final String? title;

    factory Instruction.fromJson(Map<String, dynamic> json) => _$InstructionFromJson(json);

    Map<String, dynamic> toJson() => _$InstructionToJson(this);

}

@JsonSerializable()
class Intro {
    Intro({
        required this.uuid,
        required this.title,
        required this.description,
        required this.image,
    });

    final String? uuid;
    final String? title;
    final String? description;
    final String? image;

    factory Intro.fromJson(Map<String, dynamic> json) => _$IntroFromJson(json);

    Map<String, dynamic> toJson() => _$IntroToJson(this);

}
