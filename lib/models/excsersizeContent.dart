import 'package:flutter/material.dart';

class ExcersizeContent{
  final String name;
  final String description;
  final String sets;
ExcersizeContent({required this.name, required this.description, required this.sets});


@override
  String toString() {
    return '$name: $description';
  }
}

