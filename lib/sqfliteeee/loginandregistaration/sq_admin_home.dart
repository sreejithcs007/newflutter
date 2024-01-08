import 'package:flutter/material.dart';
import 'package:newflutter/sqfliteeee/loginandregistaration/sqflite_function.dart';

class AdminHome extends StatefulWidget {
  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  List<Map<String,dynamic>> users =[];  //to store all the registered users
  @override
  void initState() {
    getAllUsers();
    super.initState();
  }
  void getAllUsers() async{
    var usersFromDb = await SQL_Functions.All_Users_data();
    setState(() {
      users = usersFromDb;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADMIN PANEL"),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context,index)=>
              Card(
                child: ListTile(
                  leading:Text("${users[index]['id']}") ,
                  title: Text(users[index]['name']),
                    subtitle: Text(users[index]['email']),
                  trailing: IconButton(onPressed: (){
                    deleteUser(users[index]['id']);
                  }, icon: Icon(Icons.delete)),
                ),
              )
              )


    );
  }

  void deleteUser(int id) async{
    await SQL_Functions.delete_user(id);
    getAllUsers(); //to refresh the list or ui
  }


}