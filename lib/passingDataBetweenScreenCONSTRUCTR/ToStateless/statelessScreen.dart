import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  String name;     ///data received from the constructor
  String? place;
   Screen2({super.key,required this.name, this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome $name"),
            Text("LOCATED AT $place"),
          ],
        ),
      ),

    );
  }
}
