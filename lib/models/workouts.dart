import 'dart:ffi';

import 'package:dots_initial/models/cycleName.dart';
import 'package:dots_initial/models/excersizes.dart';
import 'package:dots_initial/models/excsersizeContent.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive/hive.dart';

part 'workouts.g.dart';

@HiveType(typeId: 0)
class Workouts {
  @HiveField(0)
  String name;
  
  @HiveField(1)
  int setAmount;
  
  @HiveField(2)
  List<CycleName> cycleName;
  
  @HiveField(3)
  List<ExcersizeContent> excersizesContent;

  @HiveField(4)

  bool isFavorite;

  Workouts({required this.name, required this.setAmount, required this.cycleName, required this.excersizesContent,  this.isFavorite = false });
}

@HiveType(typeId: 1)
class CycleName {
  @HiveField(0)
  String name;

  CycleName({required this.name});
  String toString() {
    return name;
  }
}

@HiveType(typeId: 2)
class ExcersizeContent {
  @HiveField(0)
  String name;
  
  @HiveField(1)
  String description;
  
  @HiveField(2)
  String sets;
  
  @HiveField(3)
  int initNum;

  ExcersizeContent({required this.name, required this.description, required this.sets, required this.initNum});
  String toString() {
    return '$name: $description: $sets: $initNum';
  }
}