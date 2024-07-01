import 'package:dots_initial/data/workout_data.dart';

import 'package:dots_initial/models/excsersizeContent.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

  List<ExcersizeContent> excersizeContent = [];
  
   final _workoutBox = Hive.box("workoutBox");
    excersizeDatabase db = excersizeDatabase();
void initState(){
  if (_workoutBox.get("WORKOUTBOX") == null){
    db.createInitialData();

  } else {
    db.loadData();
  }

  
}



List<ExcersizeContent> getAllExcersizes() {
  return excersizeContent;
}