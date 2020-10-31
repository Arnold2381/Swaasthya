import 'package:flutter/material.dart';
import 'package:hack/providers/service_provider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  static const routname = '/detail';
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final s = Provider.of<ServiceProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Self Assesment',
          style: TextStyle(
            fontFamily: "KumbhSans",
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        elevation: 10,
      ),
      body: s.description != null && s.precaution != null
          ? SingleChildScrollView(
              child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    dense: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    title: Text(
                      'Description',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontFamily: "KumbhSans"),
                    ),
                    subtitle: Text(
                      'here is a description of your disease',
                      style: TextStyle(fontFamily: "KumbhSans"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 23),
                  child: Container(
                      height: 140,
                      child: Text(
                        s.description.toString(),
                        style: TextStyle(fontFamily: "KumbhSans", fontSize: 20),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    dense: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    title: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        'Precautions',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            fontFamily: "KumbhSans"),
                      ),
                    ),
                    subtitle: Text(
                      'Take these Precautions',
                      style: TextStyle(fontFamily: "KumbhSans"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 23,),
                  child: Container(
                    height: 300,
                    child: ListView.builder(
                        itemCount: s.precaution.length,
                        itemBuilder: (ctx, index) {
                          return
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.deepOrangeAccent,
                              radius: 5,
                            ),
                            title: Text(s.precaution[index],style: TextStyle(
                              fontFamily: "KumbhSans",
                              fontSize: 20,
                            ),),
                          );
                        }),
                  ),
                )
              ],
            ))
          : Center(
              child: CircularProgressIndicator(
                  backgroundColor: Colors.deepOrangeAccent)),
    );
  }
}
