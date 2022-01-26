import 'package:dio/dio.dart';

class MyResponse {
  bool? error;
  String? errorMassege;
  Response? data;
  MyResponse({
    this.error,
    this.errorMassege,
    this.data,
  });
}
