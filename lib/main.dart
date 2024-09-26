import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:indexator/app/app_module.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter(); // Inicializa o Hive no Flutter Web ou Mobile
  await Hive.openBox('userBox'); // Cria ou abre uma box (caixa) para armazenar dados

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ModularApp(
      module: AppModule(),
      child: MaterialApp.router(
        title: 'Indexator',
        debugShowCheckedModeBanner: false,
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
        theme: ThemeData.light(),
      ),
    );
  }
}
