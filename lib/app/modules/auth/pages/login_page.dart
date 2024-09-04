import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                      const SizedBox(height: 18),
                      InkWell(
                        onTap: () {
                          loginController.googleSignIn(context);
                        },
                        child: IntrinsicWidth(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  color: ColorsData.white_1,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.google,
                                  color: ColorsData.baseWhite,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Sign In with Google',
                                  style: FontData.bodyEmphasis2(
                                    ColorsData.white_1,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () {
                          loginController.logoutGoogle();
                        },
                        child: Text('Logout Teste', style: FontData.textLink()),
                      ),
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
            ),
          );
        },
      ),
    );
  }
}
