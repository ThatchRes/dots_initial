import 'package:dots_initial/components/excersize_item.dart';
import 'package:dots_initial/data/database.dart';
import 'package:dots_initial/data/workout_data.dart';
import 'package:dots_initial/models/excersizes.dart';
import 'package:dots_initial/models/excsersizeContent.dart';
import 'package:dots_initial/models/workouts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Day6 extends StatefulWidget {
   Workouts workouts;
   Day6({super.key,required this.workouts});

  @override
  State<Day6> createState() => _Day6State();
}

class _Day6State extends State<Day6> {
  int index = 0;
  
    
   initState(){
  _initializeHive();
  
  db.loadData();
  super.initState();
}

void _addExcersize(String name, String description, String sets) {
    var excersize = ExcersizeContent(name: name, description: description, sets: sets, initNum: 6);
    widget.workouts.excersizesContent.add(excersize);
    print(widget.workouts.excersizesContent);
    // Save the workout to the box
    
    
    setState(() {
      db.updateDataBase();
    });
  }
  final _workoutBox =  Hive.box<List>('workoutsBox');
    WorkoutDataBase db = WorkoutDataBase();
  
  

  
  @override
  Future<void> _initializeHive() async {
    
    
    

    setState(() {
      
    }); // Refresh the state after initialization
  }
  void _removeExcersize(ExcersizeContent excersize) {
    setState(() {
      widget.workouts.excersizesContent.remove(excersize);
      db.updateDataBase();
    });
  }
   
    
  


  Widget build(BuildContext context) {
    
    List<ExcersizeContent> day6Excersizes = widget.workouts.excersizesContent.where((ex) => ex.initNum == 6).toList();
    print(widget.workouts.cycleName[0].name.toString());
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: 
        
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Expanded(child: GridView.builder(itemCount: day6Excersizes.length,
                      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: .8),
                                    itemBuilder: (context, index) {
                      ExcersizeContent individualExcersize = day6Excersizes[index];
                      return ExcersizeItem(excersizeContent: individualExcersize,
                      onRemove: _removeExcersize,
                      );
                                    }),),
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
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(12)
                      ],
                    ),
                    TextField(
                      controller: _setEditor,
                      decoration: InputDecoration(hintText: "Set Amount"),
                      keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(2),
                    ],
                    ),
                    
                              TextField(
                              
                              controller: _descriptionEditor,
                              decoration: const InputDecoration(
                                hintText: "Reps per set",
                                
                                
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(2),
                              ],
                              
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
                
                
                 child: Padding(
                   padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 20 ),
                   child: Container(
                    
                    decoration: BoxDecoration(color: Color.fromARGB(255, 174, 91, 122).withOpacity(0.5) ,
                    borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 20),
                    child: const Center(
                      child: Icon(Icons.add),
                    ),),
                 )
                  
                
              ),
              
                
                    
                    
                    
                  
                
              
            ],
            
          ),
          
          
        
      
    );
  }
}