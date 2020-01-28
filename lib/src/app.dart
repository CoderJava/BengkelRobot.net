import 'package:flutter/material.dart';
import 'package:website_bengkel_robot/src/ui/home/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BengkelRobot',
      home: HomeScreen(),
    );
  }
}
