import 'package:flutter/material.dart';

import '../pages/usuarios_page.dart';
import '../pages/register_page.dart';
import '../pages/login_page.dart';
import '../pages/chat_page.dart';
import '../pages/loading_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'chat'    : ( _ ) => ChatPage(),
  'loading' : ( _ ) => LoadingPage(),
  'login'   : ( _ ) => LoginPage(),
  'register': ( _ ) => RegisterPage(),
  'usuarios': ( _ ) => UsuariosPage(),
};