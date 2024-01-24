import 'package:flutter/material.dart';
import 'package:newflutter/firebaseStorage/email_password_auth/firefunction.dart';

import 'login.dart';

class FireReg extends StatelessWidget {
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                color: Colors.blueGrey,
                onPressed: () {
                  String email = emaill.text.trim();
                  String pass = passw.text.trim();
                  FireBaseHelper()
                      .registerUser(email: email, pwd: pass)
                      .then((result) {
                    if (result == null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FireLogin()));
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(result)));
                    }
                  });
                },
                child: Text("REGISTER"),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FireLogin()));
                },
                child: Text("Already have an account ? Login !!"))
          ],
        ),
      ),
    );
  }
}
