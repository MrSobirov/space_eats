part of 'splash_bloc.dart';

class SplashState extends Equatable {
  const SplashState({this.isLogged = false});

  final bool isLogged;

  @override
  List<Object?> get props => [isLogged];

  SplashState copyWith({
    bool? isLogged,
  }) {
    return SplashState(
      isLogged: isLogged ?? this.isLogged,
    );
  }
}
