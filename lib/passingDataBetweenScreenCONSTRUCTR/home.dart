import 'package:flutter/material.dart';
import 'package:newflutter/passingDataBetweenScreenCONSTRUCTR/ToStateless/statelessScreen.dart';
import 'package:newflutter/passingDataBetweenScreenCONSTRUCTR/tostatefull/statefulScreen.dart';

void main(){
  runApp(MaterialApp(home: DataHome(),));
}

class DataHome extends StatelessWidget {
  String name ="Luminar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DATA PASSING"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen2(name:name,place:"kakkanad")));

            }, child: Text("To Stateless Screen")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen1(name:name,place:"kakkanad")));
            }, child: Text("To Stateful Screen")),
          ],
        ),
      ),
    );
  }
}
