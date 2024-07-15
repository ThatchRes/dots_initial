import 'dart:ffi';

import 'package:dots_initial/data/database.dart';
import 'package:dots_initial/models/workouts.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
List<Workouts> totalWorkouts = [];
final _workoutBox = Hive.box("workoutBox");
    WorkoutDataBase db = WorkoutDataBase();
void initState(){
  if (_workoutBox.get("WORKOUTBOX") == null){
    db.createInitialData();

  } else {
    db.loadData();
    
  }

  
}



List<Workouts> getAllWorkouts() {
  return totalWorkouts;
}

