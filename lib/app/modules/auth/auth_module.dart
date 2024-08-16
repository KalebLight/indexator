import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/modules/auth/controllers/auth_controller.dart';
import 'package:indexator/app/modules/auth/pages/login_page.dart';
import 'package:indexator/app/modules/auth/repositories/auth_repository.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => AuthRepository()),
    Bind((i) => AuthController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const LoginPage()),
  ];
}
