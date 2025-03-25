import 'package:bloc/bloc.dart';
import 'package:eats/core/extension/extension.dart';
import 'package:eats/core/local_storage/local_keys.dart';
import 'package:eats/injector_container.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/utils.dart';
import '../../../../router/app_routes.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState(loading: false)) {
    on<LoginEvent>(_login);
  }

  Future<void> _login(LoginEvent event, emit) async {
    emit(state.copyWith(loading: true));
    if(event.phone.length < 17 || event.password.isEmpty) {
      event.context.showSnackBar(
        SnackBar(
          content: Text("Пожалуйста, введите данные в целом"),
        ),
      );
      return;
    } else if(event.phone == "+998 94 659 08 50" && event.password == "123456") {
      await hiveBox.put(LocalKeys.userData, "+998 94 659 08 50");
      event.context.go(Routes.home);
    } else {
      event.context.showSnackBar(
        SnackBar(
          content: Text("Неправильный логин или пароль"),
        ),
      );
    }
    emit(state.copyWith(loading: false));
  }
}
