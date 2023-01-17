import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:launch_tracker_app/src/data/network_api/launch_api.dart';
import 'package:launch_tracker_app/src/domain/entities/launch.dart';
import 'package:launch_tracker_app/src/domain/entities/base_error.dart';
import 'package:launch_tracker_app/src/domain/repositories/launch_repository.dart';

@LazySingleton(as: LaunchRepository)
class LaunchRepositoryImpl extends LaunchRepository {
  const LaunchRepositoryImpl(
    this._launchApi,
  );

  final LaunchApi _launchApi;

  @override
  Future<Either<BaseError, List<Launch>>> fetchLaunches() async {
    try {
      return _launchApi.getLaunches().then((value) => Right(value));
    } catch (e) {
      return const Left(BaseError.loadingError);
    }
  }
}