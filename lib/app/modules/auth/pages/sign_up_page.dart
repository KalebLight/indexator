import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/core/data/colors_data.dart';
import 'package:indexator/app/core/data/font_data.dart';
import 'package:indexator/app/core/widgets/button_default.dart';
import 'package:indexator/app/core/widgets/textfield_web.dart';
import 'package:indexator/app/modules/auth/controllers/auth_controller.dart';
import 'package:indexator/app/modules/auth/controllers/sign_up_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final controller = Modular.get<SignUpController>();
  final authController = Modular.get<AuthController>();
  @override
  void dispose() {
    controller.userName.clear();
    controller.userEmail.clear();
    controller.userPassword.clear();
    controller.userConfirmationPassword.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Container(
              width: 400,
              height: 400,
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
                      hintText: 'Digite seu nome',
                      inputType: TextInputType.name,
                      textEditingController: controller.userName,
                    ),
                    const SizedBox(height: 14),
                    TextfieldWeb(
                      hintText: 'Digite seu email',
                      inputType: TextInputType.emailAddress,
                      textEditingController: controller.userEmail,
                    ),
                    const SizedBox(height: 14),
                    TextfieldWeb(
                      hintText: 'Digite uma senha',
                      inputType: TextInputType.visiblePassword,
                      obscureText: true,
                      textEditingController: controller.userPassword,
                    ),
                    const SizedBox(height: 14),
                    TextfieldWeb(
                      hintText: 'Confirme sua senha',
                      inputType: TextInputType.visiblePassword,
                      obscureText: true,
                      textEditingController: controller.userConfirmationPassword,
                    ),
                    const SizedBox(height: 24),
                    ButtonDefault(
                      onTap: () {
                        controller.register(context);
                      },
                      label: 'Cadastrar',
                      status: controller.state,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Já possui uma conta?',
                          style: FontData.bodyEmphasis2(ColorsData.white_1),
                        ),
                        const SizedBox(width: 4),
                        TextButton(
                          onPressed: () {
                            authController.goToLogin();
                          },
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(50, 30),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              alignment: Alignment.centerLeft),
                          child: Text('Fazer login!', style: FontData.textLink()),
                        ),
                      ],
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
