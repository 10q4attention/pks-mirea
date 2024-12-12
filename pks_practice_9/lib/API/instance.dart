import 'package:dio/dio.dart';

final api = Dio(
  BaseOptions(
    baseUrl: 'http://10.0.2.2:8080',
    connectTimeout: const Duration(milliseconds: 5000),
    receiveTimeout: const Duration(milliseconds: 7000),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ),
);