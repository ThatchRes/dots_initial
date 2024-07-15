import 'dart:convert';

import 'package:dots_initial/components/workout_item.dart';
import 'package:dots_initial/data/database.dart';
import 'package:dots_initial/models/tootal_workouts.dart';
import 'package:dots_initial/models/workouts.dart';
import 'package:dots_initial/pages/workoout_list.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import"package:hovering/hovering.dart";
import 'package:shared_preferences/shared_preferences.dart';

class WorkoutView extends StatefulWidget {
  
  const WorkoutView({super.key});

  @override
  State<WorkoutView> createState() => _WorkoutViewState();
}

class _WorkoutViewState extends State<WorkoutView> {
  initState(){
    getData();
  _initializeHive();
  
   WorkoutDataBase db = WorkoutDataBase();
   db.loadData();
  super.initState();
}
  @override
  late final Box<Workouts> _workoutBox;
  

  
  @override

  Future<void> _initializeHive() async {
    // Open the box asynchronously and initialize the database
    _workoutBox = await Hive.openBox<Workouts>('workoutsBox');
    

    if (_workoutBox.get('WORKOUTBOX') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    setState(() {}); // Refresh the state after initialization
  }
  void _removeWorkout(Workouts workout) {
    setState(() {
      totalWorkouts.remove(workout);
    });
  }
  Future<void> saveData(List<Workouts> totalWorkouts) async {
    print('saveDate');
  final prefs = await SharedPreferences.getInstance();
  List<String> workoutStrings = totalWorkouts.map((workout) => jsonEncode(workout.toJson())).toList();
  await prefs.setStringList('WorkoutList', workoutStrings);
  print(workoutStrings);
}
Future<List<Workouts>> getData() async {
  print("gotData");
  final prefs = await SharedPreferences.getInstance();
  List<String>? workoutStrings = prefs.getStringList('WorkoutList');
  

  if (workoutStrings != null) {
    print(workoutStrings);
    return workoutStrings.map((workoutString) => Workouts.fromJson(jsonDecode(workoutString))).toList();
  } else {
    return [];
  }
}
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Expanded(child: ListView.builder(itemCount: totalWorkouts.length, itemBuilder: (context, index) {
            // gett each workout
            
            Workouts individualWorkout = totalWorkouts[index];
            //rreturn cart item
            return GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> ExcersizeList(workouts: individualWorkout,), )),
            child: WorkoutItem(
              workouts: individualWorkout,
              onRemove: _removeWorkout,
              ),
          );},),)
        ],
      ),
      );
  }
}