import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/core/data/colors_data.dart';
import 'package:indexator/app/core/widgets/AppBar/drawer_item.dart';

class DrawerWebAppBar extends StatelessWidget {
  const DrawerWebAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsData.offWhite,
      child: ListView(
        children: [
          DrawerHeader(
            child: DecoratedBox(
              decoration: const BoxDecoration(),
              child: Column(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: const BoxDecoration(
                      color: ColorsData.primary,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                  )
                ],
              ),
            ),
          ),
          DrawerItem(
            icon: Icons.home,
            title: 'Home',
            onTap: () {
              Modular.to.pushNamed('/');
            },
          ),
          DrawerItem(
            icon: Icons.link,
            title: 'Controle de URLs',
            onTap: () {
              Modular.to.pushNamed('urls');
            },
          ),
        ],
      ),
    );
  }
}
