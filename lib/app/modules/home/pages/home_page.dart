import 'package:flutter/material.dart';
import 'package:indexator/app/core/data/breakpoints.dart';
import 'package:indexator/app/core/widgets/mobile_app_bar.dart';
import 'package:indexator/app/core/widgets/web_app_bar.dart';

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
          body: const Center(
            child: Text('HOMEPAGE'),
          ),
        );
      },
    );
  }
}
