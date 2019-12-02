import 'package:flutter/material.dart';
import 'package:gobblet/models/gobblet-class.dart';
import 'package:gobblet/models/gobblet-inventory.class.dart';

class GobbletInventory extends StatefulWidget {
  int count;
  Color color;

  GobbletInventory(int count, Color color) : super() {
    this.count = count;
    this.color = color;
  }

  @override
  _GobbletInventoryState createState() => _GobbletInventoryState(count, color);
}

class _GobbletInventoryState extends State<GobbletInventory> {
  Color color;
  Inventory inventory;

  _GobbletInventoryState(int count, Color color) {
    this.inventory = Inventory(count, color);
    this.color = color;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 90,
          width: 90,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Visibility(
                  visible: inventory.small.count > 0,
                  child: Draggable<Gobblet>(
                      data: Gobblet(color, 25),
                      child: Icon(Icons.tag_faces, color: color, size: 25),
                      feedback: Icon(Icons.tag_faces, color: color, size: 25),
                      childWhenDragging:
                          Icon(Icons.tag_faces, color: color, size: 25),
                      onDragCompleted: () {
                        setState(() {
                          inventory.small.count -= 1;
                        });
                      }),
                ),
                Text(inventory.small.count.toString())
              ],
            ),
          ),
        ),
        Container(
          height: 100,
          width: 100,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Visibility(
                  visible: inventory.med.count > 0,
                  child: Draggable(
                      data: Gobblet(color, 50),
                      child: Icon(Icons.tag_faces, color: color, size: 50),
                      feedback: Icon(Icons.tag_faces, color: color, size: 50),
                      childWhenDragging:
                          Icon(Icons.tag_faces, color: color, size: 50),
                      onDragCompleted: () {
                        setState(() {
                          inventory.med.count -= 1;
                        });
                      }),
                ),
                Text(inventory.med.count.toString())
              ],
            ),
          ),
        ),
        Container(
          height: 100,
          width: 100,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Visibility(
                  visible: inventory.large.count > 0,
                  child: Draggable(
                      data: Gobblet(color, 75),
                      child: Icon(Icons.tag_faces, color: color, size: 75),
                      feedback: Icon(Icons.tag_faces, color: color, size: 75),
                      childWhenDragging:
                          Icon(Icons.tag_faces, color: color, size: 75),
                      onDragCompleted: () {
                        setState(() {
                          inventory.large.count -= 1;
                        });
                      }),
                ),
                Text(inventory.large.count.toString())
              ],
            ),
          ),
        ),
      ],
    );
  }
}
