import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class Home extends StatefulWidget {


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late SharedPreferences preference ;
   String? username;
  @override
  void initState() {
   FetchData();
    super.initState();
  }
  void FetchData() async{
    preference = await SharedPreferences.getInstance();
    setState(() {
      username = preference.getString("username")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Welcome $username !!!!!!"),
        actions: [
          IconButton(onPressed: (){
            preference.setBool("newuser", true);

            Navigator.push(context, MaterialPageRoute(builder: (context)=>Log()));

          }, icon: Icon(Icons.logout))
        ],
      ),
    );
  }


}
