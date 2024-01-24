//
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newflutter/firebaseStorage/email_password_auth/login.dart';

import 'firefunction.dart';

class FireHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME PAGE"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          FireBaseHelper().logout().then((value) => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FireLogin())));

          //FirebaseAuth.instance.signOut().then((value) => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FireLogin())) );
        }, child: Text("SIGNOUT"))
      ),
    );
  }
}
