import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/timezone_label/timezone_label.viewmodel.dart';
import 'package:stacked/stacked.dart';

class TimezoneLabel extends StatelessWidget {
  final String zoneLabel;

  final double offset;
  const TimezoneLabel({
    super.key,
    required this.zoneLabel,
    required this.offset,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TimezoneLabelViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(offset),
      builder: (context, viewModel, child) => Expanded(
        flex: 1,
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    zoneLabel,
                    style: TextStyle(
                      fontFamily: "Loto",
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                      color: ThemeStyles.fontPrimary,
                      letterSpacing: 3,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    viewModel.conveterdTime,
                    style: TextStyle(
                      fontFamily: "Loto",
                      fontWeight: FontWeight.w200,
                      fontSize: 20,
                      color: ThemeStyles.fontPrimary,
                      letterSpacing: 3,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
