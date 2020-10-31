import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyUser with ChangeNotifier {
  String name;
  String email;
  String password;
  String token;
  String height;
  String weight;
  String blood;
  String sex;
  String dob;

  MyUser();

  MyUser.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      name = jsonMap['name'] != null ? jsonMap['name'] : '';
      email = jsonMap['email'] != null ? jsonMap['email'] : '';
      token = jsonMap['token'];
      password = jsonMap['password'] != null ? jsonMap['password'] : '';
      height = jsonMap['height'] != null ? jsonMap['height'] : '';
      weight = jsonMap['weight'] != null ? jsonMap['weight'] : '';
      blood = jsonMap['blood'] != null ? jsonMap['blood'] : '';
      sex = jsonMap['sex'] != null ? jsonMap['sex'] : '';
      dob = jsonMap['dob'] != null ? jsonMap['dob'] : '';
    } catch (e) {
      print(e);
    }
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["email"] = email;
    map["name"] = name;
    map["password"] = password;
    map["token"] = token;
    map["height"] = height;
    map["weight"] = weight;
    map["dob"] = dob;
    map["blood"] = blood;
    map["sex"] = sex;
    return map;
  }

  Future<bool> register(String name1, String email1, String pass1) async {
    var url = "https://swaasthya-back.herokuapp.com/api/user/signup";
    print(name1);
    try {
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.encode(
              {"name": "$name1", "email": "$email1", "password": "$pass1"}));
      final extract = json.decode(response.body);
      token = json.decode(response.body)["token"];
      savePreferences(token);
      print(token);
      print(extract);
      notifyListeners();
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<bool> login(String email1, String pass1) async {
    var url = "https://swaasthya-back.herokuapp.com/api/user/login";

    try {
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.encode({"email": "$email1", "password": "$pass1"}));
      final extract = json.decode(response.body);
      print(extract);
      token = json.decode(response.body)["token"];
      savePreferences(token);
      notifyListeners();
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<bool> details(
      String heght, String weght, String sexy, String bloo, String dob) async {
    var url = "https://swaasthya-back.herokuapp.com/api/profile/create";
    print(token);
    print(weght);

    try {
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          },
          body: json.encode({
            "height": "$heght",
            "weight": "$weght",
            "sex": "$sexy",
            "blood": "$bloo",
            "Dob": "$dob"
          }));
      final extract = json.decode(response.body);

      print(token);
      print(extract);
      notifyListeners();
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<bool> fetchProfile() async {
    var url = "https://swaasthya-back.herokuapp.com/api/profile/fetch";
    print(token);
    try {
      final response = await http.get(
        url,
        headers: <String, String>{'Authorization': 'Bearer $token'},
      );
      final extract = json.decode(response.body);
      print(extract);
      notifyListeners();
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
      return false;
    }
  }

  savePreferences(String token1) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('token', token1);
  }

  Future<String> loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return token = prefs.getString('token');
  }
}
