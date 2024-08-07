import 'package:dots_initial/components/bottom_nav_bar.dart';
import 'package:dots_initial/data/database.dart';
import 'package:dots_initial/models/workouts.dart';
import 'package:dots_initial/pages/add_workout.dart';

import 'package:dots_initial/pages/workoout_view.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Start the fade-in effect
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }
int _selectedIndex = 0;
void navigateBottomBar(int index){
  setState(() {
    _selectedIndex = index;
  });
}
final List<Widget> _pages = [
  const WorkoutView(),
  const AddWorkoutPage(),
];


  Widget build(BuildContext context) {
    
    return  Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        
        title: new Image.asset(
              'images/logo.png',
              fit: BoxFit.cover,
              width: 50,
            ),
        
      ),
      
      
        body: AnimatedOpacity(
        opacity: _opacity,
        duration: const Duration(seconds: 1),
        child: _pages[_selectedIndex],
    ));
    
  }
}