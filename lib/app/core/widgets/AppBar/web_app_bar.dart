import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/core/data/colors_data.dart';
import 'package:indexator/app/core/data/font_data.dart';
import 'package:indexator/app/modules/profile/controllers/profile_controller.dart';

class WebAppBar extends StatelessWidget {
  const WebAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Modular.get<ProfileController>();
    return AppBar(
      backgroundColor: ColorsData.gunmetal,
      toolbarHeight: 72,
      title: Row(children: [
        TextButton(
            onPressed: () {
              Modular.to.pushNamed('/');
            },
            child: Text('Indexator', style: FontData.body3(ColorsData.white_1))),
        const Expanded(child: SizedBox.shrink()),
        SizedBox(
          height: 38,
          child: OutlinedButton(
            onPressed: () async {
              await profileController.logout();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(width: 3.0, color: Colors.white),
            ),
            child: const Text('Sair'),
          ),
        ),
      ]),
      iconTheme: const IconThemeData(color: ColorsData.primary),
    );
  }
}
