import 'dart:io';

import 'package:dio/dio.dart';
import 'package:newads/constants.dart';
import 'package:newads/model/response_model.dart';

class Diohelp {
  static Dio mydio = Dio();

  static void init() {
    mydio = Dio(
      BaseOptions(
        baseUrl: 'https://aqaratikom.com',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<MyResponse> postdata(
      {required String text, required Map<String, dynamic> data}) async {
    mydio.options.headers = {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    };
    final response;
    try {
      response = await mydio.post(text, queryParameters: data);
      return MyResponse(data: response, error: false);
    } on SocketException catch (e) {
      return MyResponse(errorMassege: "No internet Conction", error: true);
    } on DioError catch (e) {
      return MyResponse(
          errorMassege: "Please insert valid values", error: true);
      ;
    }
  }
}
