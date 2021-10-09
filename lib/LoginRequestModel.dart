import 'dart:convert';

class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({this.email, this.password});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  static LoginRequestModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return LoginRequestModel(
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  static LoginRequestModel fromJson(String source) =>
      fromMap(json.decode(source));
}
