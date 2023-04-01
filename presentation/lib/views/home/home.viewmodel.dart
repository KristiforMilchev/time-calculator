import 'package:get_it/get_it.dart';
import 'package:infrastructure/interfaces/ibserver.dart';
import 'package:infrastructure/interfaces/itime_converter.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  GetIt getIt = GetIt.I;
  late IObserver _observer;

  int _hours = 0;
  int _minutes = 0;

  double _timeSelected = 1;
  double get timeSelected => _timeSelected;
  late ITimeConverter _timeConverter;
  final String _emptyString = "--";
  String get emptyString => _emptyString;

  String? _gtmTime;
  String? get gtmTime => _gtmTime;

  String? _etcTime;
  String? get etcTime => _etcTime;

  String? _eetTime;
  String? get eetTime => _eetTime;

  String? _metTime;
  String? get metTime => _metTime;

  String? _netTime;
  String? get netTime => _netTime;

  String? _pltTime;
  String? get pltTime => _pltTime;

  String? _istTime;
  String? get istTime => _istTime;

  String? _bstTime;
  String? get bstTime => _bstTime;

  String? _vstTime;
  String? get vstTime => _vstTime;

  String? _cttTime;
  String? get cttTime => _cttTime;

  String? _jstTime;
  String? get jstTime => _jstTime;

  String? _actTime;
  String? get actTime => _actTime;

  String? _aetTime;
  String? get aetTime => _aetTime;

  String? _sstTime;
  String? get sstTime => _sstTime;

  String? _nstTime;
  String? get nstTime => _nstTime;

  String? _mitTime;
  String? get mitTime => _mitTime;

  String? _hstTim;
  String? get hstTime => _hstTim;

  String? _astTime;
  String? get astTime => _astTime;

  String? _pstTime;
  String? get pstTime => _pstTime;

  String? _pntTime;
  String? get pntTime => _pntTime;

  String? _mstTime;
  String? get mstTime => _mstTime;

  String? _cstTime;
  String? get cstTime => _cstTime;

  String? _estTime;
  String? get estTime => _estTime;

  String? _ietTime;
  String? get ietTime => _ietTime;

  String? _prtTime;
  String? get prtTime => _prtTime;

  String? _cntTime;
  String? get cntTime => _cntTime;

  String? _agtTime;
  String? get agtTime => _agtTime;

  String? _betTime;
  String? get betTime => _betTime;

  String _localTime = "${DateTime.now().hour}:${DateTime.now().minute}";
  String get localTime => _localTime;

  final String _localDetails =
      "(Local time: ${DateTime.now().timeZoneName}, ${DateTime.now().timeZoneOffset.inHours})";
  String get localDetails => _localDetails;

  ready() {
    _timeConverter = getIt.get<ITimeConverter>();
    _observer = getIt.get<IObserver>();
    _observer.getSubscriber("time-changed").fn.call(_localTime);
  }

  onTimeChanged(double value) {
    _timeSelected = value;
    calculateUtcToLocal();
    calulateDifference();
  }

  void calulateDifference() {
    _gtmTime = _timeConverter.convert(_hours, _minutes, 0, 0);
    _etcTime = _timeConverter.convert(_hours, _minutes, 1, 0);
    _eetTime = _timeConverter.convert(_hours, _minutes, 2, 0);
    _metTime = _timeConverter.convert(_hours, _minutes, 3, 0);
    _netTime = _timeConverter.convert(_hours, _minutes, 4, 0);
    _pltTime = _timeConverter.convert(_hours, _minutes, 5, 0);
    _istTime = _timeConverter.convert(_hours, _minutes, 5, 30);
    _bstTime = _timeConverter.convert(_hours, _minutes, 6, 0);
    _vstTime = _timeConverter.convert(_hours, _minutes, 7, 0);
    _cttTime = _timeConverter.convert(_hours, _minutes, 8, 0);
    _jstTime = _timeConverter.convert(_hours, _minutes, 9, 0);
    _actTime = _timeConverter.convert(_hours, _minutes, 9, 30);
    _aetTime = _timeConverter.convert(_hours, _minutes, 10, 0);
    _sstTime = _timeConverter.convert(_hours, _minutes, 11, 0);
    _nstTime = _timeConverter.convert(_hours, _minutes, 12, 0);
    _mitTime = _timeConverter.convert(_hours, _minutes, -11, 0);
    _hstTim = _timeConverter.convert(_hours, _minutes, -10, 0);
    _astTime = _timeConverter.convert(_hours, _minutes, -9, 0);
    _pstTime = _timeConverter.convert(_hours, _minutes, -8, 0);
    _pntTime = _timeConverter.convert(_hours, _minutes, -7, 0);
    _mstTime = _timeConverter.convert(_hours, _minutes, -7, 0);
    _cstTime = _timeConverter.convert(_hours, _minutes, -6, 0);
    _estTime = _timeConverter.convert(_hours, _minutes, -5, 0);
    _ietTime = _timeConverter.convert(_hours, _minutes, -5, 0);
    _prtTime = _timeConverter.convert(_hours, _minutes, -4, 0);
    _cntTime = _timeConverter.convert(_hours, _minutes, -3, 0);
    _agtTime = _timeConverter.convert(_hours, _minutes, -3, 0);
    _betTime = _timeConverter.convert(_hours, _minutes, -3, 0);
    notifyListeners();
  }

  onTimeSet(String time) {
    print(time);
    var timeData = time.split(":");
    print(timeData);

    if (timeData.isEmpty) return;

    _hours = int.parse(timeData[0]);

    if (timeData.length > 1) {
      _minutes = timeData[1].isEmpty ? 0 : int.parse(timeData[1]);
    }

    calculateUtcToLocal();

    calulateDifference();
  }

  void calculateUtcToLocal() {
    _localTime =
        "${_hours + ((timeSelected) + DateTime.now().timeZoneOffset.inHours)}:${_minutes}";

    _observer.getSubscriber("time-changed").fn.call(_localTime);
  }
}
