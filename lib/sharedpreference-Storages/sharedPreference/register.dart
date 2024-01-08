
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class Regshared extends StatefulWidget {
  const Regshared({super.key});

  @override
  State<Regshared> createState() => _RegsharedState();
}

class _RegsharedState extends State<Regshared> {

  var formkey = GlobalKey<FormState>();
  final usercntrll = TextEditingController();
  final pascntrll = TextEditingController();
  late SharedPreferences shrd ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REGISTER !!!" , style: TextStyle(fontSize: 30,color: Colors.deepPurple),),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: usercntrll,
                  validator: (name){
                    if(name!.isEmpty || !name.contains("@") || !name.contains("gmail.com") ){
                      return "FORMAT DOESN'T MEET";
                    }
                    else{
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                      label: Text("USERNAME", style: TextStyle(color: Colors.red),),
                      hintText: "abc",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: pascntrll,
                  validator: (pass){
                    if(pass!.isEmpty || pass.length < 10 ){
                      return "LENGTH MUST BE ATLEAST 10";
                    }
                    else{
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                      label:Text("PASSWORD",style: TextStyle(color: Colors.red),) ,
                      hintText: ".....",
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              MaterialButton(onPressed: (){
                var valid = formkey.currentState!.validate();
                if(valid == true){
                  storeData();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Log()));
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("INVALID INPUTS!!!")));
                }


              },child: Text("REGISTER"),),
              TextButton(onPressed:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=> Log()));},
                  child: Text("ALREADY A USER !! CLICK HERE"))

            ],
          ),
        ),
      ),


    );
  }

  void storeData() async{
    String email = usercntrll.text.trim();
    String password = pascntrll.text.trim();
    shrd = await SharedPreferences.getInstance();
    shrd.setString("username", email);
    shrd.setString("pass", password);


  }
}