import 'package:eats/core/utils/utils.dart';
import 'package:eats/injector_container.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/local_storage/local_keys.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<SplashEvent>(_initialize);
  }

  void _initialize(SplashEvent event, Emitter<SplashState> emit) async {
    String? phone = await hiveBox.get(LocalKeys.userData);
    await Future.delayed(const Duration(seconds: 2), () {
      emit(state.copyWith(isLogged: phone != null));
    });
  }
}
