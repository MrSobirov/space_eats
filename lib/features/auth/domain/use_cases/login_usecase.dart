import '../../../../core/use_cases/base_usecase.dart';
import '../../../../core/utils/typedefs.dart';
import '../entities/auth_entity.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase extends UseCaseWithParams<AuthEntity, LoginParams> {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  @override
  ResultFuture<AuthEntity> call(LoginParams params) async =>
      _authRepository.login(
        phone: params.phone,
        password: params.password,
      );
}

class LoginParams {
  final String phone;
  final String password;

  LoginParams(
      {required this.phone,
      required this.password
      });
}
