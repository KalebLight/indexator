import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/core/data/colors_data.dart';
import 'package:indexator/app/core/data/images_paths.dart';
import 'package:indexator/app/core/widgets/AppBar/drawer_item.dart';

class DrawerWebAppBar extends StatelessWidget {
  const DrawerWebAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsData.offWhite,
      child: ListView(
        children: [
          Container(
            height: 100,
            child: InkWell(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                child: Container(
                  child: Image.asset(
                    ImagesPaths.indx,
                  ),
                ),
              ),
              onTap: () {
                Modular.to.pushNamed('/');
              },
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey,
          ),
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
        ],
      ),
    );
  }
}
