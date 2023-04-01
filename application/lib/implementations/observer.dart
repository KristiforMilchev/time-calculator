import 'package:domain/models/observable.dart';
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
  Function? getSubscriber(String name) {
    try {
      return _observables
          .firstWhere(
            (element) => element.name == name,
          )
          .fn;
    } catch (ex) {
      return null;
    }
  }

  @override
  void dispose(String name) {
    var exist = _observables.firstWhere((element) => element.name == name);
    if (exist != null) {
      _observables.remove(exist);
    }
  }

  @override
  notifyObservers(String name, {data}) {
    _observables.where((element) => element.name == name).forEach((element) {
      element.fn.call(data);
    });
  }
}
