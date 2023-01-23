import 'package:flutter/material.dart';
import 'package:launch_tracker_app/src/presentation/common/theme/app_colors.dart';
import 'package:launch_tracker_app/src/presentation/common/view_model/view.dart';
import 'package:launch_tracker_app/src/presentation/common/view_model/view_model.dart';
import 'package:launch_tracker_app/src/presentation/common/widgets/gradient_app_bar_widget.dart';
import 'package:launch_tracker_app/src/presentation/common/widgets/gradient_background_widget.dart';
import 'package:launch_tracker_app/src/presentation/common/widgets/loader_widget.dart';
import 'package:launch_tracker_app/src/presentation/features/countdown/countdown_view_model.dart';
import 'package:launch_tracker_app/src/presentation/features/countdown/widgets/counter_widget.dart';
import 'package:launch_tracker_app/src/presentation/features/countdown/widgets/share_button_widget.dart';
import 'package:provider/provider.dart';

class CountdownScreen extends View<CountdownViewModel> {
  const CountdownScreen({
    Key? key,
    required String launchId,
  }) : super(key: key, param1: launchId);

  @override
  Widget buildWidget(BuildContext context) {
    final vm = context.read<CountdownViewModel>();

    return ValueListenableBuilder(
      valueListenable: vm.launch,
      builder: (context, launch, widget) =>
          vm.loadingState == LoadingState.loading
              ? const Loader()
              : Scaffold(
                  appBar: PreferredSize(
                    preferredSize: const Size.fromHeight(100.0),
                    child: AppBar(
                      flexibleSpace: GradientAppBar(
                        gradientColors: const [
                          AppColors.macawBlueGreen,
                          AppColors.riverBed
                        ],
                        title: launch!.name,
                        hasLeading: true,
                        action: const ShareButton(),
                      ),
                      leadingWidth: 60,
                      automaticallyImplyLeading: false,
                    ),
                  ),
                  body: const GradientBackground(
                    colors: [AppColors.gableGreen, AppColors.dark],
                    child: Counter(),
                  ),
                ),
    );
  }
}
