part of 'app_routes.dart';

sealed class Routes {
  Routes._();

  static const String initial = '/';

  /// Home
  static const String homePage = '/homePage';
  static const String splash = '/splash';
  static const String welcome = '/welcome';
  static const String auth = '/auth';

}
