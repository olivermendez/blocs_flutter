import 'dart:async';
//import 'dart:convert';

import 'package:dio/dio.dart';

class Cat {
  String id;
  String url;
  int width;
  int height;

  Cat({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });
}

class CatApiRepo {
  static Future<String> getPokeName() async {
    final dio = Dio();

    await Future.delayed(const Duration(seconds: 2));
    try {
      final response =
          await dio.get('https://api.thecatapi.com/v1/images/search');

      final data = response.data[0]["url"];
      return data;
    } catch (e) {
      return "$e";
    }
  }
}
