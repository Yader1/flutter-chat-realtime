import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../global/environment.dart';
import '../models/login_response.dart';
import '../models/usuario.dart';

class AuthService with ChangeNotifier{

  Usuario? usuario;
  bool _autenticando = false;

  bool get autenticando => _autenticando;
  set autenticando(bool valor){
    _autenticando = valor;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    autenticando = true;

    var data = {
      'email': email,
      'password': password
    };

    Uri url = Uri.http(Environment.apiUrl, "/api/login");

    var resp = await http.post(
      url,
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json'
      }
    );

    log(resp.body);
    autenticando = false;

    if(resp.statusCode == 200){
      final loginResponse = loginResponseFromJson(resp.body);
      usuario = loginResponse.usuario;

      return true;
    } else {

      return false;
    }
  }
}