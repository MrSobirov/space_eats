import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../config/app_constants.dart';
import '../local_storage/local_keys.dart';
import 'dio_interceptors.dart';

class DioClient {
  final Box hiveBox;

  DioClient({
    required this.hiveBox,
  });

  Dio createDio() {
    final dio = Dio()
      ..options = BaseOptions(
        baseUrl: AppConstants.baseUrl,
        contentType: 'application/json',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        followRedirects: false,
        headers: {
          'Authorization': "Bearer ${hiveBox.get(LocalKeys.accessToken)}",
          'x-lang': hiveBox.get(LocalKeys.language, defaultValue: 'uz'),
        },
      );

    dio.interceptors.addAll([
      AuthInterceptor(hiveBox: hiveBox, dio: dio),
      // DioCacheInterceptor(options: customCacheOptions),
      LogInterceptor(
        requestBody: kDebugMode,
        responseBody: kDebugMode,
        logPrint: (object) =>
            kDebugMode ? log('dio: ${object.toString()}') : null,
      ),
    ]);

    return dio;
  }
}
