import 'package:mobx/mobx.dart';
//part 'counter.g.dart';

//class Counter with Store {
//  Action increment;
//  Action decrement;
//
//  final _value = Observable(1);
//
//  Counter() {
//    increment = Action(_increment);
//    decrement = Action(_decrement);
//  }
//
//  int get value => _value.value;
//
//  set value(int newValue) => _value.value = newValue;
//
//  void _increment() {
//    _value.value++;
//  }
//
//  void _decrement() {
//    _value.value -= 2;
//  }
//}

class Counter {
  Counter() {
    increment = Action(_increment);
    decrement = Action(increment);
  }

  final _value = Observable(0);

  int get value => _value.value;

  set value(int newValue) => _value.value = newValue;
  Action increment;
  Action decrement;

  void _increment() {
    _value.value++;
  }
}
