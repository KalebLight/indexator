import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/core/data/colors_data.dart';
import 'package:indexator/app/core/data/font_data.dart';

class MobileAppBar extends StatelessWidget {
  const MobileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: ColorsData.gunmetal,
      title: TextButton(
        onPressed: () {
          Modular.to.pushNamed('/');
        },
        child: Text(
          'Indexator',
          style: FontData.body3(ColorsData.white_1),
        ),
      ),
      iconTheme: const IconThemeData(color: ColorsData.primary),
    );
  }
}
