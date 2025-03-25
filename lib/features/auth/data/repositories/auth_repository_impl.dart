import 'package:eats/features/auth/domain/entities/auth_entity.dart';

import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure_handler.dart';
import '../../../../core/utils/either.dart';
import '../../../../core/utils/typedefs.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);

  @override
  ResultFuture<AuthEntity> login({required String phone, required String password}) async {
    try {
      final result = await _authRemoteDataSource.login(phone: phone, password: password);
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    } on DioFailure catch (e) {
      return Left(DioFailure(errorMessage: e.errorMessage));
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    }
  }


}
