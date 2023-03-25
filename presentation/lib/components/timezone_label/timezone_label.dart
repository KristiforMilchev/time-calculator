import 'package:domain/styles.dart';
import 'package:flutter/material.dart';

class TimezoneLabel extends StatelessWidget {
  final String zoneLabel;
  final String time;
  const TimezoneLabel({super.key, required this.time, required this.zoneLabel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
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
              time,
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
        )
      ],
    );
  }
}
