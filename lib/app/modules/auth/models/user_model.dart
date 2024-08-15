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
}
