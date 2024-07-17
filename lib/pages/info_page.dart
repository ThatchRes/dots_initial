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
  
  @override

  
  
void initState(){
   

  super.initState();
  
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
        backgroundColor: Colors.transparent,
        
        title: Text("DoTS", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),),
        
      ),
      
      drawer: Drawer(
        backgroundColor: Colors.grey[500],
        ),
        body: _pages[_selectedIndex],
    );
    
  }
}