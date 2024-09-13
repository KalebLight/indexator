import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/core/repositories/user_repository.dart';
import 'package:indexator/app/core/store/auth_store.dart';
import 'package:indexator/app/core/store/user_store.dart';
import 'package:indexator/app/modules/auth/auth_module.dart';
import 'package:indexator/app/modules/auth/pages/init_page.dart';
import 'package:indexator/app/modules/home/controllers/home_controller.dart';
import 'package:indexator/app/modules/home/home_module.dart';
import 'package:indexator/app/modules/profile/controllers/profile_controller.dart';
import 'package:indexator/app/modules/websites/controllers/websites_controller.dart';
import 'package:indexator/app/modules/websites/repositories/url_repository.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    //Controllers
    Bind((i) => WebsitesController(i())),
    Bind((i) => ProfileController(i())),
    Bind((i) => HomeController(i(), i())),

    //Repositories
    Bind((i) => UrlRepository()),
    Bind((i) => UserRepository()),

    //Stores
    Bind((i) => UserStore(i())),
    Bind((i) => AuthStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const InitPage()),
    ModuleRoute("/auth/", module: AuthModule()),
    ModuleRoute("/home/", module: HomeModule()),
  ];
}
