import 'package:get_it/get_it.dart';
import 'package:todoapp/AuthService.dart';
import 'package:todoapp/IAuthService.dart';
import 'package:todoapp/ITodoService.dart';
import 'package:todoapp/TodoService.dart';

import 'ApiService.dart';
import 'IApiService.dart';
import 'ILocalStorageService.dart';
import 'LocalStorageService.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // services
  serviceLocator.registerLazySingleton<IApiService>(() => ApiService());
  serviceLocator
      .registerLazySingleton<ILocalStorageService>(() => LocalStorageService());
  serviceLocator.registerLazySingleton<IAuthenticationService>(
      () => AuthenticationService());
  serviceLocator.registerLazySingleton<ITodoService>(() => TodoService());
}
