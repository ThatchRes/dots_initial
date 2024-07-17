import 'dart:convert';

import 'package:dots_initial/models/excersizes.dart';
import 'package:dots_initial/models/excsersizeContent.dart';
import 'package:dots_initial/models/workouts.dart';
import 'package:dots_initial/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {

  await Hive.initFlutter();

  var box = await Hive.openBox<Workouts>('workoutsBox');
  print(box);
 

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
