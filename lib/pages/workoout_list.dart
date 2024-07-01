

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
import 'package:dots_initial/pages/profile_page.dart';

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
  late final Box<Workouts> _workoutBox;
  late WorkoutDataBase db;
  late final Box<ExcersizeContent> _excersizeBox;
  late excersizeDatabase edb;

   
  
  
   
    
  
  
 

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
  
  

  super.initState();

  int setAmount = widget.workouts.setAmount;
  List<CycleName> cycleNames = widget.workouts.cycleName;
  List<ExcersizeContent> excersizes = widget.workouts.excersizesContent;
  String workoutName = widget.workouts.name;
  

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
            ),
          ));
          
        case 1:
          pageChosen.add(Day2(
            workouts: Workouts(
              name: workoutName,
              setAmount: setAmount,
              cycleName: [cycleNames[i]],
              excersizesContent: excersizes,
            ),
          ));
          
        case 2:
          pageChosen.add(Day3(
            workouts: Workouts(
              name: workoutName,
              setAmount: setAmount,
              cycleName: [cycleNames[i]],
              excersizesContent: excersizes,
            ),
          ));
          
        case 3:
          pageChosen.add(Day4(
            workouts: Workouts(
              name: workoutName,
              setAmount: setAmount,
              cycleName: [cycleNames[i]],
              excersizesContent: excersizes,
            ),
          ));
          
        case 4:
          pageChosen.add(Day5(
            workouts: Workouts(
              name: workoutName,
              setAmount: setAmount,
              cycleName: [cycleNames[i]],
              excersizesContent: excersizes,
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
            ),
          ));
          
        case 6:
          pageChosen.add(Day7(
            workouts: Workouts(
              name: workoutName,
              setAmount: setAmount,
              cycleName: [cycleNames[i]],
              excersizesContent: excersizes,
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
  Future<void> _initializeHive() async {
    // Open the box asynchronously and initialize the database
    _workoutBox = await Hive.openBox<Workouts>('workoutsBox');
    WorkoutDataBase db = WorkoutDataBase();
    _excersizeBox = await Hive.openBox("excersizeBox");
      WorkoutDataBase edb = WorkoutDataBase();
    if (_workoutBox.get('WORKOUTBOX') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    if (_excersizeBox.get('EXCERSIZEBOX') == null) {
      edb.createInitialData();
    } else {
      edb.loadData();
    }

    setState(() {}); // Refresh the state after initialization
  }
  
  
   
   build(BuildContext context) {
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
                  hoverColor: Colors.grey[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1),
                    
                  ),
                  onPressed: () => setPage(i),
                  backgroundColor: Colors.grey[300],
                  child: Text("Day: " + displayNum.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[600]),),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> InfoPage())),
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.transparent,),
                          child: Icon(Icons.arrow_back),
                          
                        )
                        ),
                      Title(color: Colors.black, child: Text(widget.workouts.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), )),
                      
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