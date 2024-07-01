import 'package:dots_initial/pages/info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  

  @override
  Widget build(BuildContext context) {





    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Do", style: TextStyle(color: Color.fromARGB(255, 181, 103, 98), fontWeight: FontWeight.w900, fontSize: 50),),
                  Text("TS", style: TextStyle(color: Color.fromARGB(255, 119, 119, 119), fontWeight: FontWeight.w900, fontSize: 50)),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> InfoPage())),
                
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 20),
                  child: const Center(
                    child: Text("Enter",
                    style: TextStyle(color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ),
            ],
                
          ),
        ),
      );
  }
}