import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../global/environment.dart';
import '../models/usuario.dart';
import '../models/mensajes_response.dart';
import 'auth_service.dart';

class ChatService with ChangeNotifier{
  Usuario? usuarioPara;

  Future<List<Mensaje>> getChat(String usuarioID) async {
    Uri url = Uri.http(Environment.apiUrl, "/api/mensajes/$usuarioID");

    var resp = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken() ?? ''
      }
    );

    final mensajesResp = mensajesResponseFromJson(resp.body);

    return mensajesResp.mensajes;
  }
}