import 'package:domain/models/core_router.dart';
import 'package:domain/models/transition_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infrastructure/interfaces/ipage_router_service.dart';

class PageRouterService implements IPageRouterService {
  @override
  late CoreRouter router;

  @override
  late int currentIndex = 0;

  @override
  late Object? callbackResult;

  @override
  backToPrevious(BuildContext context, dynamic result) {
    Navigator.pop(context, result);
  }

  @override
  bool changePage(String name, BuildContext context, TransitionData data) {
    context.go(name, extra: data);
    return true;
  }

  @override
  void registerRouter(CoreRouter currentRouter) {
    router = currentRouter;
  }

  @override
  void setPageIndex(int index) {
    currentIndex = index;
  }

  @override
  void setCallbackResult(Object current) {
    callbackResult = current;
  }
}
