part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool loading;

  const AuthState({
    required this.loading,
  });

  @override
  List<Object?> get props => [
    loading,
  ];

  AuthState copyWith({
    bool? loading,
  }) {
    return AuthState(
      loading: loading ?? this.loading,
    );
  }
}