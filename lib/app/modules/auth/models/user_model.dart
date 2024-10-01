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
  final String? googleToken;
  final String? name;
  final String? email;
  final int? id;
  final String? googleId;
  final String? profilePhoto;
  User({
    this.googleToken,
    this.name,
    this.email,
    this.id,
    this.googleId,
    this.profilePhoto,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? googleToken,
    String? googleId,
    String? profilePhoto,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        googleToken: googleToken ?? this.googleToken,
        googleId: googleId ?? this.googleId,
        profilePhoto: profilePhoto ?? this.profilePhoto,
      );

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        googleToken: json["google_token"],
        googleId: json["google_id"],
        profilePhoto: json["profile_photo"] ?? '',
      );

  factory User.fromMapHive(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        googleToken: json["googleToken"],
        googleId: json["googleId"],
        profilePhoto: json["profilePhoto"] ?? '',
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "googleToken": googleToken,
        "googleId": googleId,
        "profilePhoto": profilePhoto,
      };
}
