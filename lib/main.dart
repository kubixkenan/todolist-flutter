import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todoapp/ILocalStorageService.dart';
import 'package:todoapp/LoginPage.dart';
import 'package:todoapp/TodoPage.dart';
import 'DIService.dart';

GetIt serviceLocator = GetIt.instance;
void main() {
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    Future<String> token =
        serviceLocator<ILocalStorageService>().getString("token");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
          builder: (context, AsyncSnapshot<String> snapshot) {
            if (!snapshot.hasData) {
              return Container(color: Colors.white);
            } else {
              if (snapshot.data.length > 0) {
                return new TodoView();
              } else {
                return new LoginView();
              }
            }
          },
          future: token),
    );
  }
}
