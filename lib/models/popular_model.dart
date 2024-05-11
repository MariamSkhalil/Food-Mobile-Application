// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
class PopularDietsModel{
  String name;
  String iconPath;
  String level;
  String duration;
  Color boxColor;
  String calorie;
  bool boxIsSelected;
  
  PopularDietsModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxIsSelected,
    required this.boxColor
  });
  
  static  List <PopularDietsModel> getPopularDiets(){
    List <PopularDietsModel> popularDiets =[];

    popularDiets.add(
      PopularDietsModel(
        name: 'Blueberry Pancake',
        iconPath: 'assets/icons/blueberry-pancake.svg',
        level: 'Medium',
        duration: '30mins',
        calorie: '230kCal',
        boxIsSelected: true,
        boxColor: Color(0xff9DCEFF),
      )
    );

    popularDiets.add(
      PopularDietsModel(
        name: 'Salmon Nigiri',
        iconPath: 'assets/icons/salmon-nigiri.svg',
        level: 'Easy',
        duration: '20mins',
        calorie: '120kCal',
        boxIsSelected: false,
        boxColor: Color(0xffEEA4CE)
      )
    );
          return popularDiets;
}
  }
