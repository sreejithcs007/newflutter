import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ScreenAnime(),
  ));
}

class ScreenAnime extends StatefulWidget {
  const ScreenAnime({super.key});

  @override
  State<ScreenAnime> createState() => _ScreenAnimeState();
}

class _ScreenAnimeState extends State<ScreenAnime>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  ///to control animated state .eg:start , stop,pause
  late Animation<double> animation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void startAnimation() {
    if (controller.isDismissed) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("ANIMATED ICON")),),
      body: Center(
        child: InkWell(
            onTap: () => startAnimation(),
            child: AnimatedIcon(
                size: 50, icon: AnimatedIcons.play_pause, progress: animation)),
      ),
    );
  }
}
