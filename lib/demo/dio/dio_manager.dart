import 'package:dio/dio.dart';

BaseOptions options = new BaseOptions(
    baseUrl: "https://bandage.free.beeceptor.com",
    connectTimeout: 5000,
    receiveTimeout: 3000);
Dio dio = new Dio(options);
