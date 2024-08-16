import 'package:flutter/material.dart';
import 'package:indexator/app/core/data/colors_data.dart';
import 'package:indexator/app/core/data/font_data.dart';

class TextfieldWeb extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;
  final bool? obscureText;
  final TextEditingController textEditingController;
  const TextfieldWeb(
      {super.key,
      required this.hintText,
      required this.inputType,
      this.obscureText,
      required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) async {},
      style: FontData.body3(ColorsData.black_1),
      cursorColor: Colors.black,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, digite o CPF';
        }

        return null;
      },
      controller: textEditingController,
      obscureText: obscureText ?? false,
      keyboardType: inputType,
      decoration: InputDecoration(
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12.0),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12.0),
        ),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2), borderRadius: BorderRadius.circular(12)),
        hintText: hintText,
        // fillColor: controller.state is StatusError
        //     ? ColorsData.lightRed
        //     : ColorsData.white,

        errorStyle: FontData.bodyEmphasis2(ColorsData.white_1),
      ),
    );
  }
}
