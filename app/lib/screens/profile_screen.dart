import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hack/screens/medical_report.dart';
import 'package:hack/providers/userclass.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
  @override
  Widget build(BuildContext context) {
     final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Profile',
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
          child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 40, left: 40, right: 40),
              child: Center(
                  child: CircleAvatar(
                     radius: 72,
                    child: Image(
                      
                      image: NetworkImage('https://www.pngitem.com/pimgs/m/214-2145309_blank-profile-picture-circle-hd-png-download.png'),),
               
              ))),
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: Center(
                  child: Text(
                user.name,
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: "KumbhSans",
                    color: Colors.deepOrangeAccent),
              ))),
          Padding(
            padding: EdgeInsets.only(top: 50, left: 40, right: 40),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Date of Birth',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "KumbhSans",
                              )),
                          Text(user.dob,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "KumbhSans",
                              ))
                        ],
                      )),
                  Divider(),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Sex',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "KumbhSans",
                              )),
                          Text(user.sex,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "KumbhSans",
                              ))
                        ],
                      )),
                  Divider(),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Blood Group',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "KumbhSans",
                              )),
                          Text(user.bloodgrp,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "KumbhSans",
                              ))
                        ],
                      )),
                  Divider(),
                  Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Hieght',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "KumbhSans",
                              )),
                          Text(user.hieght.toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "KumbhSans",
                              ))
                        ],
                      )),
                  Divider(),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Weight',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "KumbhSans",
                              )),
                          Text(user.wieght.toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "KumbhSans",
                              ))
                        ],
                      )),
                ]),
          ),
          GestureDetector(
            onTap: (){
               Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReportPage()),
                              );

            },
                      child: Padding(
              padding: EdgeInsets.only(top: 40, left: 40, right: 40),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width * .95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[100],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 8, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Your Medical Record',
                              style: TextStyle(
                                  fontSize: 18, fontFamily: "KumbhSans"),
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
          )
        ],
      )),
    );
  }
}
