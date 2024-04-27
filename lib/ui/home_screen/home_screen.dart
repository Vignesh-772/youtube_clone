import 'package:flutter/material.dart';
import 'package:youtube_clone/ui/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:youtube_clone/ui/home_screen/home_screen_header.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: const Column(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[HomescreenHeader()],
          )),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
