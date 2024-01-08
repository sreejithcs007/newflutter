import 'package:flutter/material.dart';
import 'package:newflutter/sqfliteeee/loginandregistaration/sqflite_function.dart';

class UserHome extends StatefulWidget{
  final data;
   UserHome({super.key,required this.data});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  var unamecntrller = TextEditingController();
  var uemailcntrller = TextEditingController();
  var name , email;
  @override
  void initState() {
    name = widget.data[0]['name'];
    email = widget.data[0]['email'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    void editdata() {
      setState(() {
        unamecntrller.text = name;
        uemailcntrller.text= email;

      });
      showDialog(context:context , builder: (context){
        return AlertDialog(

          title:Text("EDIT DATA",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),) ,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: unamecntrller,
                  decoration: const InputDecoration(
                    hintText: "NAME",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: uemailcntrller,
                  decoration: const InputDecoration(
                      hintText: "EMAIL",
                      border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){

                  setState(() {
                    name = unamecntrller.text;
                    email = uemailcntrller.text;
                  });
                  updateUser();
                  Navigator.of(context).pop();
                  // unamecntrller.text ="";
                  // uemailcntrller.text="";
                }, child: const Text("UPDATE DATA")
                ),
              )
            ],
          ),
        );
      });
    }

   return Scaffold(
     appBar: AppBar(
       title: Text("Welcome $name",style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
     ),
     body: Card(
       child: ListTile(
         leading: const Icon(Icons.person_outline_outlined),
         title: Text('$name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
         subtitle: Text('$email',style: TextStyle(fontSize: 15,color: Colors.blue[900]),),
         trailing: IconButton(onPressed: (){

           editdata();

         }, icon: Icon(Icons.edit)),
       ),
     )
   );
  }

  void updateUser() async{
    await SQL_Functions.updateData(widget.data[0]['id'],name,email);

  }
}