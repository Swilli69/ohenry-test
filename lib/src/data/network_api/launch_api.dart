import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:launch_tracker_app/src/data/entities/launch_model.dart';
import 'package:launch_tracker_app/src/data/network_api/api_constants.dart';
import 'package:retrofit/retrofit.dart';

part 'launch_api.g.dart';

@lazySingleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class LaunchApi {
  @factoryMethod
  factory LaunchApi(Dio dio) = _LaunchApi;

  @GET('launches/upcoming')
  Future<List<LaunchModel>> getLaunches();

  @GET('launches/{id}')
  Future<LaunchModel> getNextLaunch(@Path("id") String id);
}
