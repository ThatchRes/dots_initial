import 'package:dots_initial/data/database.dart';
import 'package:dots_initial/models/excersizes.dart';
import 'package:dots_initial/models/favoriteList.dart';
import 'package:dots_initial/pages/info_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    // Start the fade-out effect after a delay
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _opacity = 0.0;
      });
      // Navigate to InfoPage after the fade-out effect is complete
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => InfoPage()),
        );
      });
    });
  }
  
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:  Colors.grey[100],
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          Center(child: AnimatedOpacity(
            opacity: _opacity,
            duration:  const Duration(seconds: 1),
            child:  Text("SETS", style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),)))
        ],
      ),
    );
  }
}