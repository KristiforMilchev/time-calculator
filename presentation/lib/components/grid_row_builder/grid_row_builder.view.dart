import 'package:flutter/material.dart';
import 'package:presentation/components/grid_row_builder/grid_row_builder.viewmodel.dart';
import 'package:stacked/stacked.dart';

class GridRowBuilder extends StatelessWidget {
  late List<Widget> children;
  GridRowBuilder({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => GridRowBuilderViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(children),
      builder: (context, viewModel, child) => viewModel.buildDelegate,
    );
  }
}
