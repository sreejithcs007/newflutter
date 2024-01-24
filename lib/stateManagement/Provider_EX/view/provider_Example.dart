///provider Example using manualy creating object 
///and calling functions and value using that object

import '../controller/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: ChangeNotifierProvider(
      // geting provider connection from controller class
      create: (context) => CounterProvider(), //connecting to controller class
      child: Counter_Provider_EX(), //connected to ui
    ),
  ));
}

class Counter_Provider_EX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var counterController = Provider.of<CounterProvider>(context);//method 1st step1
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Using Provider \n Using 1st method"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You have clicked ",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Counter Value:${counterController.counter_value.value}",//method 1 step2
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  counterController
                      .increment_Count(); //using method from controller//"method 1 step3"
                },
                child: Icon(
                  Icons.add,
                  size: 20,
                ))
          ],
        ),
      ),
    );
  }
}
