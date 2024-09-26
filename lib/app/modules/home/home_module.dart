import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/core/repositories/user_repository.dart';
import 'package:indexator/app/core/store/user_store.dart';
import 'package:indexator/app/modules/home/controllers/home_controller.dart';
import 'package:indexator/app/modules/home/pages/home_page.dart';
import 'package:indexator/app/modules/profile/controllers/profile_controller.dart';
import 'package:indexator/app/modules/profile/pages/profile_page.dart';
import 'package:indexator/app/modules/websites/pages/websites_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    //controllers
    Bind((i) => HomeController(i(), i())),
    Bind((i) => ProfileController(i(), i())),

    //Stores
    Bind.lazySingleton((i) => UserStore(i.get<UserRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
    ChildRoute("/websites", child: (_, __) => const WebsitesPage()),
    ChildRoute("/profilePage", child: (_, __) => const ProfilePage()),
  ];
}
