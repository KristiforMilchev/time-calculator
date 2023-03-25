import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/custom_text_field/custom_text_field.dart';
import 'package:presentation/components/timezone_label/timezone_label.dart';
import 'package:stacked/stacked.dart';

import 'home.viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
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
              unselectedIconTheme: IconThemeData(
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
                      floatingLabel: "Lookup Time",
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
                  Text(
                    "08:25",
                    style: TextStyle(
                      fontFamily: "Loto",
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                      color: ThemeStyles.fontPrimary,
                      letterSpacing: 6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    padding: const EdgeInsets.all(26),
                    child: const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TimezoneLabel(time: "12:23", zoneLabel: "GTM"),
                            TimezoneLabel(time: "12:23", zoneLabel: "ECT"),
                            TimezoneLabel(time: "12:23", zoneLabel: "EET"),
                            TimezoneLabel(time: "12:23", zoneLabel: "MET"),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TimezoneLabel(time: "12:23", zoneLabel: "NET"),
                            TimezoneLabel(time: "12:23", zoneLabel: "PLT"),
                            TimezoneLabel(time: "12:23", zoneLabel: "IST"),
                            TimezoneLabel(time: "12:23", zoneLabel: "BST"),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TimezoneLabel(time: "12:23", zoneLabel: "VST"),
                            TimezoneLabel(time: "12:23", zoneLabel: "CTT"),
                            TimezoneLabel(time: "12:23", zoneLabel: "JST"),
                            TimezoneLabel(time: "12:23", zoneLabel: "ACT"),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TimezoneLabel(time: "12:23", zoneLabel: "AET"),
                            TimezoneLabel(time: "12:23", zoneLabel: "SST"),
                            TimezoneLabel(time: "12:23", zoneLabel: "NST"),
                            TimezoneLabel(time: "12:23", zoneLabel: "MIT"),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TimezoneLabel(time: "12:23", zoneLabel: "HST"),
                            TimezoneLabel(time: "12:23", zoneLabel: "AST"),
                            TimezoneLabel(time: "12:23", zoneLabel: "PST"),
                            TimezoneLabel(time: "12:23", zoneLabel: "PNT"),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TimezoneLabel(time: "12:23", zoneLabel: "MST"),
                            TimezoneLabel(time: "12:23", zoneLabel: "CST"),
                            TimezoneLabel(time: "12:23", zoneLabel: "EST"),
                            TimezoneLabel(time: "12:23", zoneLabel: "IET"),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TimezoneLabel(time: "12:23", zoneLabel: "PRT"),
                            TimezoneLabel(time: "12:23", zoneLabel: "CNT"),
                            TimezoneLabel(time: "12:23", zoneLabel: "AGT"),
                            TimezoneLabel(time: "12:23", zoneLabel: "BET"),
                          ],
                        ),
                      ],
                    ),
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
