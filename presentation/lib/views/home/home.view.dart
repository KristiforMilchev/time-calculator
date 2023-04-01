import 'package:domain/styles.dart';
import 'package:flutter/material.dart';
import 'package:presentation/components/custom_text_field/custom_text_field.dart';
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
                  Container(
                    padding: const EdgeInsets.all(26),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TimezoneLabel(
                                time:
                                    viewModel.gtmTime ?? viewModel.emptyString,
                                zoneLabel: "GTM"),
                            TimezoneLabel(
                                time:
                                    viewModel.etcTime ?? viewModel.emptyString,
                                zoneLabel: "ECT"),
                            TimezoneLabel(
                                time:
                                    viewModel.eetTime ?? viewModel.emptyString,
                                zoneLabel: "EET"),
                            TimezoneLabel(
                                time:
                                    viewModel.metTime ?? viewModel.emptyString,
                                zoneLabel: "MET"),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TimezoneLabel(
                                time:
                                    viewModel.netTime ?? viewModel.emptyString,
                                zoneLabel: "NET"),
                            TimezoneLabel(
                                time:
                                    viewModel.pltTime ?? viewModel.emptyString,
                                zoneLabel: "PLT"),
                            TimezoneLabel(
                                time:
                                    viewModel.istTime ?? viewModel.emptyString,
                                zoneLabel: "IST"),
                            TimezoneLabel(
                                time:
                                    viewModel.bstTime ?? viewModel.emptyString,
                                zoneLabel: "BST"),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TimezoneLabel(
                                time:
                                    viewModel.vstTime ?? viewModel.emptyString,
                                zoneLabel: "VST"),
                            TimezoneLabel(
                                time:
                                    viewModel.cttTime ?? viewModel.emptyString,
                                zoneLabel: "CTT"),
                            TimezoneLabel(
                                time:
                                    viewModel.jstTime ?? viewModel.emptyString,
                                zoneLabel: "JST"),
                            TimezoneLabel(
                                time:
                                    viewModel.actTime ?? viewModel.emptyString,
                                zoneLabel: "ACT"),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TimezoneLabel(
                                time:
                                    viewModel.aetTime ?? viewModel.emptyString,
                                zoneLabel: "AET"),
                            TimezoneLabel(
                                time:
                                    viewModel.sstTime ?? viewModel.emptyString,
                                zoneLabel: "SST"),
                            TimezoneLabel(
                                time:
                                    viewModel.nstTime ?? viewModel.emptyString,
                                zoneLabel: "NST"),
                            TimezoneLabel(
                                time:
                                    viewModel.mitTime ?? viewModel.emptyString,
                                zoneLabel: "MIT"),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TimezoneLabel(
                                time:
                                    viewModel.hstTime ?? viewModel.emptyString,
                                zoneLabel: "HST"),
                            TimezoneLabel(
                                time:
                                    viewModel.astTime ?? viewModel.emptyString,
                                zoneLabel: "AST"),
                            TimezoneLabel(
                                time:
                                    viewModel.pstTime ?? viewModel.emptyString,
                                zoneLabel: "PST"),
                            TimezoneLabel(
                                time:
                                    viewModel.pntTime ?? viewModel.emptyString,
                                zoneLabel: "PNT"),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TimezoneLabel(
                                time:
                                    viewModel.mstTime ?? viewModel.emptyString,
                                zoneLabel: "MST"),
                            TimezoneLabel(
                                time:
                                    viewModel.cstTime ?? viewModel.emptyString,
                                zoneLabel: "CST"),
                            TimezoneLabel(
                                time:
                                    viewModel.estTime ?? viewModel.emptyString,
                                zoneLabel: "EST"),
                            TimezoneLabel(
                                time:
                                    viewModel.ietTime ?? viewModel.emptyString,
                                zoneLabel: "IET"),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TimezoneLabel(
                                time:
                                    viewModel.prtTime ?? viewModel.emptyString,
                                zoneLabel: "PRT"),
                            TimezoneLabel(
                                time:
                                    viewModel.cntTime ?? viewModel.emptyString,
                                zoneLabel: "CNT"),
                            TimezoneLabel(
                                time:
                                    viewModel.agtTime ?? viewModel.emptyString,
                                zoneLabel: "AGT"),
                            TimezoneLabel(
                                time:
                                    viewModel.betTime ?? viewModel.emptyString,
                                zoneLabel: "BET"),
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
