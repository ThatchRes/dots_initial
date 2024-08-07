

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
import 'package:flutter/services.dart';
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
    final _workoutBox = Hive.box<List>('workoutsBox');
    WorkoutDataBase db = WorkoutDataBase();
  
  
   var MidName = "no name";
   var MidCycle = 1;
   var dayNameCycle = "no name";
   double sliderValue = 1;
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
    
  
  
 
   db.loadData();
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

  
    
  
   Widget nameEntries() {
    print("nameEntry");
    List<Widget> textBoxes = [];
    for(int i = 0; i < MidCycle; i++){
      setState(() {
        textBoxes.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox( height: 75, width: 150,child: Container(decoration: BoxDecoration(color: const Color.fromARGB(255, 197, 140, 161), border: Border.all(color: Color.fromARGB(255, 197, 140, 161), style: BorderStyle.solid),borderRadius: BorderRadius.circular(8) ),child: Padding(
            padding: const EdgeInsets.all(3.0),
            
            child: Center(
              child: TextField(decoration:  InputDecoration(hintText: "Day ${i+1} title" , 
              hintStyle: const TextStyle(
              fontFamily: 'Montserrat',
               fontSize: 20,
              fontWeight: FontWeight.bold,
              ),border: InputBorder.none,),
                style: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                ),
               controller: _controllers[i],),
            ),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: SizedBox(height: 100, width: 300, child: Container( decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), ),
                              child: Padding(
                                
                                padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
                              
                                child: TextField(
                                  inputFormatters: [
                                    
                                  LengthLimitingTextInputFormatter(12)
                                  ],
                                decoration: const InputDecoration(
                                  hintText: "Name of Cycle:",
                                  hintStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black, // Color of the bottom line
                                      width: 3.0, // Thickness of the bottom line
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black, // Color of the bottom line when focused
                                      width: 3.0, // Thickness of the bottom line when focused
                                    ),
                                  ),
                                ),
                                style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,),
                                controller: WorkoutName,
                              ),
                              ))),
                          ),
                        ],
                      ),
                      
                      
                    ],
                  ),
                ),

                // slider up to 7 for days in a cycle
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      
                     
                    ],
                  ),
                ),


                
                  
                
                nameEntries()
                
              ],
              
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            children: [
                              
                              SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15), // Adjust thumb size
                                overlayShape: const RoundSliderOverlayShape(overlayRadius: 30), // Adjust overlay size
                                trackHeight: 15, // Adjust track height
                                activeTrackColor: Colors.grey, // Customize active track color
                                thumbColor: Colors.black, // Customize thumb color
                                inactiveTrackColor: const Color.fromARGB(255, 212, 212, 212)
                              ),
                              child: Slider(
                                value: sliderValue,
                                // fix min value 
                                min: 1,
                                max: 7,
                                divisions: 7,
                                onChanged: (double value) {
                                  setState(() {
                                    sliderValue = value;
                                    pressCycle();
                                    MidCycle = sliderValue.toInt();
                                  });
                                },
                              ),
                            ),
                          Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0, bottom: 8, left: 8, right: 8),
                              child: Text(MidCycle.toString() + " Days in Cycle", style: const TextStyle(fontFamily: 'Montserrat', fontSize: 25, fontWeight: FontWeight.bold),),
                            ),
                            
                          ],
                                                ),
                            ],
                          ),
                        ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                        
                        onTap: () async {  try {
                          // when this is tapped only up to navigator is executed. Set all final doesnt do anyrhing.
                          for (var i = 0; i < MidCycle; i++) {
                            setDayName(i);
                          }
                          setName();
                          
                          
                          print("before final Call");
                           Workouts workout = Workouts(
                              name: MidName, 
                              setAmount: MidCycle, 
                              cycleName: nameList, 
                              //isFavorite: false,
                              excersizesContent: []
                            );
                            // thid is not adding to totalWorkouts, or is being reset at some point.
                             db.totalWorkouts.add(workout);
                              db.updateDataBase();
                            
                            //total Workouts contains the correct things but it is either not transfering updating or there is an issue on the viewpage
                          print(db.totalWorkouts);
                          print("after final call");
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const InfoPage()));
                          
                        } catch (e) {
                          // Log any errors that occur
                          print("An error occurred: $e");
                        }
                        },
                        
                        child: Container(
                          
                          width: 100,
                          height: 100,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 20),
                          child: const Center(
                            //make aarrrow Icon
                            child: Icon(Icons.send, color: Colors.grey, size: 40,),
                            ),
                          ),
                        ),
                ),
              ],
            ),
                
                
          ],
          
        ),
      ),
    );
  }
}