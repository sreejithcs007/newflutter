import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: HeroAnime(),));
}

class HeroAnime extends StatelessWidget {
  const HeroAnime({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HERO MAIN PAGE"),
        backgroundColor: Colors.red,
        elevation: 5,
      ),
      body: GestureDetector(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => HeroDetails())),
        child: Hero(
          tag: 'imageHero',
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.green),
            width: 100,
            height: 100,
            child: Icon(
              Icons.tour,
              size: 50,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("HERO DETAILS PAGE"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => HeroAnime())),
          child: Hero(
            tag: 'imageHero',
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.blue),
              width: 300,
              height: 300,
              child: Icon(
                Icons.playlist_add_check_circle_rounded,
                size: 100,
              ),
            ),
          ),
        ),
      ),

    );
  }
}
