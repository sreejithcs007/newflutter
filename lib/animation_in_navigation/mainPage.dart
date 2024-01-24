import 'package:flutter/material.dart';
import 'package:newflutter/animation_in_navigation/secondPage.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}

class MainPage extends StatelessWidget {
   MainPage({super.key});
  var datecontrllr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryanimation) {
                          return Scond_page_Animation();
                        },
                        transitionsBuilder:
                            (context, animation, secondaryanimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        transitionDuration: Duration(milliseconds: 1000),
                      ));
                },
                child: Text("Fade Animation")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryanimation) {
                          return Scond_page_Animation();
                        },
                        transitionsBuilder:
                            (context, animation, secondaryanimation, child) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                        transitionDuration: Duration(seconds: 1)),
                  );
                },
                child: Text("Scale Animation")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return Scond_page_Animation();
                        },
                        transitionsBuilder: (context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(-1.0, 0.0),
                              end: const Offset(0.0, 0.0),
                            ).animate(animation),
                            child: child,
                          );
                        },
                        transitionDuration: Duration(seconds: 1)),
                  );
                },
                child: Text("Slide Animation")),
            ElevatedButton(onPressed: () {
              Navigator.push(context, PageTransition(type: PageTransitionType.topToBottomPop, child: Scond_page_Animation(), childCurrent: this,
              duration: Duration(seconds: 1)));

            }, child: Text("Using package")),
            TextField(
              controller: datecontrllr,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: IconButton(onPressed: ()async{
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    // String formattedDate =
                    // DateFormat('yyyy-MM-dd').format(pickedDate);
                    // print(
                    //     formattedDate); //formatted date output using intl package =>  2021-03-16
                    // setState(() {
                    //   dateInput.text =
                    //       formattedDate; //set output date to TextField value.
                    // });
                  }

                }, icon: Icon(Icons.calendar_month))
              ),
            )
          ],
        ),
      ),
    );
  }
}
