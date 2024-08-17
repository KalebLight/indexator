import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/core/data/colors_data.dart';
import 'package:indexator/app/core/data/font_data.dart';
import 'package:indexator/app/core/data/utils.dart';
import 'package:indexator/app/core/widgets/button_default.dart';
import 'package:indexator/app/core/widgets/textfield_web.dart';
import 'package:indexator/app/modules/auth/controllers/sign_up_controller.dart';

import '../../../core/data/validators.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final controller = Modular.get<SignUpController>();
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
            child: IntrinsicHeight(
              child: Container(
                width: 400,
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
                        validator: Validators.nameValidator,
                        hintText: 'Digite seu nome',
                        inputType: TextInputType.name,
                        textEditingController: controller.userName,
                      ),
                      const SizedBox(height: 14),
                      TextfieldWeb(
                        validator: Validators.emailValidator,
                        hintText: 'Digite seu email',
                        inputType: TextInputType.emailAddress,
                        textEditingController: controller.userEmail,
                      ),
                      const SizedBox(height: 14),
                      TextfieldWeb(
                        validator: Validators.passwordValidatorSignUp,
                        hintText: 'Digite uma senha',
                        inputType: TextInputType.visiblePassword,
                        obscureText: true,
                        textEditingController: controller.userPassword,
                      ),
                      const SizedBox(height: 14),
                      TextfieldWeb(
                        validator: (value) => Validators.cPasswordValidatorSignUp(controller.userPassword.text, value!),
                        hintText: 'Confirme sua senha',
                        inputType: TextInputType.visiblePassword,
                        obscureText: true,
                        textEditingController: controller.userConfirmationPassword,
                      ),
                      const SizedBox(height: 24),
                      ButtonDefault(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            controller.register(context);
                          }
                        },
                        label: 'Cadastrar',
                        status: controller.state,
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: () {
                          goToLogin();
                        },
                        child: Text('Já possui uma conta? Faça o Login!', style: FontData.textLink()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
