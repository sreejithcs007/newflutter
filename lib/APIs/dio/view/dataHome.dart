import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:newflutter/APIs/dio/controller/dataController.dart';
import 'package:newflutter/APIs/dio/utils/colors.dart';
import 'package:newflutter/APIs/dio/utils/const_snackbr.dart';
import 'package:path/path.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DataHomeDio extends StatelessWidget {
  DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DIO"),
        backgroundColor: MyColors.prColor,
      ),
      backgroundColor: MyColors.bgColor,
      floatingActionButton: Obx(
              () =>
          controller.isNetConnected.value
              ? _buildFAB()
              : Container()),

      body: Obx(() =>
          SizedBox(height: double.infinity, width: double.infinity,
            child: controller.isNetConnected.value ? (controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : getData()) :  noInternet(context),)),
    );
  }
  RefreshIndicator getData() {
    return RefreshIndicator( onRefresh: (){
      return controller.fetchData();
    },
      child: ScrollablePositionedList.builder(
          itemScrollController: controller.scrollController,
          itemCount: controller.datas.length, itemBuilder: (context,index){
        return InkWell(
         // onTap: Get.to(),
          child: Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: MyColors.scColor,
                child: Text(controller.datas[index].id.toString()),
              ),
              title: Text("${controller.datas[index].title}"),
              subtitle: Text("${controller.datas[index].body}"),
            ),

          ),
        ) ;
      }) ,
    );

  }

  FloatingActionButton _buildFAB() {
    return FloatingActionButton(
      onPressed: () {
        controller.isListDown.value
            ? controller.scrollUp()
            : controller.scrollDown();
      },
      backgroundColor: MyColors.prColor,
      child: FaIcon(controller.isListDown.value
          ? FontAwesomeIcons.arrowUp
          : FontAwesomeIcons.arrowDown),
    );
  }

  Center noInternet(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("NO INTERNET"),
          MaterialButton(onPressed: () async{
            if(await InternetConnectionChecker().hasConnection){
              controller.fetchData();
            }
            else{
              showCustomSnackBar(context);
            }
          },
          child: Text("retry"),)

        ],

      ),
    );
  }



}
