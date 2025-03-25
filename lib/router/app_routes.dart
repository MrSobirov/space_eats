import 'package:eats/features/auth/presentation/pages/auth_page.dart';
import 'package:eats/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:eats/features/splash/presentation/pages/welcome_page.dart';
import 'package:go_router/go_router.dart';

import '../core/utils/utils.dart';
import '../features/splash/presentation/bloc/splash_bloc.dart';
import '../features/splash/presentation/pages/splash_page.dart';
import '../injector_container.dart';

part 'routes_name.dart';

final GlobalKey<NavigatorState> parentNavigatorKey = GlobalKey<NavigatorState>();

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

sealed class AppRoutes {
  AppRoutes._();

  static BuildContext? get ctx =>
      router.routerDelegate.navigatorKey.currentContext;

  static GoRouter router = GoRouter(
    navigatorKey: parentNavigatorKey,
    routes: <RouteBase>[
      /// Initial page
      GoRoute(
        path: Routes.initial,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              serviceLocator<SplashBloc>()..add(SplashEvent(context: context)),
          child: const SplashPage(),
        ),
      ),
      GoRoute(
        path: Routes.welcome,
        builder: (context, state) => WelcomePage(),
      ),
      GoRoute(
        path: Routes.auth,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthBloc(),
          child: const AuthPage(),
        ),
      ),
    ],
  );
}

class FadePageRoute<T> extends PageRouteBuilder<T> {
  FadePageRoute({required this.builder})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        );
  final WidgetBuilder builder;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 1000);
}

class CustomMaterialPageRoute extends MaterialPageRoute {
  @override
  @protected
  bool get hasScopedWillPopCallback {
    return false;
  }

  CustomMaterialPageRoute({
    required super.builder,
    super.settings,
    super.maintainState,
    super.fullscreenDialog,
  });
}
