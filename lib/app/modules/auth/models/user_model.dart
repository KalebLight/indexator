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

//repete informações do model por enquanto, até o User precisar de mais informações
class User {
  final String? token;
  final String? name;
  final String? email;
  final String? id;
  final String? googleId;
  User({
    this.token,
    this.name,
    this.email,
    this.id,
    this.googleId,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? token,
    String? googleId,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        token: token ?? this.token,
        googleId: googleId ?? this.googleId,
      );

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        token: json["token"],
        googleId: json["google_id"],
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "token": token,
        "googleId": googleId,
      };
}
