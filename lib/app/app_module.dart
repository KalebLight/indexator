import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/modules/auth/auth_module.dart';
import 'package:indexator/app/modules/auth/pages/init_page.dart';
import 'package:indexator/app/modules/home/home_module.dart';
import 'package:indexator/app/modules/profile/controllers/profile_controller.dart';
import 'package:indexator/app/modules/urls/controllers/urls_controller.dart';
import 'package:indexator/app/modules/urls/repositories/url_repository.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => UrlRepository()),
    Bind((i) => UrlsController(i())),
    Bind((i) => ProfileController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const InitPage()),
    ModuleRoute("/auth/", module: AuthModule()),
    ModuleRoute("/home/", module: HomeModule()),
  ];
}
