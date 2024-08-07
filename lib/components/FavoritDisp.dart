import 'package:dots_initial/data/database.dart';
import 'package:dots_initial/models/workouts.dart';
import 'package:dots_initial/pages/workoout_list.dart';
import 'package:flutter/material.dart';

import '../models/favoriteList.dart';

class Favoritdisp extends StatefulWidget {
  Workouts workouts;
  int getIndex;
   Favoritdisp({super.key, required this.workouts, required this.getIndex});
  
  @override
  State<Favoritdisp> createState() => _FavoritdispState();
}

class _FavoritdispState extends State<Favoritdisp> {
  late int currentIndex;
   
  WorkoutDataBase db = WorkoutDataBase();
  @override
  void initState() {
    // TODO: implement initState
    currentIndex = widget.getIndex; // Initialize currentIndex with getIndex
    print(widget.getIndex);
    super.initState();
  }
 
  @override
  //get the index of the favorited item from favoriteList
  
   
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7),
      child: Container(
        
        height: 160,
        decoration: BoxDecoration( borderRadius: BorderRadius.circular(8), color: Color.fromARGB(255, 174, 91, 122).withOpacity(0.5) ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 140,
                height: 70,
                decoration: BoxDecoration(color: Color.fromARGB(255, 220, 189, 200).withOpacity(0.6), borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    
                      Row(
                        
                        
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                          child: Text(widget.workouts.setAmount.toString(), style: const TextStyle(fontSize: 25, fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.bold, color: Color.fromARGB(255, 90, 67, 80)),)),
                          Icon(Icons.calendar_month, color: Color.fromARGB(255, 90, 67, 80), size: 25,)
                      ]
                      ),
                      
                      Text('cycle days', style: TextStyle(color: Color.fromARGB(255, 97, 79, 89)),)
                    ],
                  ),
                ),
              ),
              Container(
            width: 140,
            height: 70,
            decoration: BoxDecoration(color: Color.fromARGB(255, 220, 189, 200).withOpacity(0.6), borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                  Row(
                    
                    
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                      child: Text(widget.workouts.excersizesContent.length.toString(), style: const TextStyle(fontSize: 25, fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold, color: Color.fromARGB(255, 90, 67, 80)),)),
                      Icon(Icons.numbers, color: Color.fromARGB(255, 90, 67, 80), size: 25,),
                      
                  ]
                  ),
                  
                  Row(
                    children: [
                      Text('excersizes', style: TextStyle(color: Color.fromARGB(255, 97, 79, 89)),),
                    ],
                  ),
                  
                ],
              ),
            ),
          ),
            
              Container(
                 height: 70,
                 width: 50,
                    decoration: BoxDecoration(color: Color.fromARGB(255, 220, 189, 200).withOpacity(0.6), borderRadius: BorderRadius.circular(8)),
                    child: Center(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${widget.getIndex + 1}", style: const TextStyle(fontSize: 25, fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.bold, color: Color.fromARGB(255, 90, 67, 80)),),
                          Text("of " + favoriteList.length.toString(), style: const TextStyle(fontSize: 15, fontFamily: 'Montserrat',
                         color: Color.fromARGB(255, 106, 86, 97)))
                        ],
                      ), ),
                  )
             
            ],
            
          ),
              ),
          Text(widget.workouts.name, style: const TextStyle( fontSize: 45, fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold, color: Color.fromARGB(255, 90, 67, 80)),)
                     ],
              ),
        )));
      
    
  }
}