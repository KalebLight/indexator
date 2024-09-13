import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/core/widgets/PageDefault/page_default.dart';
import 'package:indexator/app/core/widgets/loading_widget.dart';
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
      if (controller.authStore.user == null || controller.userStore.user == null) {
        return const SizedBox(
          child: LoadingWidget(
            size: 200,
          ),
        );
      }
      return LayoutBuilder(
        builder: (context, constraints) {
          return const PageDefault(
            body: Center(
              child: Column(
                children: [
                  Text('HOMEPAGE'),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
