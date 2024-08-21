import 'package:flutter/material.dart';
import 'package:indexator/app/core/data/breakpoints.dart';
import 'package:indexator/app/core/widgets/AppBar/drawer_mobile_app_bar.dart';
import 'package:indexator/app/core/widgets/AppBar/drawer_web_app_bar.dart';
import 'package:indexator/app/core/widgets/AppBar/mobile_app_bar.dart';
import 'package:indexator/app/core/widgets/AppBar/web_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: constraints.maxWidth < mobileBreakpoint
              ? const PreferredSize(preferredSize: Size(double.infinity, 52), child: MobileAppBar())
              : const PreferredSize(preferredSize: Size(double.infinity, 72), child: WebAppBar()),
          drawer: constraints.maxWidth < mobileBreakpoint ? const DrawerMobileAppBar() : const DrawerWebAppBar(),
          body: const Center(
            child: Text('HOMEPAGE'),
          ),
        );
      },
    );
  }
}
