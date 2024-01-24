
import 'package:flutter/material.dart';

import '../model/count.dart';

class CounterProvider extends ChangeNotifier {
  Count _incCounter = Count(0);
  Count get counter_value => _incCounter;

  void increment_Count() {
    _incCounter.value++;
    notifyListeners();
  }
}
