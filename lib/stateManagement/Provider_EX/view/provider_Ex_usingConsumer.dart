
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/counter_controller.dart';

///provider Example using Consumer method
/// by not creating an object and using method "consumer"

void main(List<String> args) {
  runApp(MaterialApp(
    home: ChangeNotifierProvider(
      // geting provider connection from controller class
      create: (context) => CounterProvider(), //connecting to controller class
      child: ProviderEx_Consumer(), //connected to ui
    ),
  ));
}

class ProviderEx_Consumer extends StatelessWidget {
  const ProviderEx_Consumer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Using Provider \n Using Consumer"),
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
              "Counter Value:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Consumer<CounterProvider>(builder: (context, counterobj, child) {
              return Text("${counterobj.counter_value.value}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
            }),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Provider.of<CounterProvider>(context,listen: false).increment_Count();
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
