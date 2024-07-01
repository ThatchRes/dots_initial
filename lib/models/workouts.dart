import 'package:dots_initial/models/cycleName.dart';
import 'package:dots_initial/models/excersizes.dart';
import 'package:dots_initial/models/excsersizeContent.dart';
import 'package:flutter/material.dart';

class Workouts {
  final String name;
  final int setAmount;
  final List<CycleName> cycleName;
  final List<ExcersizeContent> excersizesContent;

Workouts({required this.name, required this.setAmount, required this.cycleName, required this.excersizesContent});


}

