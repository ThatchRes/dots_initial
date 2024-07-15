import 'dart:convert';

import 'package:dots_initial/components/workout_item.dart';
import 'package:dots_initial/models/tootal_workouts.dart';

import 'package:dots_initial/models/workouts.dart';
import 'package:dots_initial/pages/user_info_page.dart';
import 'package:dots_initial/pages/workoout_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import"package:hovering/hovering.dart";
import 'package:shared_preferences/shared_preferences.dart';

import '../models/tootal_workouts.dart';

class AddWorkoutPage extends StatefulWidget {
  const AddWorkoutPage({super.key});

  @override
  State<AddWorkoutPage> createState() => _AddWorkoutPageState();
}
String DefaultTitle = "New Workout";

void CheckTitle(NewTitle) {
  
}


class _AddWorkoutPageState extends State<AddWorkoutPage> {
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }
  @override
  void _removeWorkout(Workouts workout) {
    setState(() {
      totalWorkouts.remove(workout);
    });
  }
  Future<void> saveData(List<Workouts> totalWorkouts) async {
  final prefs = await SharedPreferences.getInstance();
  List<String> workoutStrings = totalWorkouts.map((workout) => jsonEncode(workout.toJson())).toList();
  await prefs.setStringList('WorkoutList', workoutStrings);
}
Future<List<Workouts>> getData() async {
  final prefs = await SharedPreferences.getInstance();
  List<String>? workoutStrings = prefs.getStringList('WorkoutList');
  

  if (workoutStrings != null) {
    return workoutStrings.map((workoutString) => Workouts.fromJson(jsonDecode(workoutString))).toList();
  } else {
    return [];
  }
}
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[100],
      body: 
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: 
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> UserInfoPage())),
                
                child: Container(
                  decoration: BoxDecoration(color: Colors.blue.withOpacity(0.5) ,
                  borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 20),
                  child: const Center(
                    child: Icon(Icons.add),
                    
                  ),
                ),
              ),
              ),
            
              
              Expanded(child: ListView.builder(itemCount: getAllWorkouts().length, itemBuilder: (context, index) {
            // gett each workout
            
            Workouts individualWorkout = getAllWorkouts()[index];
            //rreturn cart item
            return GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> ExcersizeList(workouts: individualWorkout,), )),
            child: WorkoutItem(
              workouts: individualWorkout,
              onRemove: _removeWorkout,),
          );},),)
            
          ],
        )

    );
  }
}