import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/core/data/breakpoints.dart';
import 'package:indexator/app/core/data/colors_data.dart';
import 'package:indexator/app/core/data/font_data.dart';
import 'package:indexator/app/core/widgets/PageDefault/page_default.dart';
import 'package:indexator/app/core/widgets/loading_widget.dart';
import 'package:indexator/app/modules/websites/controllers/websites_controller.dart';
import 'package:indexator/app/modules/websites/widgets/new_url_pop_up.dart';

class WebsitesPage extends StatefulWidget {
  const WebsitesPage({super.key});

  @override
  State<WebsitesPage> createState() => _WebsitesPageState();
}

class _WebsitesPageState extends State<WebsitesPage> {
  final controller = Modular.get<WebsitesController>();

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
          return PageDefault(
              body: ListView(
            children: [
              const SizedBox(height: 100),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: constraints.maxWidth < mobileBreakpoint ? 400 : 700,
                  height: 300,
                  decoration: const BoxDecoration(
                    color: ColorsData.timberwolf,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          controller.listSitesGSC();
                        },
                        child: Text(
                          'Testar Site List',
                          style: FontData.bodyEmphasis1(ColorsData.success),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ));
        },
      );
    });
  }
}
