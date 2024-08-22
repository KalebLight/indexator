import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/modules/home/pages/home_page.dart';
import 'package:indexator/app/modules/urls/pages/urls_page.dart';

class HomeModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
    ChildRoute("/urls", child: (_, __) => URLsPage()),
  ];
}
