import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../global/environment.dart';

class AuthService with ChangeNotifier{

  Future<void> login(String email, String password) async {
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
  }


}