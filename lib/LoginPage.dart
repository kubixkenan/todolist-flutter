import 'package:flutter/material.dart';
import 'package:todoapp/LoginRequestModel.dart';
import 'DIService.dart';
import 'IAuthService.dart';
import 'TodoPage.dart';

class LoginView extends StatefulWidget {
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginView> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                        obscureText: false,
                        controller: _emailController,
                        decoration: InputDecoration(
                            hintText: "E-Mail", icon: Icon(Icons.email))),
                    SizedBox(height: 20),
                    TextField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                            hintText: "E-Mail", icon: Icon(Icons.vpn_key))),
                    SizedBox(height: 20),
                    TextButton(
                        child: Text('Giriş'),
                        onPressed: () async {
                          LoginRequestModel requestModel = LoginRequestModel(
                              email: _emailController.text,
                              password: _passwordController.text);
                          var _service =
                              serviceLocator<IAuthenticationService>();
                          bool result = await _service.login(requestModel);
                          if (result) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TodoView()));
                          } else {}
                        })
                  ]))),
    );
  }
}
