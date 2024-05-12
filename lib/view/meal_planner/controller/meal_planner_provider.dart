// create mealPlannerProvider
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealPlannerProvider =
    ChangeNotifierProvider<MealPlannerProvider>((ref) => MealPlannerProvider());

class MealPlannerProvider extends ChangeNotifier {
  String todayMealsValue = 'Breakfast';
  setTodayMealsValue(value) {
    todayMealsValue = value;
    notifyListeners();
  }
  List breakfastArr = [
    {
      "name": "Honey Pancake",
      "time": "28/05/2023 07:00 AM",
      "image": "assets/img/honey_pan.png"
    },
    {"name": "Coffee", "time": "07:30am", "image": "assets/img/coffee.png"},
  ];
  List get mealsArr =>
      [breakfastArr, lunchArr, dinnerArr, snacksArr, dessertArr];

  List lunchArr = [
    {
      "name": "Chicken Steak",
      "time": "01:00pm",
      "image": "assets/img/chicken.png"
    },
    {
      "name": "Milk",
      "time": "01:20pm",
      "image": "assets/img/glass-of-milk 1.png"
    },
  ];
  List dessertArr = [
    {"name": "Orange", "time": "04:30pm", "image": "assets/img/orange.png"},
    {
      "name": "Apple Pie",
      "time": "04:40pm",
      "image": "assets/img/apple_pie.png"
    },
  ];
  List snacksArr = [
    {"name": "Orange", "time": "04:30pm", "image": "assets/img/orange.png"},
    {
      "name": "Apple Pie",
      "time": "04:40pm",
      "image": "assets/img/apple_pie.png"
    },
  ];
  List dinnerArr = [
    {"name": "Salad", "time": "07:10pm", "image": "assets/img/salad.png"},
    {"name": "Oatmeal", "time": "08:10pm", "image": "assets/img/oatmeal.png"},
  ];
}
