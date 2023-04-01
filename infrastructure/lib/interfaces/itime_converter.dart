import 'package:domain/models/time_zone.dart';

abstract class ITimeConverter {
  List<TimeZone> get timeZones;

  String convert(int hours, int minutes, double zone);
}
