import 'package:flutter/material.dart';
import 'package:presentation/views/splash/splash.viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../components/splashscreen/splashscreen_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SplashViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(context),
      builder: (context, viewModel, child) => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(5, 29, 41, 1),
              Color.fromRGBO(0, 0, 0, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Splashscreen(
          callback: viewModel.routeToAction,
        ),
      ),
    );
  }
}
