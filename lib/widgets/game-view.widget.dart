import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gobblet/widgets/board-widget.dart';
import 'package:gobblet/widgets/gobbler-inventory-widget.dart';
import './board-widget.dart';

class GameView extends StatefulWidget {
  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Game View"),
      ),
      body: Column(children: [
        GobbletInventory(2, Colors.black),
//        Observer(
//          builder: (_) => Text(_counter.value.toString()),
//        ),
        Center(
          child: Container(
              padding: new EdgeInsets.symmetric(vertical: 0),
              child: GobbletBoard()),
        ),
        GobbletInventory(2, Colors.red),
      ]),
    );
  }
}
