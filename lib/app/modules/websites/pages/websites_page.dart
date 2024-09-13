import 'package:flutter/material.dart';
import 'package:indexator/app/core/data/breakpoints.dart';
import 'package:indexator/app/core/data/colors_data.dart';
import 'package:indexator/app/core/data/font_data.dart';
import 'package:indexator/app/core/widgets/PageDefault/page_default.dart';
import 'package:indexator/app/modules/websites/widgets/new_url_pop_up.dart';

class WebsitesPage extends StatefulWidget {
  const WebsitesPage({super.key});

  @override
  State<WebsitesPage> createState() => _WebsitesPageState();
}

class _WebsitesPageState extends State<WebsitesPage> {
  @override
  Widget build(BuildContext context) {
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
                        showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (context) {
                              return NewUrlPopup();
                            });
                      },
                      child: Text(
                        '+ Adicionar Website',
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
  }
}
