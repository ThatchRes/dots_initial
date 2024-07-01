import 'package:dots_initial/components/workout_item.dart';
import 'package:dots_initial/data/database.dart';
import 'package:dots_initial/models/tootal_workouts.dart';
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
  
  @override
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
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Expanded(child: ListView.builder(itemCount: getAllWorkouts().length, itemBuilder: (context, index) {
            // gett each workout
            
            Workouts individualWorkout = getAllWorkouts()[index];
            //rreturn cart item
            return GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> ExcersizeList(workouts: individualWorkout,), )),
            child: WorkoutItem(
              workouts: individualWorkout),
          );},),)
        ],
      ),
      );
  }
}