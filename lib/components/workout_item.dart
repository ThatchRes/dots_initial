

import 'package:dots_initial/models/workouts.dart';
import 'package:flutter/material.dart';


class WorkoutItem extends StatefulWidget {
   Workouts workouts;
   WorkoutItem({super.key, required this.workouts});

  @override
  State<WorkoutItem> createState() => _WorkoutItemState();
}
//remove Item


class _WorkoutItemState extends State<WorkoutItem> {



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[100],
      borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(bottom: 10),
    child: ListTile(
      leading: Text(widget.workouts.setAmount.toStringAsFixed(0)),
      title: Text(widget.workouts.name),
      
      ),
    );
    
  }
}