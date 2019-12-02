import 'package:flutter/material.dart';
import 'package:gobblet/models/gobblet-class.dart';
import 'package:gobblet/widgets/board-row.widget.dart';

class GobbletBoard extends StatefulWidget {
  @override
  _GobbletBoardState createState() => _GobbletBoardState();
}

class _GobbletBoardState extends State<GobbletBoard> {
  final int gridSize = 3;
  final List<List<Gobblet>> boardLayout = [
    [Gobblet(null, 0), Gobblet(null, 0), Gobblet(null, 0)],
    [Gobblet(null, 0), Gobblet(null, 0), Gobblet(null, 0)],
    [Gobblet(null, 0), Gobblet(null, 0), Gobblet(null, 0)]
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
        children: boardLayout.map((gobblets) => BoardRow(gobblets)).toList());
  }
}
