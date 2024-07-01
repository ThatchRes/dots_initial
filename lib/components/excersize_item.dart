import 'package:dots_initial/models/excsersizeContent.dart';
import 'package:flutter/material.dart';

class ExcersizeItem extends StatefulWidget {
  ExcersizeContent excersizeContent;
   ExcersizeItem({super.key, required this.excersizeContent});

  @override
  State<ExcersizeItem> createState() => _ExcersizeItemState();
}

class _ExcersizeItemState extends State<ExcersizeItem> {
  @override
  Widget build(BuildContext context) {
    return 

       Container(
        margin: EdgeInsets.only(left: 25, bottom: 15,right: 25),
        width: 120,
        
        decoration: BoxDecoration(
        
        color: Colors.grey[300],
      borderRadius: BorderRadius.circular(8),
      ),
      
      
      
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(color: Colors.blue),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            
            Text(widget.excersizeContent.name, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),),
            Text("Sets: " +widget.excersizeContent.sets, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
          ],
        ),
        
        ]
        ),
    ),
      
      
      
    );
  }
}