import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:indexator/app/core/data/enviroment.dart';
import 'package:indexator/app/core/data/errors.dart';
import 'package:indexator/app/modules/auth/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final dio = Dio();

  Future<Either<Failure, User?>> getUserData() async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      Response response = await dio.get('${Enviroment.urlBase}/user',
          options: Options(
            headers: {'Accept': "application/json", 'Authorization': "Bearer ${sharedPreferences.get('token')}"},
          ));
      if (response.statusCode == 200) return Right(User.fromMap(response.data));

      throw InternalError(message: "Erro ao enviar email de recuperação de senha");
    } on Failure catch (e) {
      return Left(e);
    } on DioException catch (e) {
      return Left(RequestError(message: e.message));
    }
  }

  Future<Either<Failure, User?>> updateUser(
    String name,
    String email,
  ) async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

      Response response = await dio.post('${Enviroment.urlBase}/user/update',
          data: {
            'name': name,
            'email': email,
          },
          options: Options(
            headers: {'Accept': "application/json", 'Authorization': "Bearer ${sharedPreferences.get('token')}"},
          ));
      if (response.statusCode == 200) return Right(User.fromMap(response.data));

      throw InternalError(message: "Error");
    } on Failure catch (e) {
      return Left(e);
    } on DioException {
      return Left(RequestError(message: "Error"));
    }
  }
}
