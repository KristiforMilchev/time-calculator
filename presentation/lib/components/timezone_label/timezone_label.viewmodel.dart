import 'package:get_it/get_it.dart';
import 'package:infrastructure/interfaces/ibserver.dart';
import 'package:infrastructure/interfaces/itime_converter.dart';
import 'package:stacked/stacked.dart';

class TimezoneLabelViewModel extends BaseViewModel {
  GetIt getIt = GetIt.instance;
  late IObserver _observer;
  late ITimeConverter _converter;

  double _offset = 0;
  ready(double offset) {
    _observer = getIt.get<IObserver>();
    _converter = getIt.get<ITimeConverter>();
    _offset = offset;

    _observer.subscribe("time-updated", onTimeChanged);
  }

  onTimeChanged(int hours, int minutes) {
    _converter.convert(hours, minutes, _offset);
  }
}
