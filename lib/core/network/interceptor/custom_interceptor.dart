import 'package:dio/dio.dart';

import '../../config/app_constants.dart';
import '../../local_storage/local_keys.dart';
import '../../services/shared_preference_manager.dart';

class CustomInterceptor implements Interceptor {
  final Dio dio;

  const CustomInterceptor({required this.dio});

  @override
  Future<void> onError(
      DioException error, ErrorInterceptorHandler handler) async {
    if (error.type == DioExceptionType.badResponse &&
        (error.response?.statusCode == 403 ||
            error.response?.statusCode == 401)) {
      SharedPreferenceManager.deleteString(LocalKeys.accessToken);
      if (SharedPreferenceManager.getString(LocalKeys.accessToken)
          .replaceAll('Bearer', '')
          .trim()
          .isNotEmpty) {
        error.requestOptions.headers['Authorization'] =
            SharedPreferenceManager.getString(LocalKeys.accessToken);
      }

      final response = await _resolveResponse(error.requestOptions);
      handler.resolve(response);
      return;
    }
    handler.next(error);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (SharedPreferenceManager.getString(LocalKeys.accessToken, defValue: '')
        .isNotEmpty) {
      options.headers['Authorization'] =
          SharedPreferenceManager.getString(LocalKeys.accessToken);
    } else {
      options.headers.remove('Authorization');
    }
    options.headers['x-lang'] =
        SharedPreferenceManager.getString(LocalKeys.language, defValue: 'uz');
    handler.next(options);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 403 || response.statusCode == 401) {
      if (SharedPreferenceManager.getString(LocalKeys.accessToken)
          .replaceAll('Bearer', '')
          .trim()
          .isNotEmpty) {
        response.requestOptions.headers['Authorization'] =
            SharedPreferenceManager.getString(LocalKeys.accessToken);
      }
      final resolved = await _resolveResponse(response.requestOptions);
      handler.resolve(resolved);
      return;
    }
    handler.next(response);
  }

  Future<Response<dynamic>> _resolveResponse(RequestOptions options) async {
    final path = options.path.replaceAll(AppConstants.baseUrl, '');
    if (options.data is FormData) {
      FormData formData = FormData();
      final fields = options.data.fields as List<MapEntry<String, String>>;
      formData.fields.addAll(fields);

      for (MapEntry mapFile in options.data.filesPath) {
        formData.files.add(
          MapEntry(
            mapFile.key,
            MultipartFile.fromFileSync(
                fields
                    .firstWhere(
                      (element) => element.key == 'photo_path',
                      orElse: () => const MapEntry('', ''),
                    )
                    .value,
                filename: mapFile.value.filename),
          ),
        );
      }
      options.data = formData;
    }
    return await dio.request(
      AppConstants.baseUrl + path,
      data: options.data,
      queryParameters: options.queryParameters,
      options: Options(
        headers: options.headers,
        method: options.method,
      ),
    );
  }
}
