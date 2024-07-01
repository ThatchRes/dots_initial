import 'package:dots_initial/models/excersizes.dart';
import 'package:dots_initial/models/excsersizeContent.dart';
import 'package:dots_initial/models/workouts.dart';
import 'package:dots_initial/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {

  await Hive.initFlutter();

  var box = await Hive.openBox<Workouts>('workoutsBox');
  print(box);
  var box2 = await Hive.openBox<ExcersizeContent>('excersizeBox');
  var box3 = await Hive.openBox<ExcersizeContent>('excersizeBox2');
  var box4 = await Hive.openBox<ExcersizeContent>('excersizeBox3');
  var box5 = await Hive.openBox<ExcersizeContent>('excersizeBox4');
  var box6 = await Hive.openBox<ExcersizeContent>('excersizeBox5');
  var box7 = await Hive.openBox<ExcersizeContent>('excersizeBox6');
  var box8 = await Hive.openBox<ExcersizeContent>('excersizeBox7');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
