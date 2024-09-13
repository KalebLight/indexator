import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/core/data/colors_data.dart';
import 'package:indexator/app/core/data/font_data.dart';
import 'package:indexator/app/core/data/images_paths.dart';
import 'package:indexator/app/core/widgets/AppBar/drawer_item.dart';
import 'package:indexator/app/core/widgets/divider.dart';

class DrawerWebAppBar extends StatelessWidget {
  const DrawerWebAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsData.offWhite,
      child: ListView(
        children: [
          SizedBox(
            height: 100,
            child: InkWell(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                child: Image.asset(
                  ImagesPaths.indx,
                ),
              ),
              onTap: () {
                Modular.to.pushNamed('/');
              },
            ),
          ),
          const DividerDefault(),
          const SizedBox(height: 12),
          DrawerItem(
            icon: Icons.home,
            title: 'Home',
            onTap: () {
              Modular.to.pushNamed('/');
            },
          ),
          DrawerItem(
            icon: Icons.link,
            title: 'Websites',
            onTap: () {
              Modular.to.pushNamed('websites');
            },
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              'Tools',
              style: FontData.body3(ColorsData.gunmetal),
            ),
          ),
          const SizedBox(height: 4),
          DrawerItem(
            icon: Icons.download,
            title: 'QuickDexing',
            onTap: () {},
          ),
          DrawerItem(
            icon: Icons.cancel_outlined,
            title: 'Deindexing',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
