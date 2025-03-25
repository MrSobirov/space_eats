import '../../../../core/utils/typedefs.dart';
import '../entities/auth_entity.dart';

abstract class AuthRepository {
  ResultFuture<AuthEntity> login(
      {required String phone,
      required String password,
      });

}
