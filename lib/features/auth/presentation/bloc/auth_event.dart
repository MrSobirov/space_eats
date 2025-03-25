part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class LoginEvent extends AuthEvent {
  final String phone;
  final String password;
  final BuildContext context;

  const LoginEvent({
    required this.phone,
    required this.password,
    required this.context,
  });

  @override
  List<Object?> get props => [phone];
}
