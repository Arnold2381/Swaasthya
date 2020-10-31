import 'package:flutter/material.dart';

class Report with ChangeNotifier {
  List report = [];

  void getreport(String text){

    report.add(text);
    notifyListeners();
  }
}
