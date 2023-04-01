import 'package:domain/models/time_zone.dart';
import 'package:flutter/foundation.dart';
import 'package:infrastructure/interfaces/itime_converter.dart';

class UtcConverter implements ITimeConverter {
  late List<TimeZone> _timeZones;

  @override
  List<TimeZone> get timeZones => _timeZones;

  UtcConverter() {
    _timeZones = const [
      TimeZone(name: "GTM", offset: 0),
      TimeZone(name: "ETC", offset: 1),
      TimeZone(name: "EET", offset: 2),
      TimeZone(name: "MET", offset: 3),
      TimeZone(name: "NET", offset: 4),
      TimeZone(name: "PLT", offset: 5),
      TimeZone(name: "IST", offset: 5.30),
      TimeZone(name: "BST", offset: 6),
      TimeZone(name: "VST", offset: 7),
      TimeZone(name: "CTT", offset: 8),
      TimeZone(name: "JST", offset: 9),
      TimeZone(name: "ACT", offset: 9.30),
      TimeZone(name: "AET", offset: 10),
      TimeZone(name: "SST", offset: 11),
      TimeZone(name: "NST", offset: 12),
      TimeZone(name: "MIT", offset: -11),
      TimeZone(name: "HST", offset: -10),
      TimeZone(name: "AST", offset: -9),
      TimeZone(name: "PST", offset: -8),
      TimeZone(name: "PNT", offset: -7),
      TimeZone(name: "MST", offset: -7),
      TimeZone(name: "CST", offset: -6),
      TimeZone(name: "EST", offset: -5),
      TimeZone(name: "IET", offset: -5),
      TimeZone(name: "PRT", offset: -4),
      TimeZone(name: "CNT", offset: -3),
      TimeZone(name: "AGT", offset: -3),
      TimeZone(name: "BET", offset: -3),
    ];
  }

  @override
  String convert(int hours, int minutes, double differnce) {
    var dt = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, hours, minutes);
    var diffConverted = differnce.toString().split(".");
    var diffHours = int.parse(diffConverted.first);
    var diffMinutes = int.parse(diffConverted.last);
    dt = dt.add(Duration(hours: diffHours, minutes: diffMinutes));
    return "${dt.hour}:${dt.minute}";
  }
}
