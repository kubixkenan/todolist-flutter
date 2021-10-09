import 'LoginRequestModel.dart';

abstract class IAuthenticationService {
  Future<bool> login(LoginRequestModel model);
}
