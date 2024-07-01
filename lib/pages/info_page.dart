import 'package:dots_initial/components/bottom_nav_bar.dart';
import 'package:dots_initial/data/database.dart';
import 'package:dots_initial/models/workouts.dart';
import 'package:dots_initial/pages/add_workout.dart';
import 'package:dots_initial/pages/profile_page.dart';
import 'package:dots_initial/pages/workoout_view.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late final Box<Workouts> _workoutBox;
  late WorkoutDataBase db;
  @override

  Future<void> _initializeHive() async {
    // Open the box asynchronously and initialize the database
    _workoutBox = await Hive.openBox<Workouts>('workoutsBox');
    WorkoutDataBase db = WorkoutDataBase();

    if (_workoutBox.get('WORKOUTBOX') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    setState(() {}); // Refresh the state after initialization
  }
  
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
  const ProfilePage(),
];


  Widget build(BuildContext context) {
    
    return  Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar:  AppBar(
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) => 
          IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          } , icon: Icon(Icons.menu)),
          ),
        title: Text("DoTS", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),),
        
      ),
      
      drawer: Drawer(
        backgroundColor: Colors.grey[500],
        ),
        body: _pages[_selectedIndex],
    );
    
  }
}