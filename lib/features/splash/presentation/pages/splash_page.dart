import 'package:eats/core/extension/extension.dart';
import 'package:eats/core/utils/utils.dart';
import 'package:eats/router/app_routes.dart';
import 'package:go_router/go_router.dart';

import '../bloc/splash_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if(state.isLogged) {
            context.go(Routes.home);
          } else {
            context.go(Routes.welcome);
          }
        },
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "SpaceEats",
                    style: context.textStyle.audioWide().copyWith(
                      fontSize: 32.sp,
                    ),
                  ),
                ),
              ),
              CircularProgressIndicator(
                color: context.appColors.primary,
              ),
              46.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
