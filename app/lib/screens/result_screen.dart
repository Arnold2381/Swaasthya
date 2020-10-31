import 'package:flutter/material.dart';
import 'package:hack/providers/data_provider.dart';
import 'package:hack/providers/list_provider.dart';
import 'package:hack/providers/service_provider.dart';
import 'package:provider/provider.dart';
import 'package:hack/screens/detail_screen.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

class ResultScreen extends StatefulWidget {
  static const routename = '/result';
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final s = Provider.of<ServiceProvider>(context);

    final detail = Provider.of<Report>(context);
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () async {
        s.emptylist();
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Your Results',
              style: TextStyle(
                fontFamily: "KumbhSans",
                fontSize: 25,
              ),
            ),
            backgroundColor: Colors.deepOrangeAccent,
            centerTitle: true,
            elevation: 10,
          ),
          body: FutureBuilder<List>(
              future: s.sendsymptoms(s.send),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          title: Text(
                            'Symptom List',
                            style: TextStyle(
                              fontFamily: "KumbhSans",
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(
                            'these are the symptoms you selected',
                            style: TextStyle(fontFamily: "KumbhSans"),
                          ),
                        ),
                        Container(
                          height: 35,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: s.send.length,
                              itemBuilder: (ctx, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: RawChip(
                                    backgroundColor: Colors.deepOrangeAccent,
                                    label: Text(
                                      s.send[index],
                                      style: TextStyle(
                                          fontFamily: "KumbhSans",
                                          color: Colors.white),
                                    ),
                                    showCheckmark: true,
                                  ),
                                );
                              }),
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          title: Text(
                            'Possible Daignosis',
                            style: TextStyle(
                              fontFamily: "KumbhSans",
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(
                            'these are the possible reslut for your symptoms',
                            style: TextStyle(fontFamily: "KumbhSans"),
                          ),
                        ),
                        Container(
                          height: 400,
                          child: ListView.builder(
                              itemCount: s.result.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    s.getallprecautions(s.result[index]);
                                    s.getalldesc(s.result[index]);
                                    Navigator.of(context)
                                        .pushNamed(DetailScreen.routname);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: Card(
                                      elevation: 7,
                                      child: ListTile(
                                        title: Text(
                                          s.result[index],
                                          style: TextStyle(
                                            fontFamily: "KumbhSans",
                                            fontSize: 20,
                                          ),
                                        ),
                                        subtitle: Text(
                                          'click for more informaion',
                                          style: TextStyle(
                                            color: Colors.deepOrangeAccent,
                                            fontFamily: "KumbhSans",
                                          ),
                                        ),
                                        trailing: 
                                           
                                             IconButton(
                                              
                                               icon:  Icon(
                                                 Icons.add,
                                                 color: Colors.deepOrangeAccent,
                                               ),
                                                onPressed: () { 
                                                  detail.getreport(s.result[index]);
                                              Alert(
                                                context: context,
                                                
                                                title: "Notice",
                                                desc:
                                                    "Your Medical Report has beeen Updated",
                                                buttons: [
                                                  DialogButton(
                                                    color:
                                                        Colors.deepOrangeAccent,
                                                    child: Text(
                                                      "OKAY",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20),
                                                    ),
                                                    onPressed: () =>
                                                        Navigator.pop(context),
                                                    width: 120,
                                                  )
                                                ],
                                              ).show();
                                                 },
                                            )),
                                      ),
                                    ),
                                  
                                );
                              }),
                        )
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('haserror'));
                } else {
                  return Center(
                      child: CircularProgressIndicator(
                          backgroundColor: Colors.deepOrangeAccent));
                }
              })),
    );
  }
}
