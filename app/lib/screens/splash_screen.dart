import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hack/providers/user.dart';
import 'package:hack/screens/signup_screen.dart';

import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    user.fetchProfile();

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.heartbeat,
                color: Colors.deepOrangeAccent,
                size: 90,
              ),
              SizedBox(height: 50),
            ],
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
        return SignupForm();
      }));
    });
  }
}
