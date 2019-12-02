import 'package:gobblet/models/gobblet-class.dart';

class Move {
  Gobblet gobblet;
  int row;
  int col;

  Move(Gobblet gobblet, int row, int col) {
    this.gobblet = gobblet;
    this.row = row;
    this.col = col;
  }
}

class Game {
  String player1;
  String player2;
  List<List<Gobblet>> board;
  List<Move> moves;
  String winner;
}
