import 'package:domain/styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/time_prenter/time_presenter_viewmodel.dart';
import 'package:stacked/stacked.dart';

class TimePresenter extends StatelessWidget {
  const TimePresenter({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TimePresenterViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(),
      builder: (context, viewModel, child) => Text(
        viewModel.localTime,
        style: const TextStyle(
          fontFamily: "Loto",
          fontWeight: FontWeight.bold,
          fontSize: 48,
          color: ThemeStyles.fontPrimary,
          letterSpacing: 6,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
