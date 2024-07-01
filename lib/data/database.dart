import 'package:dots_initial/models/cycleName.dart';
import 'package:dots_initial/models/excsersizeContent.dart';
import 'package:dots_initial/models/tootal_workouts.dart';
import 'package:dots_initial/models/workouts.dart';
import 'package:hive_flutter/hive_flutter.dart';
late final Box _workoutBox;
class WorkoutDataBase {

  
  

  
Future<void> initialize() async {
  
     _workoutBox = await Hive.box('workoutsBox');
  }

  

   createInitialData(){
    
    return totalWorkouts;
    
  }

  Future<void> loadData() async{
    // Retrieve the data from the box and cast it to List<Workouts>
    var storedWorkouts =  _workoutBox.get("WORKOUTBOX") as List<Workouts>;

    // Ensure the dynamic list is properly cast to List<Workouts>
    totalWorkouts = storedWorkouts.cast<Workouts>();
  }
  void updateDataBase() {
    _workoutBox.put("WORKOUTBOX", totalWorkouts);
  }
}