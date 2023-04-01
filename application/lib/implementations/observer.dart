import 'package:domain/models/observable.dart';
import 'package:flutter/material.dart';
import 'package:infrastructure/interfaces/ibserver.dart';

class Observer implements IObserver {
  late List<Observable> _observables;

  Observer() {
    _observables = [];
  }

  @override
  void subscribe(String name, Function fn) {
    _observables.add(Observable(name: name, fn: fn));
  }

  @override
  Observable getSubscriber(String name) {
    return _observables.firstWhere((element) => element.name == name);
  }

  @override
  void dispose(String name) {
    var exist = _observables.firstWhere((element) => element.name == name);
    if (exist != null) {
      _observables.remove(exist);
    }
  }
}
