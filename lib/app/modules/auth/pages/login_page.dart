import 'package:flutter/material.dart';
import 'package:indexator/app/core/data/colorsData.dart';
import 'package:indexator/app/core/widgets/button_default.dart';
import 'package:indexator/app/core/widgets/textfield_web.dart';
import 'package:indexator/app/modules/auth/controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AuthController();
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
                      textEditingController: controller.userEmail,
                    ),
                    SizedBox(height: 14),
                    TextfieldWeb(
                      hintText: 'Digite uma senha',
                      inputType: TextInputType.visiblePassword,
                      obscureText: true,
                      textEditingController: controller.userPassword,
                    ),
                    SizedBox(height: 24),
                    ButtonDefault(
                      onTap: () async {
                        await controller.login(controller.userEmail.text, controller.userPassword.text, context);
                        // print(controller.userEmail.text);
                        // print(controller.userPassword.text);
                      },
                      label: 'Login',
                      status: controller.state,
                    )
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
