import 'package:dots_initial/models/excersizes.dart';
import 'package:dots_initial/models/excsersizeContent.dart';
import 'package:dots_initial/models/workouts.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class ExcersizeItem extends StatefulWidget {
  ExcersizeContent excersizeContent;
  Function(ExcersizeContent) onRemove;
   ExcersizeItem({super.key, required this.excersizeContent, required this.onRemove});

  @override
  State<ExcersizeItem> createState() => _ExcersizeItemState();
}

class _ExcersizeItemState extends State<ExcersizeItem> {
  bool isdone = false;
  
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
          
          margin: EdgeInsets.only(left: 10, bottom: 15,right: 10),
          width: 200,
          
          decoration: BoxDecoration(
          
          color: (isdone == true) ? const Color.fromARGB(255, 128, 173, 130) : Colors.grey[300],
               borderRadius: BorderRadius.circular(8),
               ),
               
               
               
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   
                   
                   Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Container(child: Text(widget.excersizeContent.name, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                               softWrap: true,
                              overflow: TextOverflow.visible,
                             ),),
                     ],
                   ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(widget.excersizeContent.sets, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20)),
                            const Text("sets", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),)
                          ],
                        ),
                         Column(
                          children: [
                            Text(widget.excersizeContent.description, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),),
                            const Text("Reps", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),)
                          ],
                        )
                      ],
                    ),
                   SlideAction(
                    
                    
                              
                    borderRadius: 10,
                    elevation: 0,
                    innerColor: Colors.white,
                    outerColor: Colors.grey[100],
                    text: "",
                    height: 60,
                    sliderButtonIconSize: 30,
                    sliderButtonIcon: (isdone == false) ? Icon(Icons.check): Icon(Icons.cancel_outlined),
                    onSubmit: () {
                      //nothing but make it true or false depending
                      setState(() {
                        if (isdone == false) {
                          isdone = true;
                        } else {
                          isdone = false;
                        }
                        
                        
                        
                      });
                      
                      
                      
                    },
                   )
                 ],
               ),
             ),
               
               
               
             ),
       );
  }
}