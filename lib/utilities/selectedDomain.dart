import 'package:flutter/material.dart';




class SelectedDomain extends ChangeNotifier {
  List<bool> buttonPressed = [true, false, false, false, false];
  List<String> searchQuerys = ["everything", "tech", "politics","bitcoin", "movies"];
  String selectedQuery = "everything";


  void selectedButton(int index) {
    for (int i = 0; i < buttonPressed.length; i++) {
      if (i == index) {
        buttonPressed[i] = true;
        selectedQuery = searchQuerys[i];
      } else {
        buttonPressed[i] = false;
      }
    }
    notifyListeners();
  }
}