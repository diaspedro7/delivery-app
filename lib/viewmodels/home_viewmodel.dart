import 'package:flutter/material.dart';

class HomePageViewModel extends ChangeNotifier {
  bool searchIsOn = false;
  int selectedCardIndex = 0;

  void setSearchIsOn() {
    searchIsOn = !searchIsOn;
    notifyListeners();
  }

  void setselectedCardIndex(int index) {
    selectedCardIndex = index;
    notifyListeners();
  }
}
