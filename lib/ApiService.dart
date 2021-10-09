import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:todoapp/DIService.dart';
import 'package:todoapp/ILocalStorageService.dart';
import 'dart:convert';
import 'dart:async';

import 'IApiService.dart';

class ApiService extends IApiService {
  String _token = '';
  final String _baseUrl = 'http://10.0.2.2:8080/';
  int timeout = 30;
  Map<String, String> _headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  @override
  Future<dynamic> get(String url) async {
    _token = await serviceLocator<ILocalStorageService>().getString("token");
    var responseJson;
    try {
      if (_token != null && _token.isNotEmpty)
        _headers["Authorization"] = 'Bearer $_token';
      final response = await http
          .get(_baseUrl + url, headers: _headers)
          .timeout(Duration(seconds: timeout));

      responseJson = _returnResponse(response);
    } on SocketException {
      throw "";
    } on TimeoutException {
      throw "";
    } on Error {
      throw "";
    }
    return responseJson;
  }

  @override
  Future<dynamic> post(String url, dynamic body) async {
    _token = await serviceLocator<ILocalStorageService>().getString("token");
    var responseJson;
    try {
      if (_token != null && _token.isNotEmpty)
        _headers["Authorization"] = 'Bearer $_token';
      final response = await http
          .post(_baseUrl + url,
              body: body,
              encoding: Encoding.getByName("utf-8"),
              headers: _headers)
          .timeout(Duration(seconds: timeout));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw "";
    } on TimeoutException {
      throw "";
    } on Error {
      throw "";
    }
    return responseJson;
  }

  @override
  Future<dynamic> put(String url) async {
    _token = await serviceLocator<ILocalStorageService>().getString("token");
    var responseJson;
    try {
      if (_token != null && _token.isNotEmpty)
        _headers[HttpHeaders.authorizationHeader] = 'Bearer $_token';
      final response = await http
          .put(_baseUrl + url,
              encoding: Encoding.getByName("utf-8"), headers: _headers)
          .timeout(Duration(seconds: timeout));
      //responseJson = _returnResponse(response);
    } on SocketException {
      throw "";
    } on TimeoutException {
      throw "";
    } on Error {
      throw "";
    }

    return responseJson;
  }

  @override
  Future<dynamic> delete(String url) async {
    _token = await serviceLocator<ILocalStorageService>().getString("token");
    var apiResponse;
    try {
      if (_token != null && _token.isNotEmpty)
        _headers[HttpHeaders.authorizationHeader] = 'Bearer $_token';
      final response = await http.delete(_baseUrl + url, headers: _headers);
      //apiResponse = _returnResponse(response);
    } on SocketException {
      throw "";
    } on TimeoutException {
      throw "";
    } on Error {
      throw "";
    }

    return apiResponse;
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
    case 201:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    case 204:
      return "";
    case 400:
      throw "";
    case 401:
    case 403:
      throw "";
    case 500:
    default:
      throw "";
  }
}
