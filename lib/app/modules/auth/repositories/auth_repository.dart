// ignore_for_file: unused_catch_clause

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:indexator/app/core/data/enviroment.dart';
import 'package:indexator/app/core/data/errors.dart';
import 'package:indexator/app/modules/auth/responses/login_response.dart';

class AuthRepository {
  final dio = Dio();

  Future<Either<Failure, LoginResponse?>> login(
    String email,
    String password,
  ) async {
    try {
      Response response = await dio.post('${Enviroment.urlBase}/login', data: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) return Right(LoginResponse.fromMap(response.data));

      throw InternalError(message: "Erro ao enviar email de recuperação de senha");
    } on Failure catch (e) {
      return Left(e);
    } on DioException catch (e) {
      return Left(RequestError(message: e.message));
    }
  }

  Future<Either<Failure, LoginResponse?>> register(String name, String email, String password, String cPassword) async {
    try {
      Response response = await dio.post('${Enviroment.urlBase}/register',
          data: {
            'name': name,
            'email': email,
            'password': password,
            'c_password': cPassword,
          },
          options: Options(
            headers: {'Accept': "application/json"},
          ));
      if (response.statusCode == 200) return Right(LoginResponse.fromMap(response.data));

      throw InternalError(message: "Erro ao enviar email de recuperação de senha");
    } on Failure catch (e) {
      return Left(e);
    } on DioException catch (e) {
      return Left(RequestError(message: "Erro Recuperação Senha"));
    }
  }

  Future<Either<Failure, LoginResponse?>> loginGoogle(String accessToken) async {
    try {
      Response response = await dio.post(
        '${Enviroment.urlBase}/auth/google/loginGoogleFromToken',
        data: {
          'accessToken': accessToken,
        },
        options: Options(
          headers: {'Accept': "application/json"},
        ),
      );
      if (response.statusCode == 200) return Right(LoginResponse.fromMap(response.data));

      throw InternalError(message: "Error login");
    } on Failure catch (e) {
      return Left(e);
    } on DioException catch (e) {
      return Left(RequestError(message: "Erro ao fazer login"));
    }
  }
}
