import 'package:indexator/app/modules/auth/models/user_model.dart';

class LoginResponse {
  final bool success;
  final UserModel data;

  LoginResponse({
    required this.success,
    required this.data,
  });

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        data: UserModel.fromMap(json["data"]),
      );
}
