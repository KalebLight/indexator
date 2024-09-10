class UserModel {
  String token;
  String? name;

  UserModel({
    required this.token,
    this.name,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        token: json["token"] ?? '',
        name: json["name"] ?? '',
      );

  //repete informações do model por enquanto, até o User precisar de mais informações
}

class User {
  final String? token;
  final String? name;
  User({this.token, this.name});
}
