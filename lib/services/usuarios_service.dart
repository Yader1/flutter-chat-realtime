import 'package:http/http.dart' as http;

import '../models/usuario.dart';
import '../models/usuarios_response.dart';
import '../global/environment.dart';

import './auth_service.dart';

class UsuariosService {
  Future<List<Usuario>> getUsuarios() async {
    try {
      Uri url = Uri.http(Environment.apiUrl, "/api/usuarios");

      var resp = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'x-token': await AuthService.getToken() ?? ''
        }
      );

      final usuariosRespose = usuariosResponseFromJson(resp.body);
      return usuariosRespose.usuarios;
    } catch (e) {
      return [];
    }
  }
}