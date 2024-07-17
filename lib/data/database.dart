import 'package:dots_initial/models/cycleName.dart';
import 'package:dots_initial/models/excsersizeContent.dart';

import 'package:dots_initial/models/workouts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WorkoutDataBase {
List<Workouts> totalWorkouts = [];
  
  
  final _workoutBox = Hive.box<Workouts>('workoutsBox');
  
  void createInitialData(){
    totalWorkouts = [];
  }
  void loadData() {
    totalWorkouts = _workoutBox.get('WORKOUTBOX') as List<Workouts>;
  }



  void updateDataBase() {
    _workoutBox.put("WORKOUTBOX", totalWorkouts as Workouts);
  }
}