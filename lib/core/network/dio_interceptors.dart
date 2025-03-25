import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../../router/app_routes.dart';
import '../local_storage/local_value.dart';

class AuthInterceptor extends Interceptor {
  final Box hiveBox;
  final Dio dio;
  final List<RequestOptions> _requestQueue = [];

  AuthInterceptor({
    required this.hiveBox,
    required this.dio,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Authorization"] = LocalValues.accessToken;
    options.headers["x-lang"] = LocalValues.language;
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // We need to check if the request is for refresh token
      final bool isRefreshTokenRequest =
          err.requestOptions.path == '/auth/tokens/refresh';

      if (isRefreshTokenRequest) {
        _handleUnauthorized();
        return;
      }
      _requestQueue.add(err.requestOptions);
    } else {
      return handler.next(err);
    }
  }

  void _handleUnauthorized() async {
    await hiveBox.clear();
    AppRoutes.router.go(Routes.auth);
  }
}
