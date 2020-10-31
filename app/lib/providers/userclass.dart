import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class User with ChangeNotifier {
  String name;
  String hieght;
  String wieght;
  String dob;
  String sex;
  double bmi;
  String bloodgrp;
  Color color;
  String ans;
  //MedHistory medhistory = MedHistory();
  /*User()
  {
    name = 'Ahmed Mawia';
    hieght = 175;
    wieght = 63.4;
    dob = '25-Nov-1999';
    bloodgrp = 'A+';
    sex = 'Male';
    bmi= (wieght/(hieght*hieght))*10000;
  }*/

  void getdata(
      String nam, String d, String weigh, String heigh, String se, String bg) {
    name = nam;
    dob = d;
    wieght = weigh;
    hieght = heigh;
    sex = se;
    bloodgrp = bg;
    notifyListeners();
  }

  void calbmi(String t, String j) {
    bmi = (double.parse(t) / (double.parse(j) * double.parse(j))) * 10000;
    getcol();
    getbmians();
    notifyListeners();
  }

  void getcol() {
    if (bmi <= 18.5) {
      color = Colors.blue;
    } else if (bmi >= 18.5 && bmi < 30) {
      color = Colors.green;
    } else {
      color = Colors.red;
    }
    notifyListeners();
  }

  void getbmians() {
    if (bmi <= 18.5) {
      ans = 'Underwieght!\nPlease follow healthy diet';
    } else if (bmi >= 18.5 && bmi < 30) {
      ans =
          'Normal!\nPlease continue to follow healthy diet and exercise schedule';
    } else {
      ans = 'Overwieght!\nPlease plan a healthy diet and do exercise regularly';
    }
    notifyListeners();
  }
}
