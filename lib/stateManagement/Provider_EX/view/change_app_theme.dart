
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/theme_controler.dart';

void main(List<String> args) {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: AppStarter()));
}

class AppStarter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).isDarkTheme
          ? ThemeData.dark()
          : ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: App_ThemeChanger(),
    );
  }
}

class App_ThemeChanger extends StatelessWidget {
  const App_ThemeChanger({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFFFCA94),
      appBar: AppBar(
        title: Text("Dark or Light"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Provider.of<ThemeProvider>(context, listen: false).switchTheme();
                },
                child: Provider.of<ThemeProvider>(context).isDarkTheme
                    ? Icon(Icons.light_mode)
                    : Icon(Icons.dark_mode)),
          ),
          SizedBox(height: 60,),
          // Container(
          //   height: 100,
          //   width: 100,
          //   color: Color(0xFFFFCA94),
          // )
        ],
      ),
    );
  }
}
