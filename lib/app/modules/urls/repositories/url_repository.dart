import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:indexator/app/core/data/enviroment.dart';
import 'package:indexator/app/core/data/errors.dart';
import 'package:indexator/app/modules/urls/responses/add_url_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UrlRepository {
  final dio = Dio();

  Future<Either<Failure, AddUrlResponse?>> addURL(
    String url,
  ) async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      // dio.options.headers["Authorization"] = "Bearer ${sharedPreferences.get('token')}";
      // print("Bearer ${sharedPreferences.get('token')}");
      Response response = await dio.post('${Enviroment.urlBase}/urls',
          data: {
            'url': url,
          },
          options: Options(
            headers: {'Accept': "application/json", 'Authorization': "Bearer ${sharedPreferences.get('token')}"},
          ));

      if (response.statusCode == 201) return Right(AddUrlResponse.fromMap(response.data));

      throw InternalError(message: "Error");
    } on Failure catch (e) {
      return Left(e);
    } on DioException catch (e) {
      return Left(RequestError(message: "Error"));
    }
  }
}
