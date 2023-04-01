import 'package:flutter/material.dart';

abstract class IObserver {
  void subscribe(String name, Function fn);
  Function? getSubscriber(String name);
  notifyObservers(String name, {dynamic data});
  void dispose(String name);
}
