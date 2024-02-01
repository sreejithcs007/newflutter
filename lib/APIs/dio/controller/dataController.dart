import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../model/datamodel.dart';
import '../services/dioService.dart';

class DataController extends GetxController{
  RxList<DataModel>  datas = RxList(); /// similar to var datas = [].obs
  RxBool isLoading = true.obs;
  RxBool isListDown = false.obs;
  RxBool isNetConnected = true.obs;

  var url = "https://jsonplaceholder.typicode.com/posts";
  var scrollController = ItemScrollController();    /// to control positions of  scrollable positioned List


  ///to check the internet is connected or not
  void isInternetConnected() async{
    isNetConnected.value = await InternetConnectionChecker().hasConnection;
  }

  ///to get or fetch all the data from api

  fetchData() async{
    isInternetConnected();
    isLoading.value = true;
    var response = await DioService().getData(url);
    if(response.statusCode == 200){
      response.data.forEach((data){
        datas.add(DataModel.fromJson(data));
      });
      isLoading.value = false;
    }
  }

  ///to scroll listview to down
 scrollDown(){
    scrollController.scrollTo(index: datas.length, duration: Duration(seconds: 3),curve: Curves.bounceIn);
    isListDown.value = true;
 }
  ///to scroll listview to up
 scrollUp(){
    scrollController.scrollTo(index: 0, duration: Duration(seconds: 4),curve: Curves.bounceOut);
    isListDown.value = false;
 }

 void onInit(){
    fetchData();
    isInternetConnected();
    super.onInit();
 }

}