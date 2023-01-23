import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:launch_tracker_app/src/domain/entities/launch.dart';
import 'package:launch_tracker_app/src/domain/repositories/launch_repository.dart';
import 'package:launch_tracker_app/src/domain/utils/extensions/launch_list_extension.dart';
import 'package:launch_tracker_app/src/presentation/common/view_model/view_model.dart';

@injectable
class LaunchesViewModel extends ViewModel {
  LaunchesViewModel(
    this._launchRepository,
  ) {
    _loadLaunches();
  }

  final LaunchRepository _launchRepository;

  ValueNotifier<List<Launch>> launches = ValueNotifier([]);

  Future<void> updateLaunches() async => _loadLaunches();

  Future<void> _loadLaunches() async {
    return loadOperation(_launchRepository.getLaunches()).then(
      (value) => value.forEach(
        (loadedLaunches) {
          launches.value = loadedLaunches.sortByLaunchTime;
        },
      ),
    );
  }
}
