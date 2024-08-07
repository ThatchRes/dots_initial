import 'dart:convert';

import 'package:dots_initial/components/FavoritDisp.dart';
import 'package:dots_initial/components/workout_item.dart';
import 'package:dots_initial/data/database.dart';
import 'package:dots_initial/models/favoriteList.dart';

import 'package:dots_initial/models/workouts.dart';
import 'package:dots_initial/pages/workoout_list.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
bool ifFirst = true;

class WorkoutView extends StatefulWidget {
  
  const WorkoutView({super.key});

  @override
  State<WorkoutView> createState() => _WorkoutViewState();
}

class _WorkoutViewState extends State<WorkoutView> {
  final _workoutBox = Hive.box<List>('workoutsBox');
  WorkoutDataBase db = WorkoutDataBase();

  int currentIndex = 0;
    
  

  
  @override
  void initState(){
    //only the first one is loading now - when added it is loaded as only 1 instance of workouts so the other one is getting deleted
    //need to update database on addition of a new box in the day pages. also when the you leave the other page deosnt save. That would most likely need an update function aswell.
      
      print("load");
      db.loadData();
      print(_workoutBox.get('WORKOUTBOX') );
      
      if (ifFirst == true) {
        checkFav();
        ifFirst = false;
        print("firstInit");
        
      } else {
        ifFirst = false;
        print("falseInit");
        
      }
    
  
  
 
   
  super.initState();
}
  

  void _update(Workouts workout) {
    setState(() {
      db.updateDataBase();
    });
  }
  

  
  void _removeWorkout(Workouts workout) {
    setState(() {
      db.totalWorkouts.remove(workout);
      favoriteList.remove(workout);
      checkFav();
      db.updateDataBase();
      
      print("removed");
    });
  } 
  void _onSwipeLeft() {
    setState(() {
      if (favoriteList.isNotEmpty) {
        currentIndex = (currentIndex + 1) % favoriteList.length;
      }
    });
  }

  void _onSwipeRight() {
    setState(() {
      if (favoriteList.isNotEmpty) {
        currentIndex = (currentIndex - 1 + favoriteList.length) % favoriteList.length;
      }
    });
  }
  
 
  void checkFav() {
    for (var i = 0; i < db.totalWorkouts.length; i++) {
      if (db.totalWorkouts[i].isFavorite = true) {
        addFavorite(db.totalWorkouts[i]);
      } else {
        print("didnt execute");
      }
    }
  }
  
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        //adding is working but slidding is not and it is onlt displaying the last one
        children: [
          favoriteList.isEmpty
              ? Container() // Empty container if the list is empty
              : //need to fix so favoriteList is saved on initiliation. For this make it so everything that is favorite is added to the list in the beginning.
              //when you switch pages all of the favorites become true which is wrong. They should be saved or updated at some point.
              //the color is changing on switch but not the falue so it is an issue with the button in wor
              GestureDetector(
                  onHorizontalDragEnd: (details) {
                    if (details.primaryVelocity! < 0) {
                      // Swiped left
                      _onSwipeLeft();
                    } else if (details.primaryVelocity! > 0) {
                      // Swiped right
                      _onSwipeRight();
                    }
                  },
                  child: 
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Favorites", style: TextStyle(fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40,),),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> ExcersizeList(workouts: db.totalWorkouts[currentIndex],), )),
                        child: Favoritdisp(
                                            workouts: favoriteList[currentIndex],
                                            getIndex: currentIndex,
                                          
                                          ),
                      ),
                    ],
                  )
                  
                ),
                 const Padding(
                   padding: EdgeInsets.only(top: 10.0, left: 10, bottom: 10),
                   child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("All Sets", style: TextStyle(fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40,),),
                            ],
                          ),
                 ),
          Expanded(child: ListView.builder(itemCount: db.totalWorkouts.length, itemBuilder: (context, index) {
            // gett each workout
            
            Workouts individualWorkout = db.totalWorkouts[index];
            //rreturn cart item
            return GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> ExcersizeList(workouts: individualWorkout,), )),
            child: WorkoutItem(
              workouts: individualWorkout,
              onRemove: _removeWorkout,
              update: _update,
              removeFavorite: removeFavorite,
              addFavorite: addFavorite,
              check: checkFav,
              ),
          );},),)
        ],
      ),
      );
  }
}