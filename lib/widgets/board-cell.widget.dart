import 'package:flutter/material.dart';
import 'package:gobblet/models/gobblet-class.dart';

class BoardCell extends StatelessWidget {
  Gobblet gobblet;

  BoardCell(Gobblet gobblet) {
    this.gobblet = gobblet;
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<Gobblet>(
      builder: (context, List<Gobblet> incoming, List rejected) {
        return Container(
          width: 125,
          height: 125,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.tag_faces,
                  color: gobblet.color,
                  size: gobblet.size.toDouble())
            ],
          ),
        );
      },
      onWillAccept: (incomingGobblet) {
        bool accepted = incomingGobblet.size > this.gobblet.size;
        return accepted;
      },
      onAccept: (Gobblet incomingGobblet) {
        this.gobblet = incomingGobblet;
      },
    );
  }
}
