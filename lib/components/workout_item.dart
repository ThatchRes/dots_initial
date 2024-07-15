

import 'package:dots_initial/models/workouts.dart';
import 'package:flutter/material.dart';
import"package:hovering/hovering.dart";


class WorkoutItem extends StatefulWidget {
   Workouts workouts;
   Function(Workouts) onRemove;
   WorkoutItem({super.key, required this.workouts, required this.onRemove});

  @override
  State<WorkoutItem> createState() => _WorkoutItemState();
}
//remove Item


class _WorkoutItemState extends State<WorkoutItem> {


  void deleteAction() {
    
  }

  @override
   
  Widget build(BuildContext context) {
    return Container(
        
        decoration: BoxDecoration(color: Colors.grey[100],
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
                     child: Text(widget.workouts.setAmount.toStringAsFixed(0), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                   ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(widget.workouts.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
                  ),
                  ]
                  ),
                  
                    GestureDetector(
                      
                      onTap: () {
                        showDialog(
            
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: const Color.fromARGB(255, 231, 231, 231),
                          content: FloatingActionButton(
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
          ),
        
      
    );
    
  }
}