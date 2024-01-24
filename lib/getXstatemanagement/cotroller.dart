import 'package:get/get.dart';

class Countcntllr extends GetxController{

  var _count = 0.obs;
  RxInt count1 = 0.obs; //RxInt count1 = RxInt(0);

  void _increment(){
    _count++;
  }

  void _decrement(){
    _count--;
  }
}