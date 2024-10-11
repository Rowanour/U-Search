import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'unis_model.g.dart';
@JsonSerializable()
class Uni {
  final String name;
  final int id;
  final String description;
  final int fees;
  final String img;
  final String location;

  Uni({
    required this.name,
    required this.id,
    required this.description,
    required this.img,
    required this.fees,
    required this.location,
  });

  factory Uni.fromJson(Map<String, dynamic> json) => _$UniFromJson(json);
}
