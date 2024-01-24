import 'dart:math';

import 'package:flutter/material.dart';

void main(){
  runApp(MyScreen());
}

class MyScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var isdark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return MaterialApp(
      theme : isdark == true ? ThemeData.dark() : ThemeData.light(),
        home: Orientationss(),
    );
  }

}

class Orientationss extends StatelessWidget{
  var orientation;
  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: orientation == Orientation.portrait ? ListScreen() : GridScreen(),
      
    );
  }
  
  
}

class GridScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GridScreen"),),
      body: GridView.count(crossAxisCount: 4,crossAxisSpacing: 30,mainAxisSpacing: 30,
        children: List.generate(20, (index) =>
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],

          ),
          child: Text("Grid$index"),
        ),
      )
    )
    );
  }
}

class ListScreen  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListScreen"),),
      body: ListView.builder(itemBuilder: (context,index){
        return Padding(padding: EdgeInsets.all(12),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage("https://i.pinimg.com/564x/b2/9d/d6/b29dd6c65ccc4923147a4cf29623e243.jpg"),fit: BoxFit.fill)
          ),
        ),
        );
      }),
      
    );
  }
}