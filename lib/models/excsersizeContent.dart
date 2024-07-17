import 'package:flutter/material.dart';




class ExcersizeContent{
  final String name;
  final String description;
  final String sets;
  final int initNum;
ExcersizeContent({required this.name, required this.description, required this.sets, required this.initNum});


@override
  String toString() {
    return '$name: $description: $sets: $initNum';
  }
}

