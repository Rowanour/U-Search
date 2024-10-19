import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/unis_model.dart';



class UniService{
  final _dio = Dio();

  Future<List<Uni>> getUni() async {
    final response = await _dio.get('https://dummyjson.com/c/db25-dc0c-42c3-bc15');



    Map<String, dynamic> jsonData = response.data;

    List<dynamic> uniJson = jsonData['universities'];

    List<Uni> universities = uniJson
        .map((json) => Uni.fromJson(json as Map<String, dynamic>))
        .toList();

    return universities;
  }
}