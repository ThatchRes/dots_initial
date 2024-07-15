import 'package:dots_initial/models/cycleName.dart';
import 'package:dots_initial/models/excersizes.dart';
import 'package:dots_initial/models/excsersizeContent.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Workouts {
  final String name;
  final int setAmount;
  final List<CycleName> cycleName;
  final List<ExcersizeContent> excersizesContent;

Workouts({required this.name, required this.setAmount, required this.cycleName, required this.excersizesContent});
//cant put cycleName or excersize content into strings (could do same things on this page on excersize content and cycleName pages)
Map<String, dynamic> toJson() => {
    'name': name,
    'setAmount': setAmount,
    'cycleName': cycleName.toString(),
    'excersizesContent': excersizesContent.toString(),
  };

  // Convert a Map object into a Workout object
  factory Workouts.fromJson(Map<String, dynamic> json) => Workouts(
    name: json['name'],
    setAmount: json['setAmount'],
    cycleName: json['cycleName'],
    excersizesContent: json['excersizeContent']
  );
}

