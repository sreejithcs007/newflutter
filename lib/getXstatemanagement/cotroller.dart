import 'package:get/get.dart';

class Countcntllr extends GetxController{

  var count = 0.obs;
  RxInt count1 = 0.obs; //RxInt count1 = RxInt(0);

  void increment(){
    count++;
  }

  void decrement(){
    count--;
  }
}