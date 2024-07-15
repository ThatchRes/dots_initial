import 'package:dots_initial/models/excersizes.dart';
import 'package:dots_initial/models/excsersizeContent.dart';
import 'package:flutter/material.dart';

class ExcersizeItem extends StatefulWidget {
  ExcersizeContent excersizeContent;
  Function(ExcersizeContent) onRemove;
   ExcersizeItem({super.key, required this.excersizeContent, required this.onRemove});

  @override
  State<ExcersizeItem> createState() => _ExcersizeItemState();
}

class _ExcersizeItemState extends State<ExcersizeItem> {
  String get truncatedName {
    if (widget.excersizeContent.name.length > 4) {
      return widget.excersizeContent.name.substring(0, 4) + '-';
    } else {
      return widget.excersizeContent.name;
    }
  }
  @override
  
  
  Widget build(BuildContext context) {
    return 

       GestureDetector(
        onLongPress: () {
           showDialog(
            
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: const Color.fromARGB(255, 231, 231, 231),
              content: FloatingActionButton(
                backgroundColor: const Color.fromARGB(255, 196, 196, 196),
                onPressed: () {
                  widget.onRemove(widget.excersizeContent);
                  
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.delete, color: Colors.black,),
              ),
            );
        },);},
         child: Container(
          
          margin: EdgeInsets.only(left: 25, bottom: 15,right: 25),
          width: 170,
          
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
              
              
              Container(child: Text(truncatedName, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                      
                    ),),
              Text("Sets: " +widget.excersizeContent.sets, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
            ],
          ),
          
          ]
          ),
             ),
               
               
               
             ),
       );
  }
}