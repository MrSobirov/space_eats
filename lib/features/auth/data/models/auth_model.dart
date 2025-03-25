import 'package:eats/features/auth/data/models/user_model.dart';

import '../../domain/entities/auth_entity.dart';

class AuthModel {
  final String accessToken;
  final UserModel userModel;
  final String refreshToken;

  AuthModel({
    required this.accessToken,
    required this.userModel,
    required this.refreshToken,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      accessToken: json['accessToken'],
      userModel: UserModel.fromJson(json['user']),
      refreshToken: json['refreshToken'],
    );
  }

  AuthEntity toEntity() => AuthEntity(
      accessToken: accessToken,
      userEntity: userModel.toEntity(),
  );
}
