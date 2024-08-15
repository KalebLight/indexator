import 'package:flutter/material.dart';

import 'package:indexator/app/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Indexator',
      debugShowCheckedModeBanner: true,
      routerDelegate: routes.routerDelegate,
      routeInformationParser: routes.routeInformationParser,
      routeInformationProvider: routes.routeInformationProvider,
      theme: ThemeData.light(),
    );
  }
}
