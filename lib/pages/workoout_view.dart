import 'dart:convert';

import 'package:dots_initial/components/workout_item.dart';
import 'package:dots_initial/data/database.dart';

import 'package:dots_initial/models/workouts.dart';
import 'package:dots_initial/pages/workoout_list.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';


class WorkoutView extends StatefulWidget {
  
  const WorkoutView({super.key});

  @override
  State<WorkoutView> createState() => _WorkoutViewState();
}

class _WorkoutViewState extends State<WorkoutView> {
  final _workoutBox = Hive.box<Workouts>('workoutsBox');
  WorkoutDataBase db = WorkoutDataBase();

 
  @override
  void initState(){
    if (_workoutBox.get("WORKOUTLIST") == null) {
      print(db.totalWorkouts);
      db.createInitialData();
      
      print("make");
    } else {
      print("load");
      db.loadData();
    }
  
  
 
   
  super.initState();
}
  

  
  

  
  void _removeWorkout(Workouts workout) {
    setState(() {
      db.totalWorkouts.remove(workout);
      db.updateDataBase();
    });
  }
  
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Expanded(child: ListView.builder(itemCount: db.totalWorkouts.length, itemBuilder: (context, index) {
            // gett each workout
            
            Workouts individualWorkout = db.totalWorkouts[index];
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