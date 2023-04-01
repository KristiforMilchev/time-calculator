import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class GridRowBuilderViewModel extends BaseViewModel {
  late Widget _buildDelegate = const Column();
  get buildDelegate => _buildDelegate;

  ready(List<Widget> children) {
    List<Widget> widgets = [];
    var column = Column(
      children: [],
    );
    var i = 1;
    var row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [],
    );
    var sb = const SizedBox(
      height: 25,
    );
    for (Widget child in children) {
      if (i == 1) {
        row = Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [],
        );
      }
      row.children.add(child);
      if (i == 4) {
        widgets.add(row);
        widgets.add(sb);
        i = 0;
      }
      i++;
    }

    column.children.addAll(widgets);
    _buildDelegate = column;
    notifyListeners();
  }
}
