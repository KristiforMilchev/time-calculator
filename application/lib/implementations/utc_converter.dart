import 'package:infrastructure/interfaces/itime_converter.dart';

class UtcConverter implements ITimeConverter {
  @override
  String convert(
      int hours, int minutes, int differnce, int? additionalMinutes) {
    return "${hours + (differnce)}:${minutes + (additionalMinutes != null ? 0 : additionalMinutes!)}";
  }
}
