import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/auth_provider.dart';
import '../provider/counter_Provider.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => Count_provider()),
      ChangeNotifierProvider(create: (context) => Auth_Provider()),
    ],
    child:Multi_Provider() ,),
  ));
}

class Multi_Provider extends StatelessWidget {
  const Multi_Provider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter Value: ${Provider.of<Count_provider>(context).count}",
                style: TextStyle(
                  fontSize: 20,
                )),
            ElevatedButton(
                onPressed: () {
                  Provider.of<Count_provider>(context, listen: false).increment();
                },
                child: Icon(Icons.add)),
            SizedBox(
              height: 30,
            ),
            Text(
              "Auth Details",
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
                onPressed: () {
                  Provider.of<Auth_Provider>(context,listen: false).login
                      ? Provider.of<Auth_Provider>(context,listen: false).logedOut()
                      : Provider.of<Auth_Provider>(context,listen: false).logedin();
                },
                child: Icon(Icons.login_rounded)),
            Consumer<Auth_Provider>(builder:
                (BuildContext context, Auth_Provider value, Widget? child) {
              return Text("User is : ${value.login ? "logged in" : "logged out"}");
            })
          ],
        ),
      ),
    );
  }
}
