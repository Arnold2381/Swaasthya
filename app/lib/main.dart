import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hack/providers/data_provider.dart';
import 'package:hack/providers/list_provider.dart';
import 'package:hack/providers/service_provider.dart';
import 'package:hack/providers/user.dart';
import 'package:hack/screens/Intro_screen.dart';
import 'package:hack/screens/home_page.dart';
import 'package:hack/screens/login_screen.dart';
import 'package:hack/screens/page_control.dart';
import 'package:hack/screens/personel_screen.dart';
import 'package:hack/screens/places_screen.dart';
import 'package:hack/screens/result_screen.dart';
import 'package:hack/screens/signup_screen.dart';
import 'package:hack/screens/splash_screen.dart';
import 'package:hack/services.dart/geolocator_service.dart';
import 'package:hack/services.dart/places.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:after_layout/after_layout.dart';
import 'package:hack/screens/detail_screen.dart';
// import 'package:hack/screens/home_page.dart';

import 'models/places.dart';
import 'providers/userclass.dart';
import 'screens/page_control.dart';
// import 'screens/page_control.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final locatorService = GeoLocatorService();
  final placesService = PlacesService();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          FutureProvider(create: (context) => locatorService.getLocation()),
          ProxyProvider<Position, Future<List<Place>>>(
            update: (context, position, places) {
              return (position != null)
                  ? placesService.getPlaces(
                      position.latitude, position.longitude)
                  : null;
            },
          ),
          ChangeNotifierProvider(create: (context) => ServiceProvider()),
          ChangeNotifierProvider(create: (context) => ListProvider()),
          ChangeNotifierProvider(create: (context) => Report()),
          ChangeNotifierProvider(create: (context) => User()),
          ChangeNotifierProvider(create: (context) => MyUser()),
          ChangeNotifierProvider(create: (context)=>PlacesService())
         
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Version1.1',
          home: Splash(),
          routes: {
            SplashScreen.routeName: (ctx) => SplashScreen(),
            OnboardingScreen.routeName: (ctx) => OnboardingScreen(),
            ResultScreen.routename: (ctx) => ResultScreen(),
            DetailScreen.routname: (ctx) => DetailScreen(),
            PagesScreen.routename: (ctx) => PagesScreen(),
            LoginForm.routname:(ctx)=>LoginForm(),
            SignupForm.routname:(ctx)=>SignupForm(),
            AuthForm.routname:(ctx)=>AuthForm(),
            SearchMap.routename:(ctx)=>SearchMap(),
            
          },
        ));
  }
}

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new SplashScreen()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new OnboardingScreen()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('Loading...'),
      ),
    );
  }
}
