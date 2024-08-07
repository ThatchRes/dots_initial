import 'package:dots_initial/components/excersize_item.dart';
import 'package:dots_initial/data/database.dart';
import 'package:dots_initial/data/workout_data.dart';
import 'package:dots_initial/models/excersizes.dart';
import 'package:dots_initial/models/excsersizeContent.dart';
import 'package:dots_initial/models/workouts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Day7 extends StatefulWidget {
   Workouts workouts;
   Day7({super.key,required this.workouts});

  @override
  State<Day7> createState() => _Day7State();
}

class _Day7State extends State<Day7> {
  int index = 0;
  
    
   initState(){
  _initializeHive();
  
  db.loadData();
  super.initState();
}

void _addExcersize(String name, String description, String sets) {
    var excersize = ExcersizeContent(name: name, description: description, sets: sets, initNum: 7);
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
    
    List<ExcersizeContent> day7Excersizes = widget.workouts.excersizesContent.where((ex) => ex.initNum == 7).toList();
    print(widget.workouts.cycleName[0].name.toString());
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: 
        
          Column(
            
            children: [
              Expanded(child: GridView.builder(itemCount: day7Excersizes.length,
                      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: .8),
                                    itemBuilder: (context, index) {
                      ExcersizeContent individualExcersize = day7Excersizes[index];
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
                
                
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 15.0, ),
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