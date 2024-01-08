import 'package:flutter/material.dart';
import 'package:newflutter/sqfliteeee/loginandregistaration/sq_admin_home.dart';
import 'package:newflutter/sqfliteeee/loginandregistaration/sq_registration.dart';
import 'package:newflutter/sqfliteeee/loginandregistaration/sq_user_home.dart';
import 'package:newflutter/sqfliteeee/loginandregistaration/sqflite_function.dart';

void main(){
  runApp(MaterialApp(home: SqLog(),));
}
class SqLog extends StatelessWidget{
  final validkey = GlobalKey<FormState>();
  final passcntrllr = TextEditingController();
  final emailcntrllr = TextEditingController();
  @override
  Widget build(BuildContext context) {


    void loginUser(String email, String password) async{
      ///admin login
      if(email == 'admin@gmail.com' && password == 'admin123'){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminHome()));
      }
      else{
        //check if user is exist in db
        var data = await SQL_Functions.checkUserExist(email,password);
        if(data.isNotEmpty){
          Navigator.push(context, MaterialPageRoute(builder: (context) => UserHome(data: data)));
        }
      }

    }

    return Scaffold(
      body: Center(
        child: Form(
          key: validkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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

              ElevatedButton(onPressed: (){
                var valid = validkey.currentState!.validate();
                if(valid == true){
                  loginUser(emailcntrllr.text,passcntrllr.text);

                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("PLEASE VERIFY ALL FIELD")));
                }
              },
                  style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blueGrey)) ,
                  child: const Text("LOGIN",style: TextStyle(color: Colors.greenAccent),)
              ),
              TextButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SqReg()));
              },
                  child: const Text("DONT HAVE AN ACCOUNT ! REGISTER NOW!!")
              )


            ],
          ),
        ),
      ),
    );
  }


}