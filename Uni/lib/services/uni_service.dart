import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/unis_model.dart';



class UniService{
  final _dio = Dio();

  Future<List<Uni>> getUni() async {
    final response = await _dio.get('https://dummyjson.com/c/8123-4de5-401c-b7d5');
    //final response = await _dio.get('https://dummyjson.com/c/685d-f96b-4ebb-b82c');
    //final response = await _dio.get('https://dummyjson.com/c/94b3-0ed6-4e2a-8e7d');
    //final response = await _dio.get('https://dummyjson.com/c/68b1-d666-4812-9156');
    //final response = await _dio.get('https://dummyjson.com/c/68b1-d666-4812-9156');


    Map<String, dynamic> jsonData = response.data;

    List<dynamic> uniJson = jsonData['universities'];

    List<Uni> universities = uniJson
        .map((json) => Uni.fromJson(json as Map<String, dynamic>))
        .toList();

    return universities;
  }
}