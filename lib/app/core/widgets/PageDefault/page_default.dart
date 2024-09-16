import 'package:flutter/material.dart';
import 'package:indexator/app/core/data/breakpoints.dart';
import 'package:indexator/app/core/data/colors_data.dart';
import 'package:indexator/app/core/widgets/AppBar/drawer_mobile_app_bar.dart';
import 'package:indexator/app/core/widgets/AppBar/drawer_web_app_bar.dart';
import 'package:indexator/app/core/widgets/AppBar/mobile_app_bar.dart';
import 'package:indexator/app/core/widgets/AppBar/web_app_bar.dart';

class PageDefault extends StatelessWidget {
  final Widget body;
  const PageDefault({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: ColorsData.offWhite,
        appBar: constraints.maxWidth < mobileBreakpoint
            ? PreferredSize(preferredSize: const Size(double.infinity, 52), child: MobileAppBar())
            : PreferredSize(preferredSize: const Size(double.infinity, 72), child: WebAppBar()),
        drawer: constraints.maxWidth < mobileBreakpoint ? const DrawerMobileAppBar() : const DrawerWebAppBar(),
        body: body,
      );
    });
  }
}
