import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newflutter/firebaseStorage/email_password_auth/firefunction.dart';
import 'package:newflutter/firebaseStorage/email_password_auth/registration.dart';

import 'home.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(
      apiKey: "AIzaSyDy7RlzRyNIxNZY8oF0lSxrnCnDtPXTmUA",
      appId: "1:529045249107:android:306657d24773aba4a7baa6",
      messagingSenderId: "",
      projectId: "fir-oper-b60ed"));
  User? user = FirebaseAuth.instance.currentUser;
  runApp(MaterialApp(home: user == null ? FireLogin() : FireHome(),));
}

class FireLogin extends StatelessWidget {
  final emaill = TextEditingController();
  final passw = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emaill,
                decoration: InputDecoration(
                  labelText: "EMAIL",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passw,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            MaterialButton(
              color: Colors.blueGrey,
              onPressed: () {
                String email = emaill.text.trim();
                String pwd = passw.text.trim();

                FireBaseHelper().loginUser(email: email, pwd: pwd).then((result){
                  if(result == null){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FireHome()));

                  }else{
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(result)));
                  }
                });


              },
              child: Text("LOGIN"),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FireReg()));
                },
                child: Text("Dont have an account ? Register Here!!"))
          ],
        ),
      ),
    );
  }
}
