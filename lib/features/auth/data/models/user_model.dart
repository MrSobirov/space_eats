import '../../domain/entities/user_entity.dart';

class UserModel {
  final String id;
  final String name;
  final int balance;

  UserModel({
    required this.id,
    required this.name,
    required this.balance,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    name: json["name"],
    balance: json["balance"],
  );

  UserDataEntity toEntity() => UserDataEntity(
    id: id,
    name: name,
    balance: balance,
  );
}
