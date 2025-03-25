import 'package:equatable/equatable.dart';

class UserDataEntity extends Equatable {
  final String id;
  final String name;
  final int balance;

  const UserDataEntity({
    required this.id,
    required this.name,
    required this.balance,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        balance,
      ];
}