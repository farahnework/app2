import 'package:flutter/material.dart';

class SideToggleProvider extends ChangeNotifier {
  bool showLeftSide = false;

  void toggleSide() {
    showLeftSide = !showLeftSide;
    notifyListeners(); // Notify widgets when state changes
  }
}
