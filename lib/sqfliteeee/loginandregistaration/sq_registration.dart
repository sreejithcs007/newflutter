import 'package:flutter/material.dart';
import 'package:newflutter/sqfliteeee/loginandregistaration/sq_login.dart';
import 'package:newflutter/sqfliteeee/loginandregistaration/sqflite_function.dart';

// void main(){
//   runApp(MaterialApp(home: SqReg(),));
// }
class SqReg extends StatelessWidget{
  final validkey = GlobalKey<FormState>();
  final usercntrllr = TextEditingController();
  final passcntrllr = TextEditingController();
  final emailcntrllr = TextEditingController();
  @override
  Widget build(BuildContext context) {

    void registerUser(String name, String email, String password) async{
      var id = await SQL_Functions.addUser(name,email,password);   ///id that return when we add new user
      print(id);
      if(id != null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SqLog()));
      }



    }

    return Scaffold(
      body: Form(
        key: validkey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: usercntrllr,
                  decoration: const InputDecoration(
                    hintText: "NAME",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailcntrllr,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  validator: (email){
                    if(email!.isEmpty || !email.contains("@") || !email.contains("gmail.com")){
                      return "INVALID EMAIL";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passcntrllr,
                  decoration: const InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(),
                  ),
                  validator: (pass){
                    if(pass!.isEmpty || pass.length < 6){
                      return "ATLEAST 6 CHARACTER MUST BE ENTERED";
                    }
                  },

                ),
              ),

              ElevatedButton(onPressed: () async{
                var valid = validkey.currentState!.validate();
                if(valid == true){
                  var users = await SQL_Functions.checkUserAlreadyRegistered(emailcntrllr.text);
                  if(users.isNotEmpty){
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("USER ALREADY EXIST WITH SAME EMAIL")));

                  }
                  else {
                    registerUser(
                        usercntrllr.text, emailcntrllr.text, passcntrllr.text);
                  }
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("REQUIREMENTS DOESNT MEET?")
                  )
                  );
                }

              },
                  style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                  child: const Text("REGISTER",style: TextStyle(color: Colors.greenAccent),))


            ],
          ),
        ),
      ),
    );
  }




}