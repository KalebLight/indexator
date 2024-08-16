import 'package:flutter/material.dart';

class FontData {
  static const String defaultFontFamily = 'Inter';

  static mainHeading(Color color) {
    return TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      color: color,
    );
  }

  static mainHeadingEmphasis(Color color) {
    return TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 22,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      color: color,
    );
  }

  static headline(Color color) {
    return TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      color: color,
    );
  }

  static headline1(Color color) {
    return TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 26,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      color: color,
    );
  }

  static header1(Color color) {
    return TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: color,
    );
  }

  static header2(Color color) {
    return TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: color,
    );
  }

  static button(Color color) {
    return TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      color: color,
    );
  }

  static body1(Color color) {
    return TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: color,
    );
  }

  static body2(Color color) {
    return TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: color,
    );
  }

  static body3(Color color) {
    return TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: color,
    );
  }

  static body4(Color color) {
    return TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: color,
    );
  }

  static body5(Color color) {
    return TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      color: color,
    );
  }

  static bodyEmphasis1(Color color) {
    return TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      color: color,
    );
  }

  static bodyEmphasis2(Color color) {
    return TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      color: color,
    );
  }

  static bodyEmphasis3(Color color) {
    return TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      color: color,
    );
  }

  static textLink() {
    return const TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      color: Colors.white,
      decoration: TextDecoration.underline,
      decorationColor: Colors.white,
      decorationThickness: 1,
    );
  }

  static textLink2() {
    return const TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: Colors.blue,
      decoration: TextDecoration.underline,
      decorationColor: Colors.blue,
      decorationThickness: 1,
    );
  }

  static othersAgreementsSelectionText(Color color) {
    return TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      color: color,
    );
  }

  static othersAgreementDropdownButtonFormField(Color color) {
    return TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      color: color,
    );
  }

  static unlinkCorbanTextButton() {
    return const TextStyle(
        fontFamily: defaultFontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.blue,
        decoration: TextDecoration.underline);
  }
}
