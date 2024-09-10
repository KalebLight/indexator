import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/core/data/breakpoints.dart';
import 'package:indexator/app/core/widgets/AppBar/drawer_mobile_app_bar.dart';
import 'package:indexator/app/core/widgets/AppBar/drawer_web_app_bar.dart';
import 'package:indexator/app/core/widgets/AppBar/mobile_app_bar.dart';
import 'package:indexator/app/core/widgets/AppBar/web_app_bar.dart';
import 'package:indexator/app/modules/home/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    controller.authStore.loadUser();
  }

  final controller = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.authStore.user == null) {
        return Text('Carregando...');
      }
      return LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            appBar: constraints.maxWidth < mobileBreakpoint
                ? const PreferredSize(preferredSize: Size(double.infinity, 52), child: MobileAppBar())
                : const PreferredSize(preferredSize: Size(double.infinity, 72), child: WebAppBar()),
            drawer: constraints.maxWidth < mobileBreakpoint ? const DrawerMobileAppBar() : const DrawerWebAppBar(),
            body: Center(
              child: Column(
                children: [
                  const Text('HOMEPAGE'),
                  Text(controller.authStore.user!.token),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
