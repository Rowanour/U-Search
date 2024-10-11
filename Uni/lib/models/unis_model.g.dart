// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unis_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Uni _$UniFromJson(Map<String, dynamic> json) => Uni(
      name: json['name'] as String,
      description: json['description'] as String,
      id: (json['id'] as num).toInt(),
      img: json['img'] as String,
      fees: (json['fees'] as num).toInt(),
      location: json['location'] as String,
);

Map<String, dynamic> _$UniToJson(Uni instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'description': instance.description,
      'fees': instance.fees,
      'image': instance.img,
      'location': instance.location,
};
