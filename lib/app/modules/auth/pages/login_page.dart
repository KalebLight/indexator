import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/core/data/colors_data.dart';
import 'package:indexator/app/core/data/font_data.dart';
import 'package:indexator/app/core/widgets/button_default.dart';
import 'package:indexator/app/core/widgets/textfield_web.dart';
import 'package:indexator/app/modules/auth/controllers/auth_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Container(
              width: 400,
              height: 300,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: ColorsData.black_1,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextfieldWeb(
                      hintText: 'Digite seu email',
                      inputType: TextInputType.emailAddress,
                      textEditingController: loginController.userEmail,
                    ),
                    const SizedBox(height: 14),
                    TextfieldWeb(
                      hintText: 'Digite uma senha',
                      inputType: TextInputType.visiblePassword,
                      obscureText: true,
                      textEditingController: loginController.userPassword,
                    ),
                    const SizedBox(height: 24),
                    ButtonDefault(
                      onTap: () async {
                        await loginController.login(
                            loginController.userEmail.text, loginController.userPassword.text, context);
                      },
                      label: 'Login',
                      status: loginController.state,
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () {
                        loginController.goToSignUp();
                      },
                      child: Text('Não possui uma conta? Se cadastre!', style: FontData.textLink()),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
