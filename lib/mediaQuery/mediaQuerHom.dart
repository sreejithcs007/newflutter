import 'package:flutter/material.dart';
void main(){

  runApp(MaterialApp(home: mainPageMedia(),));
}

class mainPageMedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    //
    return Scaffold(
      body: width > 600 ? BigScreen() : MobileScreen(),
    );
  }
}

class MobileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobile Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  color: Colors.pink,
                  child: Text("Video $index"),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class BigScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Big Screen"),
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(

                      itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Card(
                        color: Colors.pink,
                        child: Text("Video $index"),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(

                  itemBuilder: (context,index){
                return Padding(padding: EdgeInsets.all(12),
                child: Card(
                  color: Colors.orange,
                  child: Text("Video $index"),
                ),
                );

              })

          )
        ],
      ),
    );
  }
}
