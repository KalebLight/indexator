import 'package:indexator/app/modules/auth/models/user_model.dart';

class LoginResponse {
  final bool success;
  final UserModel data;
  final String message;

  LoginResponse({
    required this.success,
    required this.data,
    required this.message,
  });

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        data: UserModel.fromMap(json["data"]),
        message: json["message"],
      );
}
