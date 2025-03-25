import '../models/auth_model.dart';

abstract class AuthRemoteDataSource {

  Future<AuthModel> login(
      {required String phone,
      required String password});

}
