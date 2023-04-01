import 'package:domain/models/time_changed_notifier.dart';
import 'package:get_it/get_it.dart';
import 'package:infrastructure/interfaces/ibserver.dart';
import 'package:infrastructure/interfaces/itime_converter.dart';
import 'package:stacked/stacked.dart';

class TimezoneLabelViewModel extends BaseViewModel {
  GetIt getIt = GetIt.instance;
  late IObserver _observer;
  late ITimeConverter _converter;

  double _offset = 0;
  String _convertedTime = "--";
  String get conveterdTime => _convertedTime;

  ready(double offset) {
    _observer = getIt.get<IObserver>();
    _converter = getIt.get<ITimeConverter>();
    _offset = offset;

    _observer.subscribe("time-updated", onTimeChanged);
  }

  onTimeChanged(TimeChangedNotifier notifier) {
    _convertedTime = _converter.convert(
      notifier.hours,
      notifier.minutes,
      (notifier.offset + (_offset)),
    );
    notifyListeners();
  }
}
