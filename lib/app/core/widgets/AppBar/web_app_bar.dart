import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/core/data/colors_data.dart';
import 'package:indexator/app/core/data/font_data.dart';
import 'package:indexator/app/core/data/utils.dart';
import 'package:indexator/app/modules/profile/controllers/profile_controller.dart';

class WebAppBar extends StatelessWidget {
  WebAppBar({super.key});
  final profileController = Modular.get<ProfileController>();

  @override
  Widget build(BuildContext context) {
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
        PopupMenuButton<int>(
          padding: EdgeInsets.zero,
          icon: profileController.userStore.user!.profilePhoto != ''
              ? CircleAvatar(
                  backgroundImage: NetworkImage(profileController.userStore.user!.profilePhoto!), // Imagem do usuário
                )
              : CircleAvatar(
                  child: Text(
                    getInitials(profileController.userStore.user!.name!),
                  ),
                ),
          onSelected: (value) async {
            if (value == 1) {
              Modular.to.pushNamed('profilePage');
            } else if (value == 2) {
              await profileController.logout();
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 1,
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: ColorsData.gunmetal,
                  ),
                  SizedBox(width: 4),
                  Text("Profile"),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 2,
              child: Row(
                children: [
                  Icon(
                    Icons.logout,
                    color: ColorsData.gunmetal,
                  ),
                  SizedBox(width: 4),
                  Text("Sign out"),
                ],
              ),
            ),
          ],
        ),
      ]),
      iconTheme: const IconThemeData(color: ColorsData.primary),
    );
  }
}
