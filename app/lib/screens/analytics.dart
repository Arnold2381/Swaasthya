import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hack/providers/userclass.dart';
import 'package:provider/provider.dart';
import 'package:hack/widgets/gradient_pie/gradient_pie.dart';

class AnalyticPage extends StatefulWidget {
  @override
  _AnalyticPageState createState() => _AnalyticPageState();
}

class _AnalyticPageState extends State<AnalyticPage> {
  /*Padding bmicolor()
  {
    if( user.bmi <= 18.5 )
    {
      return Padding(
              padding: EdgeInsets.only(top: 20),
              child: Center(
                  child: Text(
                user.bmi.toStringAsPrecision(3),
                style: TextStyle(
                    fontSize: 26,
                    fontFamily: "KumbhSans",
                    color: Colors.blue),
              )));
    }
    else if( user.bmi >= 18.5 && user.bmi < 30)
    {
      return Padding(
              padding: EdgeInsets.only(top: 20),
              child: Center(
                  child: Text(
                user.bmi.toStringAsPrecision(3),
                style: TextStyle(
                    fontSize: 26,
                    fontFamily: "KumbhSans",
                    color: Colors.green),
              )));
    }
    else
    {
      return Padding(
              padding: EdgeInsets.only(top: 20),
              child: Center(
                  child: Text(
                user.bmi.toStringAsPrecision(3),
                style: TextStyle(
                    fontSize: 26,
                    fontFamily: "KumbhSans",
                    color: Colors.red),
              )));
    }
  }
  Padding bmitext()
  {
    if(user.bmi<=18)
    {
      return Padding(
              padding: EdgeInsets.only(top: 20),
              child: Center(
                  child: Text(
                'Underwieght!\nPlease follow healthy diet',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "KumbhSans",
                    ),
              )));
    }
    else if(user.bmi>18&&user.bmi<30)
    {
      return Padding(
              padding: EdgeInsets.only(top: 20, left: 40, right: 20),
              child: Center(
                  child: Text(
                'Normal!\nPlease continue to follow healthy diet and exercise schedule',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "KumbhSans",
                    ),
              )));
    }
    else
    {
      return Padding(
              padding: EdgeInsets.only(top: 20, left: 40),
              child: Center(
                  child: Text(
                'Overwieght!\nPlease plan a healthy diet and do exercise regularly',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "KumbhSans",
                    ),
              )));
    }
  }*/
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Analytics',
            style: TextStyle(
              fontFamily: "KumbhSans",
              fontSize: 25,
            ),
          ),
          backgroundColor: Colors.deepOrangeAccent,
          centerTitle: true,
          elevation: 10,
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              dense: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              title: Text(
                'Body Mass Index',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: "KumbhSans"),
              ),
              subtitle: Text(
                'here is your calculated bmi',
                style: TextStyle(fontFamily: "KumbhSans"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 25),
            child: Row(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 1),
                    child: Center(
                        child: Text(
                      'Your BMI is:',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "KumbhSans",
                          color: Colors.black),
                    ))),
                Padding(
                    padding: EdgeInsets.only(top: 1),
                    child: Center(
                        child: Text(
                      user.bmi.toStringAsPrecision(3),
                      style: TextStyle(
                        fontSize: 26,
                        fontFamily: "KumbhSans",
                        color: user.color,
                      ),
                    ))),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Center(
                  child: Text(
                user.ans,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "KumbhSans",
                ),
              ))),
          Padding(
              padding: EdgeInsets.only(top: 1),
              child: Center(child: GradientPie(target: 1000))),
        ])));
  }
}
