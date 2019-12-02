import 'package:flutter/material.dart';
import 'package:gobblet/models/gobblet-class.dart';
import 'package:gobblet/widgets/board-cell.widget.dart';

class BoardRow extends StatelessWidget {
  List<Gobblet> gobblets = [];

  BoardRow(List<Gobblet> gobblets) {
    this.gobblets = gobblets;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: gobblets.map((gobblet) => BoardCell(gobblet)).toList());
  }
}
