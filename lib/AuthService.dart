import 'package:todoapp/ApiService.dart';
import 'package:todoapp/IApiService.dart';
import 'package:todoapp/ILocalStorageService.dart';

import 'IAuthService.dart';
import 'LoginRequestModel.dart';
import 'DIService.dart';

class AuthenticationService extends IAuthenticationService {
  @override
  Future<bool> login(LoginRequestModel model) async {
    var data = await serviceLocator<IApiService>()
        .post("api/Auth/Login", model.toJson());
    if (data['token'] != null) {
      var token = data['token'];
      await serviceLocator<ILocalStorageService>().setString("token", token);
      return true;
    } else {
      return false;
    }
  }
}
