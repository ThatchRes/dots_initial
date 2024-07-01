import 'package:dots_initial/models/workouts.dart';
import 'package:flutter/material.dart';

class Day7 extends StatefulWidget {
  final Workouts workouts;
   Day7({super.key,required this.workouts});

  @override
  State<Day7> createState() => _Day7State();
}

class _Day7State extends State<Day7> {
  
  @override
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
              
            ],
          ),
        
          
        
      
    );
  }
}