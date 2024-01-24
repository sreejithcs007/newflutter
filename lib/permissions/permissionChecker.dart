import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

void main(){
  runApp(MaterialApp(home: Permissionss(),));

}

class Permissionss extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(color: Colors.red,onPressed: (){
            askCameraPermission(context);
          },child: Text("camera Permission"),),
         // Spacer(flex: 1,),
          MaterialButton(color:Colors.pink,onPressed: (){
            askMultiplePermission();
          },child: Text("Multiple Permission"),),
          // Spacer(flex: 1,),
          MaterialButton(color:Colors.blue,onPressed: (){
            openAppSettingss();
          },child: Text("Settings"),),
        ],
      ),
    );
  }

  void askCameraPermission( context) async{
    var status = await Permission.camera.status;
    if(await Permission.camera.request().isGranted){
      var picker = ImagePicker();
      picker.pickImage(source: ImageSource.camera);
    }
    else if(status.isDenied){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("CAMERA ACCESS DENIED") ));
    }

  }

  void askMultiplePermission() async{
    Map<Permission,PermissionStatus> status = await [Permission.location,
      Permission.contacts,
      Permission.photos,Permission.mediaLibrary,Permission.microphone,Permission.phone,Permission.camera].request();

    print("Status Location ${status[Permission.location]}");
    print("Status photos ${status[Permission.photos]}");




  }

  void openAppSettingss() async{
    openAppSettings();
  }


}