

import 'package:dots_initial/data/database.dart';
import 'package:dots_initial/data/workout_data.dart';
import 'package:dots_initial/internal_pages/Day3.dart';
import 'package:dots_initial/internal_pages/day1.dart';
import 'package:dots_initial/internal_pages/day2.dart';
import 'package:dots_initial/internal_pages/day4.dart';
import 'package:dots_initial/internal_pages/day5.dart';
import 'package:dots_initial/internal_pages/day6.dart';
import 'package:dots_initial/internal_pages/day7.dart';
import 'package:dots_initial/models/cycleName.dart';
import 'package:dots_initial/models/excersizes.dart';
import 'package:dots_initial/models/excsersizeContent.dart';

import 'package:dots_initial/models/workouts.dart';
import 'package:dots_initial/pages/info_page.dart';


import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ExcersizeList extends StatefulWidget {
  Workouts workouts;
    ExcersizeList({super.key, required this.workouts});

  @override
  State<ExcersizeList> createState() => _ExcersizeListState();
}
   
class _ExcersizeListState extends State<ExcersizeList> {
  int pageIndex = 0;
  late List<Widget> pageChosen;
  final _workoutBox = Hive.box<List>('workoutsBox');
  WorkoutDataBase db = WorkoutDataBase();

   
  
  
   
    
  
  
 

   void setPage(int num){
    setState(() {
      print("pagenum is" + num.toString());
      pageIndex = num ;
    });
  }

  void sayComplete(){
    print("completed");
  }

void initState() {
  
  
      db.loadData();
    
  

  super.initState();

  int setAmount = widget.workouts.setAmount;
  List<CycleName> cycleNames = widget.workouts.cycleName;
  List<ExcersizeContent> excersizes = widget.workouts.excersizesContent;
  String workoutName = widget.workouts.name;
  
  //bool isFavorite = widget.workouts.isFavorite;
  

  pageChosen = [];

  for (int i = 0; i < setAmount; i++) {
    if (i < cycleNames.length) {
      switch (i) {
        case 0:
          pageChosen.add(Day1(
            workouts: Workouts(
              name: workoutName,
              setAmount: setAmount,
              cycleName: [cycleNames[i]],
              excersizesContent: excersizes,
              
              //isFavorite: isFavorite,
            ),
          ));
          
        case 1:
          pageChosen.add(Day2(
            workouts: Workouts(
              name: workoutName,
              setAmount: setAmount,
              cycleName: [cycleNames[i]],
              excersizesContent: excersizes,
              //isFavorite: isFavorite,
            ),
          ));
          
        case 2:
          pageChosen.add(Day3(
            workouts: Workouts(
              name: workoutName,
              setAmount: setAmount,
              cycleName: [cycleNames[i]],
              excersizesContent: excersizes,
              //isFavorite: isFavorite,
            ),
          ));
          
        case 3:
          pageChosen.add(Day4(
            workouts: Workouts(
              name: workoutName,
              setAmount: setAmount,
              cycleName: [cycleNames[i]],
              excersizesContent: excersizes,
              //isFavorite: isFavorite,
            ),
          ));
          
        case 4:
          pageChosen.add(Day5(
            workouts: Workouts(
              name: workoutName,
              setAmount: setAmount,
              cycleName: [cycleNames[i]],
              excersizesContent: excersizes,
              //isFavorite: isFavorite,
            ),
          ));
          break;
        case 5:
          pageChosen.add(Day6(
            workouts: Workouts(
              name: workoutName,
              setAmount: setAmount,
              cycleName: [cycleNames[i]],
              excersizesContent: excersizes,
              //isFavorite: isFavorite,
            ),
          ));
          
        case 6:
          pageChosen.add(Day7(
            workouts: Workouts(
              name: workoutName,
              setAmount: setAmount,
              cycleName: [cycleNames[i]],
              excersizesContent: excersizes,
              //isFavorite: isFavorite,
            ),
          ));
          
        default:
          print("Day index out of range");
      }
    } else {
      print("Cycle name index out of range");
    }
  }
}



  
  

  @override

  
  

   
   build(BuildContext context) {
    db.loadData();
    Widget printItem() {
    List<Widget> boxes = [];
    for (int i = 0; i < widget.workouts.setAmount; i++) {
      int displayNum = i+1;
      sayComplete();
      boxes.add(
        
          
          
            Expanded(
              
              child: SizedBox(
                
                height: 35,
                
                child: FloatingActionButton(
                  hoverColor: Color.fromARGB(255, 197, 140, 161),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1),
                    
                  ),
                  onPressed: () => setPage(i),
                  backgroundColor: Color.fromARGB(255, 197, 140, 161),
                  child: Text("Day: " + displayNum.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                  heroTag: i,
                  elevation: 0,
                  
                ),
              ),
            ),
          
        
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: boxes,
    );
  }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.only(top: 55.0),
        child: Center(
          
        
            child: 
            Column(
            
              children: [
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> InfoPage())),
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.transparent,),
                          child: Icon(Icons.arrow_back),
                          
                        )
                        ),
                      Title(color: Colors.black, child: Text(widget.workouts.cycleName[pageIndex].toString(), style: TextStyle(fontSize: 45, fontWeight: FontWeight.w700))),
                      Title(color: Colors.black, child: Text(widget.workouts.name, style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500), )),
                      
                       Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.transparent,),
                          
                          
                        )
                        
                    
                    ],
                  ),
                ),
                  
                  Container(
                    
                    
                    width: 600,
                    height: 50,
                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Expanded(child: printItem()),
                        
                      ],
                    
                  )
                ),
                
                Expanded(
                  
                  child: 
                  Container(
                    
                    child: pageChosen[pageIndex],
                  ),
                )



              ],
              
            ),
          ),
      ),
      
    );
  }
  
}