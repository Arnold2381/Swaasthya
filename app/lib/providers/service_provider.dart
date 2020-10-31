import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ServiceProvider with ChangeNotifier {
  List<String> symp = [];
  List send = [];
  List result = [];
  List precaution = [];

  String description;

  Future<void> getallresults() async {
    var url = "https://swaasthya-back.herokuapp.com/api/testing/symptoms";
    try {
      final response = await http.get(url);
      final extract = json.decode(response.body);
      print(extract);
    } catch (error) {
      print(error);
    }
  }

  // ignore: missing_return
  Future<List> sendsymptoms(List list) async {
    //List<String> list = text.trim().split(",");

    /* List<String> list2 = [
      "knee_pain",
      "irritability",
      "redness_of_eyes",
      "shivering",
      "scurring"
    ];*/
    print(json.encode({"symptoms": list}));
    // print(list2);
    //print(list);
    //print(json.encode(list2));

    var url =
        "https://swaasthya-back.herokuapp.com/api/testing/predict-disease";
    if (send.length != 0)
      try {
        final response = await http.post(url,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: json.encode({"symptoms": list}));
        final extract = json.decode(response.body);
        print(extract);
        result = json.decode(response.body)["data"]["predictions"];

        print(result);
        return result;
      } catch (error) {
        print(error);
      }
    notifyListeners();
  }

  Future<void> getallprecautions(String text) async {
    var url = 'https://medtech-ml.herokuapp.com/precaution/$text';
    try {
      final response = await http.get(url);
      final extract = json.decode(response.body);
      print(extract);
      precaution = extract;
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }

  Future<void> getalldesc(String text) async {
    var url = 'https://medtech-ml.herokuapp.com/description/$text';
    try {
      final response = await http.get(url);
      final extract1 = json.decode(response.body);
      print(extract1);
      description = extract1;
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }

  void incre(String text) {
    send.add(text);
    notifyListeners();
  }

  void decre(String text) {
    send.remove(text);
    notifyListeners();
  }

  void emptylist() {
    send.clear();
    result.clear();
    notifyListeners();
  }
}
