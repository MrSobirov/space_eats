import 'package:dio/dio.dart';

import '../config/app_constants.dart';
import '../local_storage/local_keys.dart';
import '../services/shared_preference_manager.dart';
import 'interceptor/custom_interceptor.dart';

class DioSettings {
  void setBaseOptions({String? lang, String? baseUrl}) {
    _dioBaseOptions().baseUrl = baseUrl ?? AppConstants.baseUrl;
    _dioBaseOptions().headers['Authorization'] =
        SharedPreferenceManager.getString(
      LocalKeys.accessToken,
      defValue: '',
    );
    _dioBaseOptions().headers['Accept-Language'] = lang ?? 'en';
  }

  BaseOptions _dioBaseOptions({String? baseUrl}) => BaseOptions(
        baseUrl: baseUrl ?? AppConstants.baseUrl,
        connectTimeout: const Duration(milliseconds: 35000),
        receiveTimeout: const Duration(milliseconds: 35000),
        followRedirects: false,
        headers: {
          'Authorization': SharedPreferenceManager.getString(
            LocalKeys.accessToken,
            defValue: '',
          ),
          'x-lang': SharedPreferenceManager.getString(
            LocalKeys.language,
            defValue: 'uz',
          ),
          // 'Accept': "application/json",
          // 'Contract': AppConstants.CONTRACT_API,
        },
        // validateStatus: (status) => status != null && status <= 500,
      );

  Dio dio({String? baseurl}) {
    final Dio dio = Dio(_dioBaseOptions(baseUrl: baseurl));
    dio.interceptors
      ..add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
          request: true,
          requestHeader: true,
        ),
      )
      ..add(CustomInterceptor(dio: dio));
    return dio;
  }
}
