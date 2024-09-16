import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:indexator/app/core/widgets/button_default.dart';
import 'package:indexator/app/core/widgets/textfield_web.dart';
import 'package:indexator/app/modules/websites/controllers/websites_controller.dart';

class NewUrlPopup extends StatefulWidget {
  const NewUrlPopup({super.key});

  @override
  State<NewUrlPopup> createState() => _NewUrlPopupState();
}

class _NewUrlPopupState extends State<NewUrlPopup> {
  @override
  Widget build(BuildContext context) {
    final urlController = Modular.get<WebsitesController>();

    return AlertDialog(
      title: const Text(
        'Adicione uma URL',
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        height: 150,
        width: 400,
        child: Column(
          children: [
            TextfieldWeb(
              hintText: 'Digite a URL',
              inputType: TextInputType.url,
              textEditingController: urlController.newUrlController,
            ),
            const SizedBox(height: 40),
            ButtonDefault(
              onTap: () async {
                await urlController.addUrl();
              },
              label: 'Adicionar URL',
              status: urlController.state,
            ),
          ],
        ),
      ),
    );
  }
}



// Align(
//       child: Container(
//         height: 300,
//         width: 400,
//         padding: const EdgeInsets.all(10),
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//           color: ColorsData.white_1,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('Adicione uma URL'),
            // TextfieldWeb(
            //   hintText: 'Digite a URL',
            //   inputType: TextInputType.url,
            //   textEditingController: urlController.newUrlController,
            // ),
            // SizedBox(height: 40),
            // ButtonDefault(
            //   onTap: () async {
            //     await urlController.addUrl();
            //   },
            //   label: 'Login',
            //   status: urlController.state,
            // ),
    //       ],
    //     ),
    //   ),
    // );