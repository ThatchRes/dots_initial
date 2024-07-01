

import 'package:dots_initial/components/excersize_item.dart';
import 'package:dots_initial/data/database.dart';
import 'package:dots_initial/data/workout_data.dart';
import 'package:dots_initial/data/workout_data_2.dart';
import 'package:dots_initial/models/excersizes.dart';
import 'package:dots_initial/models/excsersizeContent.dart';
import 'package:dots_initial/models/workouts.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Day2 extends StatefulWidget {
  final Workouts workouts;
   Day2({super.key,required this.workouts});

  @override
  State<Day2> createState() => _Day2State();
}

class _Day2State extends State<Day2> {
  int index = 0;

    
   initState(){
  _initializeHive();
  

  super.initState();
}
void _addExcersize(String name, String description, String sets) {
    final excersize = ExcersizeContent(name: name, description: description, sets: sets);
    widget.workouts.excersizesContent.add(excersize);
    print(widget.workouts.excersizesContent);
    // Save the workout to the box
    print(_excersizeBox);
    
    setState(() {});
  }
late final Box<Workouts> _workoutBox;
  
  
  late final Box<ExcersizeContent> _excersizeBox;
  
  @override
  Future<void> _initializeHive() async {
    // Open the box asynchronously and initialize the database
    _workoutBox = await Hive.openBox<Workouts>('workoutsBox');
    WorkoutDataBase db = WorkoutDataBase();
    _excersizeBox = await Hive.openBox("excersizeBox");
    excersizeDatabase2 edb = excersizeDatabase2();
    if (_workoutBox.get('workoutsbox') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    if (_excersizeBox.get('EXCERSIZEBOX2') == null) {
      edb.createInitialData();
    } else {
      edb.loadData();
    }

    setState(() {}); // Refresh the state after initialization
  }

  Widget build(BuildContext context) {
    print(widget.workouts.cycleName[0].name.toString());
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: 
        
          Column(
            
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(widget.workouts.cycleName[0].name.toString(), style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),),
              ),
              GestureDetector(
                onTap: () => showDialog(
                  context: context, builder: (BuildContext context) {
                  TextEditingController _nameEditor = TextEditingController();
                  TextEditingController _setEditor = TextEditingController();
                  TextEditingController _descriptionEditor = TextEditingController();
                  return AlertDialog(
                    
                    title: Text("New Workout", style: TextStyle(fontWeight: FontWeight.w800),),
                    backgroundColor: Colors.grey[100],
                    content:
                    
                    Column(
                      
                      mainAxisSize: MainAxisSize.min,
                      children: [TextField(
                      controller: _nameEditor,
                      decoration: InputDecoration(hintText: "Workout Name"),
                    ),
                    TextField(
                      controller: _setEditor,
                      decoration: InputDecoration(hintText: "Set Amount"),
                    ),
                    Padding(
                      
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey,),
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.grey[100]
                        ),
                        
                        child: Padding(
                          
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                          child: Column(
                            
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              TextField(
                              
                              controller: _descriptionEditor,
                              decoration: InputDecoration(
                                hintText: "Description",
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              maxLines: null,),
                            ],
                          ),
                        )
                      ),
                    ),
                    GestureDetector(
                  
                  onTap: () {  
                    setState(() {
                    _addExcersize(
                              _nameEditor.text,
                              _descriptionEditor.text,
                              _setEditor.text,
                    );
                    Navigator.pop(context);
                  });
                  
                  },
                  
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 20),
                    child: const Center(
                      //make aarrrow Icon
                      child: Icon(Icons.send, color: Colors.grey,),
                      ),
                    ),
                  ),
                    ]
                    
                    ),
                    
                  );},), 
                
                
                 child: Container(
                  decoration: BoxDecoration(color: Colors.blue.withOpacity(0.5) ,
                  borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 20),
                  child: const Center(
                    child: Icon(Icons.add),
                  ),)
                  
                
              ),
              
                
                    
                      Expanded(child: GridView.builder(itemCount: widget.workouts.excersizesContent.length,
                      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1),
                                    itemBuilder: (context, index) {
                      ExcersizeContent individualExcersize = widget.workouts.excersizesContent[index];
                      return ExcersizeItem(excersizeContent: individualExcersize);
                                    }),),
                    
                  
                
              
            ],
            
          ),
          
          
        
      
    );
  }
}