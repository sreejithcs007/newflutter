
import 'package:flutter/material.dart';
import 'package:newflutter/sharedpreference-Storages/sharedPreference/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

void main(){
  runApp(MaterialApp(home: Log(),));
}

class Log extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => Log2State();

}

class Log2State extends State<Log> {
  var formkey = GlobalKey<FormState>();
  final usercntrll = TextEditingController();
  final pascntrll = TextEditingController();
  late bool newUser ;
  late SharedPreferences preferences;
  @override
  void initState() {
    Check_if_is_user_already_login(); ///whenever we open the app check user is logged in or not
    super.initState();
  }
  ///whwnever we open the app check user is logged in or not so we should create this method
  void Check_if_is_user_already_login() async{
    preferences = await SharedPreferences.getInstance();

    //?? - if the given condition is null second statement will executes.
    newUser = preferences.getBool("newuser") ?? true;

    if(newUser == false){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Home()));
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN !!!" , style: TextStyle(fontSize: 30,color: Colors.deepPurple),),
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

                  decoration: InputDecoration(
                    label: Text("USERNAME", style: TextStyle(color: Colors.red),),
                    hintText: "abc",
                    border: OutlineInputBorder()
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

                  decoration: InputDecoration(
                    label:Text("PASSWORD",style: TextStyle(color: Colors.red),) ,
                    hintText: ".....",
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              MaterialButton(onPressed: (){
                var valid = formkey.currentState!.validate();
                if(valid == true){
                  validateInputs();

                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("INVALID USERNAME OR PASSWORD")));
                }

              },child: Text("LOGIN"),),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Regshared()));
              }, child: Text("NOT A USER..REGISTER"))
            ],
          ),
        ),
      ),


    );
  }

  void validateInputs() async {
    String uname = usercntrll.text;
    String upass = pascntrll.text;

    preferences = await SharedPreferences.getInstance();

    //if a user is logged in then mark it as not a new user
    preferences.setBool("newuser", false);


    //read the register value
    String? stored_uname = preferences.getString("username");
    String? stored_upass = preferences.getString("pass");

    if(stored_uname == uname && stored_upass == upass){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
    }
  }


}