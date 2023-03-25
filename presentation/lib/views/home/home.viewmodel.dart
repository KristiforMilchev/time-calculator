import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  double _timeSelected = 1;
  double get timeSelected => _timeSelected;

  onTimeChanged(double value) {
    _timeSelected = value;
    notifyListeners();
  }
}
