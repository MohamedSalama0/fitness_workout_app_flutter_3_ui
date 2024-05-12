import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//crete this goalIndexProvider provider
final goalIndexProvider = StateNotifierProvider<GoalIndexNotifier, int>(
    (ref) => GoalIndexNotifier(0));

class GoalIndexNotifier extends StateNotifier<int> {
  GoalIndexNotifier(super.state);
  List goalArr = [
    {
      "image": "assets/img/goal_1.png",
      "title": "Improve Shape",
      "subtitle":
          "I have a low amount of body fat\nand need / want to build more\nmuscle"
    },
    {
      "image": "assets/img/goal_2.png",
      "title": "Lean & Tone",
      "subtitle":
          "I’m “skinny fat”. look thin but have\nno shape. I want to add learn\nmuscle in the right way"
    },
    {
      "image": "assets/img/goal_3.png",
      "title": "Lose a Fat",
      "subtitle":
          "I have over 20 lbs to lose. I want to\ndrop all this fat and gain muscle\nmass"
    },
  ];
}

// ref.read(goalIndexProvider.notifier).state = index;

final loginProvider = ChangeNotifierProvider((ref) => LoginProvider());

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;

  TextEditingController nameController = TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
// TextEditingController passwordController = TextEditingController();
  String? gender;
  disposeController() {
    nameController.clear();
    dateOfBirthController.clear();
    weightController.clear();
    heightController.clear();
    notifyListeners();
  }

  setGenderValue(value) {
    gender = value;
    notifyListeners();
  }

  setDateOfBirth(value) {
    print('value is $value');
    dateOfBirthController.text = value;
    notifyListeners();
  }

  String? dateOfBirth;
  String? weight;
  String? height;

  int goalIndexStore = 0;
}
