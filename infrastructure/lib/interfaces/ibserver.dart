abstract import 'package:domain/models/observable.dart';
import 'package:flutter/material.dart';

abstract class IObserver{
  void subscribe(String name, Function fn);
  Observable getSubscriber(String name);
  void dispose(String name);
}
