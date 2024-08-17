class Validators {
  static String? nameValidator(text) {
    return text.isEmpty || text.length < 5 ? "O nome deve ter pelo menos 5 caracteres" : null;
  }

  static String? emailValidator(text) {
    return !text.contains("@") && !text.contains(".com") ? "Insira um e-mail inválido" : null;
  }

  static String? passwordValidatorLogin(text) {
    if (text.isEmpty) return "Insira sua senha";
    return null;
  }

  static String? passwordValidatorSignUp(text) {
    return text.length < 8
        ? "Insira pelo menos 8 caracteres."
        : !text.contains(RegExp(r'[A-Z]'))
            ? "Insira pelo menos uma letra maiúscula [A-Z]."
            : !text.contains(RegExp(r'[a-z]'))
                ? "Insira pelo menos uma letra minúscula [a-z]."
                : !text.contains(RegExp(r'[0-9]'))
                    ? "Insira pelo menos um número [0-9]."
                    : !text.contains(RegExp(r'[! @ # \ $ & * ~]'))
                        ? "Insira pelo menos um caractere especial [! @ # \ \$ & * ~]."
                        : null;
  }

  static bool emailValidatorRegExp(text) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(text);
  }
}
