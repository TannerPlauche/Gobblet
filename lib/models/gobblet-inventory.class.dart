import 'package:flutter/widgets.dart';

class Inventory {
  SizeInventory small;
  SizeInventory med;
  SizeInventory large;
  Color color;

  Inventory(int count, Color color) {
    this.small = SizeInventory(gobbletSizes.small, count, color);
    this.med = SizeInventory(gobbletSizes.med, count, color);
    this.large = SizeInventory(gobbletSizes.large, count, color);
    this.color = color;
  }
}

class SizeInventory {
  gobbletSizes size;
  int count;
  Color color;

  SizeInventory(gobbletSizes size, int count, Color color) {
    this.size = size;
    this.color = color;
    this.count = count;
  }
}

enum gobbletSizes { small, med, large }

enum colors { black, red }

const Map SizeLookup = {'small': 25, 'med': 50, 'large': 75};
