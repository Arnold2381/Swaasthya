import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hack/providers/service_provider.dart';
import 'package:hack/providers/userclass.dart';
import 'package:hack/screens/places_screen.dart';
import 'package:hack/services.dart/places.dart';
import 'package:hack/widgets/category_card.dart';
import 'package:hack/widgets/imageContainer.dart';
import 'package:hack/widgets/moods.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get_it/get_it.dart';
import 'package:hack/screens/medical_report.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class CallsAndMessagesService {
  void call(String number) => launch("tel:$number");
}

GetIt locator = GetIt();

void setupLocator() {
  locator.registerSingleton(CallsAndMessagesService());
}

class _HomePageState extends State<HomePage> {
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();
  final number = '108';
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Swaasthya',
          style: TextStyle(
              color: Colors.white, fontFamily: "KumbhSans", fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          ImageContainer(),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                  title: Text(
                    'Hello' + " " + user.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "KumbhSans",
                    ),
                  ),
                  subtitle: Text(
                    'Welcome Back',
                    style: TextStyle(fontSize: 30, fontFamily: "KumbhSans"),
                  ),
                  trailing: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.deepOrangeAccent,
                      child: Center(
                        child: IconButton(
                            color: Colors.white,
                            icon: Icon(FontAwesomeIcons.robot),
                            onPressed: () {
                              _launchBotUrl();
                            }),
                      )))),
          SizedBox(
            height: 10,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              // height: 100,
              width: MediaQuery.of(context).size.width * .95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[100],
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Hi how are you feeling today!',
                      style: TextStyle(fontSize: 22, fontFamily: "KumbhSans"),
                    ),
                    MoodsSelector(),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportPage()),
              );
            },
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  // height: 80,
                  width: MediaQuery.of(context).size.width * .95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[100],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Your Medical Record',
                              style: TextStyle(
                                  fontSize: 22, fontFamily: "KumbhSans"),
                            ),
                            Text(
                              'see and edit your medical record',
                              style: TextStyle(
                                  fontSize: 15, fontFamily: "KumbhSans"),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.deepOrangeAccent,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              dense: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              title: Text(
                'Doctors',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: "KumbhSans"),
              ),
              subtitle: Text(
                'select your choice of doctors',
                style: TextStyle(fontFamily: "KumbhSans"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/maps');
                    },
                    child: CategoryCard(
                        'Dental\nSurgeon',
                        'lib/assets/dental_surgeon.png',
                        Colors.deepOrangeAccent),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CategoryCard(
                    'Heart\nSurgeon',
                    'lib/assets/heart_surgeon.png',
                    Colors.deepOrangeAccent,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CategoryCard(
                    'Eye\nSpecialist',
                    'lib/assets/eye_specialist.png',
                    Colors.deepOrangeAccent,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                ],
              ),
            ),
          )
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrangeAccent,
          child: Icon(FontAwesomeIcons.ambulance),
          onPressed: () => _service.call(number)),
    );
  }

  void _launchBotUrl() async {
    final url =
        'https://assistant.google.com/services/invoke/uid/000000776ebdca7f?hl=en%22%3E';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
