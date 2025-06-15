import 'package:expencetracker/models/expence.dart';
import 'package:flutter/material.dart';

final iconcolor = const Color.fromARGB(255, 23, 69, 107);

Icon getCategoryIcon (Cat category){
  switch(category){
    case Cat.food:
      return Icon(Icons.fastfood, color:iconcolor);
    case Cat.transport:
      return Icon(Icons.directions_bus_filled_outlined, color:iconcolor);
    case Cat.entertainment:
      return Icon(Icons.movie, color:iconcolor);
    case Cat.fitness:
      return Icon(Icons.fitness_center_outlined, color:iconcolor);
    case Cat.other:
      return Icon(Icons.multiple_stop_rounded, color:iconcolor); 
   
  }
}