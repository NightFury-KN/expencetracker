import 'package:expencetracker/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExpenceTracker());
}

class ExpenceTracker extends StatelessWidget {
  const ExpenceTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expence tracker",
      theme: ThemeData.dark(
        
      ),
      home:Homescreen() ,
    );
  }
}


