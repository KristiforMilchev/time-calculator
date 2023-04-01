import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/custom_text_field/custom_text_field.dart';
import 'package:presentation/components/grid_row_builder/grid_row_builder.view.dart';
import 'package:presentation/components/time_prenter/time_presenter_view.dart';
import 'package:presentation/components/timezone_label/timezone_label.dart';
import 'package:stacked/stacked.dart';

import 'home.viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (viewModel) => viewModel.ready(),
      builder: (context, viewModel, child) => Material(
        color: ThemeStyles.mainColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            NavigationRail(
              labelType: NavigationRailLabelType.none,
              useIndicator: true,
              elevation: 1,
              indicatorColor: ThemeStyles.mainColor,
              unselectedIconTheme: const IconThemeData(
                color: ThemeStyles.fontPrimary,
              ),
              selectedIconTheme: IconThemeData(
                color: ThemeStyles.actionColor,
              ),
              minExtendedWidth: 300,
              extended: false,
              backgroundColor: ThemeStyles.secondaryColor,
              destinations: [
                NavigationRailDestination(
                  icon: const Icon(
                    Icons.home,
                  ),
                  label: Text(
                    "Home",
                    style: ThemeStyles.regularParagraph,
                  ),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.add_alert_outlined),
                  label: Text(
                    "Alerts",
                    style: ThemeStyles.regularParagraph,
                  ),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.settings),
                  label: Text(
                    "Settings",
                    style: ThemeStyles.regularParagraph,
                  ),
                )
              ],
              selectedIndex: 0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 300,
                    child: CustomTextField(
                      controller: viewModel.lookupTimeController,
                      floatingLabel: "Lookup Time",
                      onChanged: viewModel.onTimeSet,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Slider(
                    value: viewModel.timeSelected,
                    activeColor: ThemeStyles.actionColor,
                    thumbColor: ThemeStyles.actionColor,
                    inactiveColor: Colors.transparent,
                    mouseCursor: SystemMouseCursors.move,
                    min: -12,
                    max: 12,
                    divisions: 96,
                    label: "${viewModel.timeSelected} UTC",
                    onChanged: (value) => viewModel.onTimeChanged(value),
                  ),
                  const TimePresenter(),
                  Text(
                    viewModel.localDetails,
                    style: const TextStyle(
                      fontFamily: "Loto",
                      fontWeight: FontWeight.w100,
                      fontSize: 14,
                      color: ThemeStyles.fontPrimary,
                      letterSpacing: 4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(26),
                        child: GridRowBuilder(
                          children: viewModel.timeZones
                              .map(
                                (e) => TimezoneLabel(
                                  zoneLabel: e.name,
                                  offset: e.offset,
                                ),
                              )
                              .toList(),
                        )),
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
