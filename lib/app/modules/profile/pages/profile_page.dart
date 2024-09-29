import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/core/data/breakpoints.dart';
import 'package:indexator/app/core/data/colors_data.dart';
import 'package:indexator/app/core/data/font_data.dart';
import 'package:indexator/app/core/data/utils.dart';
import 'package:indexator/app/core/store/user_store.dart';
import 'package:indexator/app/core/widgets/PageDefault/page_default.dart';
import 'package:indexator/app/core/widgets/button_default.dart';
import 'package:indexator/app/core/widgets/loading_widget.dart';
import 'package:indexator/app/core/widgets/textfield_web.dart';
import 'package:indexator/app/modules/home/controllers/home_controller.dart';
import 'package:indexator/app/modules/profile/controllers/profile_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = Modular.get<ProfileController>();
  final homeController = Modular.get<HomeController>();
  final userStore = Modular.get<UserStore>();

  @override
  void initState() {
    super.initState();
    if (controller.userStore.user == null) {
      controller.userStore.getUserData().then((_) {
        controller.userEmail.text = controller.userStore.user?.email ?? '';
        controller.userName.text = controller.userStore.user?.name ?? '';
      });
    } else {
      controller.userName.text = controller.userStore.user!.name!;
      controller.userEmail.text = controller.userStore.user!.email!;
    }
  }

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
      return LayoutBuilder(builder: (context, constraints) {
        return PageDefault(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 24, left: 36, right: 36),
                  width: constraints.maxWidth < mobileBreakpoint ? 350 : 500,
                  height: 350,
                  decoration: BoxDecoration(
                    boxShadow: [boxShadowDefault_1],
                    color: ColorsData.white_1,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Profile',
                        style: FontData.headline1(ColorsData.black_1),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Text(
                            'Name',
                            style: FontData.bodyEmphasis2(ColorsData.black_1),
                          ),
                          Text(
                            '*',
                            style: FontData.bodyEmphasis2(ColorsData.danger),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      TextfieldWeb(
                        hintText: 'Name',
                        inputType: TextInputType.name,
                        textEditingController: controller.userName,
                        fillColor: ColorsData.lightGray2,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Text(
                            'Email',
                            style: FontData.bodyEmphasis2(ColorsData.black_1),
                          ),
                          Text(
                            '*',
                            style: FontData.bodyEmphasis2(ColorsData.danger),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      TextfieldWeb(
                        hintText: 'Email',
                        inputType: TextInputType.emailAddress,
                        textEditingController: controller.userEmail,
                        fillColor: ColorsData.lightGray2,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonDefault(
                            onTap: () {
                              controller.updateUser();
                            },
                            label: 'Update',
                            status: controller.state,
                            backgroundColor: ColorsData.primary,
                            width: 150,
                          ),
                          const SizedBox(width: 8),
                          ButtonDefault(
                            onTap: () {
                              if (Modular.to.canPop()) {
                                Modular.to.pop();
                              } else {
                                Modular.to.pushNamed('/');
                              }
                            },
                            label: 'Cancelar',
                            backgroundColor: ColorsData.lightGray,
                            textColor: ColorsData.white_1,
                            width: 150,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      });
    });
  }
}
