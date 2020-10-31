import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hack/providers/data_provider.dart';
import 'package:hack/providers/userclass.dart';
import 'package:hack/providers/userclass.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';


class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
 
   
  @override
  Widget build(BuildContext context) {
    final detail = Provider.of<Report>(context);
    return Scaffold(
        appBar: AppBar(
        title: Text(
          'Your Medical Report',
          style: TextStyle(
            fontFamily: "KumbhSans",
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        elevation: 10,
      ),
        body: ListView.builder(
          padding: EdgeInsets.only(top: 10, left: 40, right:30),
            itemCount: detail.report.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, i) => Center(
                    child: Column(children: <Widget>[
                  ListTile(
                    title: Text(detail.report[i]),
                    subtitle: Text('Self Diagnosed'),
                    trailing: Text(DateTime.now().toString())
                  )
                ]))));
  }
}
