import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/error/error_handler.dart';
import '../models/auth_model.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;

  const AuthRemoteDataSourceImpl(this._dio);

  @override
  Future<AuthModel> login({
    required String phone,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/otp/validate',
        data: {
          "phone": phone,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        return AuthModel.fromJson(response.data);
      } else {
        throw ServerException.fromJson(response.data);
      }
    } on ServerException {
      rethrow;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        throw ServerException(errorMessage: "Connection error", statusCode: 408);
      } else {
        throw ServerException.fromJson(e.response?.data);
      }
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    } catch (e, s) {
      debugPrint("$e $s");
      throw ParsingException(errorMessage: e.toString());
    }
  }
}
