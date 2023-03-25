import 'package:domain/models/core_router.dart';
import 'package:domain/models/transition_data.dart';
import 'package:flutter/material.dart';

abstract class IPageRouterService {
  late CoreRouter router;
  late int currentIndex;
  late Object? callbackResult;

  void registerRouter(CoreRouter router);
  bool changePage(String name, BuildContext context, TransitionData data);
  void setPageIndex(int index);
  void backToPrevious(BuildContext context, dynamic result);

  void setCallbackResult(Object current);
}
