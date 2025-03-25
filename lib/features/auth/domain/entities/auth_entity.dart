import 'package:eats/features/auth/domain/entities/user_entity.dart';

class AuthEntity {
  final String accessToken;
  final UserDataEntity userEntity;

  AuthEntity({
    required this.accessToken,
    required this.userEntity,
  });
}
