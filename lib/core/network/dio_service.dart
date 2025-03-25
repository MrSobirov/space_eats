import 'package:dio/dio.dart';

import '../../injector_container.dart';

class DioService {
  static Dio get dioClient => serviceLocator<Dio>(instanceName: 'default');
}
