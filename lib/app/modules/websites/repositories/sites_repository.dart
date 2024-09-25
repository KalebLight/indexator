import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:indexator/app/core/data/enviroment.dart';
import 'package:indexator/app/core/data/errors.dart';
import 'package:indexator/app/modules/websites/responses/list_sites_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SitesRepository {
  final dio = Dio();

  Future<Either<Failure, ListSitesResponse?>> listSites() async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

      Response response = await dio.get('${Enviroment.urlBase}/gsc',
          options: Options(
            headers: {'Accept': "application/json", 'Authorization': "Bearer ${sharedPreferences.get('token')}"},
          ));

      if (response.statusCode == 200) return Right(ListSitesResponse.fromMap(response.data));

      throw InternalError(message: "Error");
    } on Failure catch (e) {
      return Left(e);
    } on DioException catch (e) {
      return Left(RequestError(message: "Error: ${e.message}"));
    }
  }
}
