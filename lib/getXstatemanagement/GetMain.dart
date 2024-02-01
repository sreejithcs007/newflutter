import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newflutter/getXstatemanagement/cotroller.dart';

void main(){
  runApp(GetMaterialApp(home: GetMAin(),));
}

class GetMAin extends StatelessWidget {
  const GetMAin({super.key});

  @override
  Widget build(BuildContext context) {
    final Countcntllr controller = Get.put(Countcntllr());
    return Scaffold(
      appBar: AppBar(title: Text("Counter Example"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(()=> Text("Count = ${controller.count}")),
            ElevatedButton(onPressed: ()=>controller.increment(), child: Text("Increment")),
            ElevatedButton(onPressed: ()=>controller.decrement(), child: Text("Decrement")),
          ],

        ),
      ),
    );
  }
}
