import 'package:get_it/get_it.dart';
import 'package:infrastructure/interfaces/ibserver.dart';
import 'package:stacked/stacked.dart';

class TimePresenterViewModel extends BaseViewModel {
  GetIt getIt = GetIt.instance;
  late IObserver _observer;

  late String _localTime = "--";
  String get localTime => _localTime;

  ready() {
    _observer = getIt.get<IObserver>();
    _observer.subscribe("time-changed", timeHasChanged);
  }

  timeHasChanged(String time) {
    _localTime = time;
    notifyListeners();
  }

  @override
  void dispose() {
    _observer.dispose("time-changed");
    super.dispose();
  }
}
