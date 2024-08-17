import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/core/data/colors_data.dart';
import 'package:indexator/app/core/data/font_data.dart';
import 'package:indexator/app/core/data/utils.dart';
import 'package:indexator/app/core/data/validators.dart';
import 'package:indexator/app/core/widgets/button_default.dart';
import 'package:indexator/app/core/widgets/textfield_web.dart';
import 'package:indexator/app/modules/auth/controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Modular.get<LoginController>();

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
                        hintText: 'E-mail',
                        inputType: TextInputType.emailAddress,
                        textEditingController: controller.userEmail,
                        validator: Validators.emailValidator,
                      ),
                      const SizedBox(height: 14),
                      TextfieldWeb(
                        hintText: 'Senha',
                        inputType: TextInputType.visiblePassword,
                        obscureText: true,
                        textEditingController: controller.userPassword,
                        validator: Validators.passwordValidatorLogin,
                      ),
                      const SizedBox(height: 24),
                      ButtonDefault(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            await controller.login(controller.userEmail.text, controller.userPassword.text, context);
                          }
                        },
                        label: 'Login',
                        status: controller.state,
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: () {
                          goToSignUp();
                        },
                        child: Text('Não tem uma conta? Registre-se!', style: FontData.textLink()),
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
