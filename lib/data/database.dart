import 'package:dots_initial/models/cycleName.dart';
import 'package:dots_initial/models/excsersizeContent.dart';

import 'package:dots_initial/models/workouts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WorkoutDataBase {
List<Workouts> totalWorkouts = [];

  
  final _workoutBox = Hive.box<List>('workoutsBox');
  
  void createInitialData(){
    print("init created");
    totalWorkouts = [];
    updateDataBase();
  }
  void loadData() {
    var storedWorkouts = _workoutBox.get('WORKOUTBOX');
    print('Stored workouts: $storedWorkouts');
    if (storedWorkouts != null) {
       totalWorkouts = List<Workouts>.from(storedWorkouts.map((workout) => workout as Workouts));
      print('Loaded workouts from box: $totalWorkouts');
    } else {
      print('Creating initial data');
      createInitialData();
    }
  }
  


   void updateDataBase() {
    _workoutBox.put("WORKOUTBOX", totalWorkouts);
  }
}