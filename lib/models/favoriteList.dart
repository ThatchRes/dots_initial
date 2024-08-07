import 'package:dots_initial/models/workouts.dart';
import 'package:flutter/material.dart';

List<Workouts> favoriteList = [];

void addFavorite(workout) {
    favoriteList.add(workout);
    print("added");
  }
  void removeFavorite(workout) {
    
    favoriteList.remove(workout);

    print("removed");
  }
 