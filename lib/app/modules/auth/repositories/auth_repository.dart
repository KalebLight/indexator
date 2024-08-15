import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:indexator/app/core/data/errors.dart';
import 'package:indexator/app/modules/auth/responses/login_response.dart';

class AuthRepository {
  final dio = Dio();

  Future<Either<Failure, LoginResponse?>> login(
    String email,
    String password,
  ) async {
    try {
      Response response = await dio.post('http://127.0.0.1:8000/api/login', data: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) return Right(LoginResponse.fromMap(response.data));

      throw InternalError(message: "Erro ao enviar email de recuperação de senha");
    } on Failure catch (e, s) {
      return Left(e);
    } on DioException {
      return Left(RequestError(message: "Erro Recuperação Senha"));
    }
  }
}






    // try {
    //   Response response = await dio.post('http://127.0.0.1:8000/api/login', data: {
    //     'email': email,
    //     'password': password,
    //   });
    //   if (response.statusCode == 200) {
    //     await sharedPreferences.setString('token', "Token ${response.data['data']["token"]}");
    //     GoRouter.of(context).pushReplacement('/');
    //     return true;
    //   }
    // } on DioException catch (e) {
    //   print("ERROR:  ${e.message}");
    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //   return false;
    // }
