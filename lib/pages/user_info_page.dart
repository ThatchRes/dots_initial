

import 'package:dots_initial/data/database.dart';
import 'package:dots_initial/models/cycleName.dart';
import 'package:dots_initial/models/excersizes.dart';
import 'package:dots_initial/models/excsersizeContent.dart';
import 'package:dots_initial/models/tootal_workouts.dart';
import 'package:dots_initial/models/workouts.dart';

import 'package:dots_initial/pages/add_workout.dart';
import 'package:dots_initial/pages/info_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}


class _UserInfoPageState extends State<UserInfoPage> {
  final DayNames = TextEditingController();
  List<TextEditingController> _controllers = [];
  
    WorkoutDataBase db = WorkoutDataBase();
  
  
   var MidName = "no name";
   var MidCycle = 0;
   var dayNameCycle = "no name";
    List<CycleName> nameList = [];
  
  void Function()? setName() {
    setState(() {
      if (WorkoutName.text == "") {
        MidName == "no name";
      } else
      MidName = WorkoutName.text;
      WorkoutName.text = "";
      
    });
    
  }
  void initState() {
    

  

    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    for (int i = 0; i < 7; i++) {
      _controllers.add(TextEditingController());
    }
  }
  void Function()? setDayName(int num) {
    setState(() {
      if (_controllers[num].text == "" || _controllers[num].text == " ") {
        return;
      } else
      dayNameCycle = _controllers[num].text;
      nameList.add(CycleName(name: dayNameCycle));
      print(_controllers[num].text);
      print(nameList);
      DayNames.text = "";
    });
    
  }

void pressCycle(){
  nameEntries();
}

   Function(TapDownDetails)? setAllFinal() {
    setState(() {
        totalWorkouts.add(Workouts(name: MidName, setAmount: MidCycle, cycleName:  nameList, excersizesContent: [ExcersizeContent(name: "place", description: "holder", sets: "1", initNum: 1)]));
       
      
      
    });
    
  }
   Widget nameEntries() {
    print("nameEntry");
    List<Widget> textBoxes = [];
    for(int i = 0; i < MidCycle; i++){
      setState(() {
        textBoxes.add(
        SizedBox(width: 55,child: TextField(controller: _controllers[i],),));
        setDayName(i);
      });
      
      
    }
    
    return (Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: textBoxes,
    ));
  }
  final WorkoutName = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all( 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                    children: [
                      Row(
                        children: [
                          Text("Name of workout:", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: SizedBox(width: 200, child: TextField(controller: WorkoutName)),
                          ),
                        ],
                      ),
                      
                      
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: [
                    
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                      width: 55,
                      height: 35,
                      
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1),
                      ),
                        onPressed: () {
                           pressCycle();
                         MidCycle = 1;},
                       
                       backgroundColor: Colors.grey[300],
                       child:
                       Center(child: Text("1", style: TextStyle(color: Colors.grey[600]),)),
                       
                       heroTag: "btn1",
                       elevation: 0,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                      width: 55,
                      height: 35,
                      
                      
                        
                        child: FloatingActionButton(
                          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1),
                        ),
                          onPressed: () {
                           pressCycle();
                         MidCycle = 2;},
                         backgroundColor: Colors.grey[300],
                         child: Center(child: Text("2", style: TextStyle(color: Colors.grey[600]),)),
                         heroTag: "btn2",
                         elevation: 0,
                        ),
                      
                    ),
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                      width: 55,
                      height: 35,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1),
                      ),
                        onPressed: () {
                           pressCycle();
                         MidCycle = 3;},
                       backgroundColor: Colors.grey[300],
                       child: Center(child: Text("3", style: TextStyle(color: Colors.grey[600]),)),
                       heroTag: "btn3",
                       elevation: 0,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                      width: 55,
                      height: 35,
                      
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1),
                      ),
                        onPressed: () {
                           pressCycle();
                         MidCycle = 4;},
                       backgroundColor: Colors.grey[300],
                       child: Center(child: Text("4", style: TextStyle(color: Colors.grey[600]),)),
                       heroTag: "btn4",
                       elevation: 0,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                      width: 55,
                      height: 35,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1),
                      ),
                        onPressed: () {
                           pressCycle();
                         MidCycle = 5;},
                       backgroundColor: Colors.grey[300],
                       child: Center(child: Text("5", style: TextStyle(color: Colors.grey[600]),)),
                       heroTag: "btn5",
                       elevation: 0,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                      width: 55,
                      height: 35,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1),
                      ),
                        onPressed: () {
                           pressCycle();
                         MidCycle = 6;},
                       backgroundColor: Colors.grey[300],
                       child: Center(child: Text("6", style: TextStyle(color: Colors.grey[600]),)),
                       heroTag: "btn6",
                       elevation: 0,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                      width: 55,
                      height: 35,
                      
                      child: FloatingActionButton(
                        
                        shape: RoundedRectangleBorder(
                          
                      borderRadius: BorderRadius.circular(1),
                      ),
                        onPressed: () {
                           pressCycle();
                         MidCycle = 7;},
                       backgroundColor: Colors.grey[300],
                       child: Container(child: Center(child: Text("7", style: TextStyle(color: Colors.grey[600]),))),
                       heroTag: "btn7",
                       elevation: 0,
                       
                      ),
                      
                    ),
                  ]
                  
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //set list of text entries for the setAmount value. creates name for each cycle day
                  children: [nameEntries()]
                ),
              ],
              
            ),

            GestureDetector(
                  
                  onTap: () {  
                    setName();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> InfoPage()));
                    setAllFinal();
                    db.updateDataBase;
                    print(MidName);
                    print(MidCycle);
                    print(Workouts);
                    print(nameList);
                    
                  },
                  
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 20),
                    child: const Center(
                      //make aarrrow Icon
                      child: Icon(Icons.send, color: Colors.grey,),
                      ),
                    ),
                  ),
                
                
          ],
          
        ),
      ),
    );
  }
}