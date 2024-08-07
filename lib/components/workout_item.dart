



import 'package:dots_initial/data/database.dart';
import 'package:dots_initial/models/favoriteList.dart';
import 'package:dots_initial/models/workouts.dart';
import 'package:flutter/material.dart';



class WorkoutItem extends StatefulWidget {
   Workouts workouts;
   Function(Workouts) removeFavorite;
   Function(Workouts) addFavorite;
   Function(Workouts) onRemove;
   Function(Workouts) update;
   Function() check;
   WorkoutItem({super.key, required this.workouts, required this.onRemove, required this.update, required this.addFavorite, required this.removeFavorite, required this.check});

  @override
  State<WorkoutItem> createState() => _WorkoutItemState();
}


//remove Item


class _WorkoutItemState extends State<WorkoutItem> {
  @override
   bool state =  false;
  void initState() {
    // TODO: implement initState
    state = widget.workouts.isFavorite;
    super.initState();
  }
 void _toggleFavorite() {
  print('toggled');
    setState(() {
      widget.workouts.isFavorite = state;
      state = !widget.workouts.isFavorite;
      widget.workouts.isFavorite = state;
      if (widget.workouts.isFavorite) {
      // Add to favoriteList
      // the state is being applied to all of them once you switch a page that is wrong.
        widget.addFavorite(widget.workouts);
        
      
    } else  {
      // Remove from favoriteList
      widget.removeFavorite(widget.workouts);
      
    }
      print("secondHlaf");
      widget.update(widget.workouts);
      widget.check;
    });
    
  }

  

  @override
   
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
          
          decoration: BoxDecoration(color: Color.fromARGB(255, 197, 140, 161),
          borderRadius: BorderRadius.circular(8),
          ),
          margin: EdgeInsets.only(bottom: 10),
          child: 
            
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                     
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(widget.workouts.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
                    ),
                    Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
                       child: Text(widget.workouts.setAmount.toStringAsFixed(0) + " Days", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                     ),
                    ]
                    ),
                    
                      Row(
                        children: [
                          GestureDetector(
                            // i is being added to the page witch is switching it to the thing.
                            onTap: _toggleFavorite,
                            child: Icon(
                              Icons.star,
                              color: state ? Colors.yellow : Colors.white,
                            ),
                          ),
                          GestureDetector(
                            
                            onTap: () {
                              showDialog(
                                      
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: const Color.fromARGB(255, 231, 231, 231),
                                content: 
                                FloatingActionButton(
                                  backgroundColor: const Color.fromARGB(255, 196, 196, 196),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    widget.onRemove(widget.onRemove(widget.workouts));
                                    
                                    
                                  },
                                  child: Icon(Icons.delete, color: Colors.black,),
                                ),
                          
                              );
                          },);
                            } ,
                            
                            child: SizedBox(child: Icon(Icons.delete))),
                        ],
                      ),
                ],
              ),
            ),
          
        
      ),
    );
    
  }
}