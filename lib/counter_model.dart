import 'package:flutter/cupertino.dart';

class CounterModel extends ChangeNotifier {
  int counter = 0;

  void incrementcounter() {
    counter++;
    notifyListeners();
  }

  void decrementcounter() {
    counter--;
    notifyListeners();
  }
}
