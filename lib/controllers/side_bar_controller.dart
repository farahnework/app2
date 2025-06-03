import 'package:flutter/material.dart';



class SideBarController extends ChangeNotifier {
  GlobalKey<ScaffoldState>? scaffoldKey;

  void setScaffoldKey(GlobalKey<ScaffoldState> key) {
    scaffoldKey = key;
  }

  void toggleSidebar() {
    if (scaffoldKey?.currentState?.isDrawerOpen == false) {
      scaffoldKey?.currentState?.openDrawer();
      notifyListeners();
    }
  }
}
