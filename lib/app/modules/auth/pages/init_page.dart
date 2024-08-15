import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:indexator/app/core/data/utils.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  void initState() {
    super.initState();
    verifToken().then((value) {
      if (value) {
        GoRouter.of(context).pushReplacement('/');
      } else {
        GoRouter.of(context).pushReplacement('/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
