import 'package:domain/models/time_changed_notifier.dart';
import 'package:domain/models/time_zone.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:infrastructure/interfaces/ibserver.dart';
import 'package:infrastructure/interfaces/itime_converter.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  GetIt getIt = GetIt.I;
  late ITimeConverter _timeConverter;
  late IObserver _observer;

  int _hours = 0;
  int _minutes = 0;

  late List<TimeZone> _timeZones = [];
  List<TimeZone> get timeZones => _timeZones;

  double _timeSelected = 1;
  double get timeSelected => _timeSelected;

  final String _emptyString = "--";
  String get emptyString => _emptyString;

  String _localTime = "${DateTime.now().hour}:${DateTime.now().minute}";
  String get localTime => _localTime;

  final String _localDetails =
      "(Local time: ${DateTime.now().timeZoneName}, ${DateTime.now().timeZoneOffset.inHours})";
  String get localDetails => _localDetails;
  bool _offsetForced = false;
  int _offsetAt = 0;

  TextEditingController _lookupTimeController = TextEditingController();
  TextEditingController get lookupTimeController => _lookupTimeController;

  ready() {
    _timeConverter = getIt.get<ITimeConverter>();
    _timeZones = _timeConverter.timeZones;

    _observer = getIt.get<IObserver>();
    _observer.getSubscriber("time-changed")?.call(_localTime);
    notifyListeners();
  }

  onTimeChanged(double value) {
    _timeSelected = value;
    notifyListeners();
    calculateUtcToLocal();
  }

  void calulateDifference() {
    _observer.notifyObservers(
      "time-updated",
      data: TimeChangedNotifier(
        hours: _hours,
        minutes: _minutes,
        offset: _timeSelected,
      ),
    );
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

    if (_hours == 24) {
      _hours = 0;
      _offsetAt = time.length;
      _lookupTimeController.value = TextEditingValue(text: "00:${_minutes}");
      _lookupTimeController.selection = TextSelection.fromPosition(
        TextPosition(offset: _offsetAt),
      );
    }

    if (_hours > 24) {
      _offsetAt = time.length;

      var digits = _hours.toString().split("");
      _hours = int.parse(digits.first);
      if (_minutes == 0) {
        _minutes = int.parse(digits.last);
      }
      if (_minutes < 10) {
        _lookupTimeController.value =
            TextEditingValue(text: "0${digits.first}:0${_minutes}");
      } else {
        _lookupTimeController.value =
            TextEditingValue(text: "0${digits.first}:${_minutes}");
      }
    }

    if (_minutes > 59) {
      var digits = _minutes.toString().split("");
      _minutes = int.parse(digits.last);
      if (_hours < 10) {
        _lookupTimeController.value =
            TextEditingValue(text: "0$_hours:0${digits.last}");
      } else {
        _lookupTimeController.value =
            TextEditingValue(text: "$_hours:0${digits.last}");
      }
    }
    calculateUtcToLocal();
  }

  void calculateUtcToLocal() {
    DateTime dt = DateTime.now();
    var digits = _timeSelected.toString().split(".");

    dt = dt.add(Duration(
        hours: int.parse(digits.first), minutes: int.parse(digits.last)));

    _localTime = "${dt.hour}:${dt.minute}";

    var sub = _observer.getSubscriber("time-changed");
    if (sub != null) {
      sub.call(_localTime);
    }

    calulateDifference();
  }
}
