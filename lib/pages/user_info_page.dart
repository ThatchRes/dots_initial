

import 'package:dots_initial/data/database.dart';
import 'package:dots_initial/models/cycleName.dart';
import 'package:dots_initial/models/excersizes.dart';
import 'package:dots_initial/models/excsersizeContent.dart';

import 'package:dots_initial/models/workouts.dart';
import 'dart:convert';
import 'package:dots_initial/pages/add_workout.dart';
import 'package:dots_initial/pages/info_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}


class _UserInfoPageState extends State<UserInfoPage> {
  final DayNames = TextEditingController();
  List<TextEditingController> _controllers = [];
    final _workoutBox = Hive.box<Workouts>('workoutsBox');
    WorkoutDataBase db = WorkoutDataBase();
  
  
   var MidName = "no name";
   var MidCycle = 0;
   var dayNameCycle = "no name";
   double sliderValue = 0;
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
  void initState(){
    
  
  
 
   
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
      
      dayNameCycle = _controllers[num].text;
      nameList.add(CycleName(name: dayNameCycle));
      print(_controllers[num].text);
      print(nameList);
      DayNames.text = "";
    });
    
  }

 pressCycle(){
  nameEntries();
}

   Function(TapDownDetails)? setAllFinal() {
    setState(() {
      // thid is not adding to totalWorkouts, or is being reset at some point.
        db.totalWorkouts.add(Workouts(name: MidName, setAmount: MidCycle, cycleName:  nameList, excersizesContent: [ExcersizeContent(name: "place", description: "holder", sets: "1", initNum: 1)]));
       db.updateDataBase();
      
      
    });
    
  }
   Widget nameEntries() {
    print("nameEntry");
    List<Widget> textBoxes = [];
    for(int i = 0; i < MidCycle; i++){
      setState(() {
        textBoxes.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox( width: 100,child: Container(decoration: BoxDecoration(color: const Color.fromARGB(255, 174, 225, 249), border: Border.all(color: const Color.fromARGB(255, 174, 225, 249), style: BorderStyle.solid),borderRadius: BorderRadius.circular(8) ),child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: TextField(decoration: InputDecoration(border: InputBorder.none,), controller: _controllers[i],),
          )),),
        ));

      });
      
      
    }
    
    return Wrap(
      alignment: WrapAlignment.center,
      children: 
      
      textBoxes,
        
      );
    
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: [
                      Row(
                        
                        children: [
                          
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: SizedBox(width: 300, child: Container( decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Color.fromARGB(255, 238, 238, 238)),
                              child: Padding(
                                
                                padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
                              
                                child: TextField(decoration: InputDecoration(border: InputBorder.none ,hintText: "Name of Cycle:"),controller: WorkoutName),
                              ))),
                          ),
                        ],
                      ),
                      
                      
                    ],
                  ),
                ),

                // slider up to 7 for days in a cycle
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(width: 100, height: 100, decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color.fromARGB(255, 238, 238, 238)), child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0, bottom: 8, left: 8, right: 8),
                            child: Text("Days in Cycle:", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                            child: Text(MidCycle.toString(), style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),),
                          )
                        ],
                      ),),
                      Slider( 
                        thumbColor: Colors.black, activeColor: Colors.grey,
                        value: sliderValue, max: 7, divisions: 7,onChanged: (double value) {
                        setState(() {
                          sliderValue = value;
                          pressCycle();
                          MidCycle = sliderValue.toInt();
                        });
                      } ),
                    ],
                  ),
                ),


                
                  
                
                nameEntries()
                
              ],
              
            ),

            GestureDetector(
                  
                  onTap: () { 
                    // when this is tapped only up to navigator is executed. Set all final doesnt do anyrhing.
                    for (var i = 0; i < MidCycle; i++) {
                      setDayName(i);
                    }
                    setName();
                    
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> InfoPage()));
                    print("before final Call");
                    setAllFinal();
                    print("after final call");
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