import 'package:flutter/material.dart';
import 'package:hack/providers/list_provider.dart';
import 'package:hack/providers/service_provider.dart';
import 'package:hack/screens/result_screen.dart';
import 'package:hack/widgets/forms.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hack/providers/list_provider.dart';
import 'package:hack/providers/service_provider.dart';
import 'package:hack/utils/consts.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _symController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final s = Provider.of<ServiceProvider>(context);
    final lst = Provider.of<ListProvider>(context);

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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 35, 10, 10),
              child: Text(
                "To correctly Assess your health condition we need to know your symptoms",
                style: TextStyle(fontSize: 20, fontFamily: "KumbhSans"),
              ),
            ),
            //NormalForm(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: AutoCompleteTextField(
                      controller: _symController1,
                      /* textSubmitted: (data) {
                   setState(()  {
                     send.add(data);
                  });
                 
                  _symController1.text = data;
                  print(send);
                  data = null;
                },*/
                      clearOnSubmit: true,
                      style: TextStyle(
                          fontFamily: "nunito",
                          fontWeight: FontWeight.w500,
                          color: kgreyDark,
                          fontSize: 15.5),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          hintText: 'Enter atleast 4 Sypmtoms',
                          hintStyle: TextStyle(
                              fontFamily: "KumbhSans",
                              fontWeight: FontWeight.w500,
                              color: kgreyDark,
                              fontSize: 15.5),
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 14.0),
                          focusColor: Colors.grey.shade700,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(15.0),
                          )),
                      submitOnSuggestionTap: true,
                      suggestions: lst.lists,
                      itemBuilder: (BuildContext context, suggestion) {
                        return ListTile(
                          title: Text(suggestion),
                        );
                      },
                      itemFilter: (item, String query) {
                        return item
                            .toString()
                            .toLowerCase()
                            .startsWith(query.toLowerCase());
                      },
                      itemSubmitted: (data) {
                        s.incre(data);

                        _symController1.text = data;

                        data = null;
                      },
                      itemSorter: (a, b) {
                        return a.toString().compareTo(b);
                      },
                    ),
                  ),
                  s.send.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            width: 350,
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
                                      deleteIcon: Icon(
                                        Icons.cancel,
                                        color: Colors.white,
                                      ),
                                      onDeleted: () {
                                        s.decre(s.send[index]);
                                      },
                                    ),
                                  );
                                }),
                          ),
                        )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * .9,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.grey[100],
                      ),
                      child: RaisedButton.icon(
                          onPressed: () {
                            s.send.length <= 3
                                ? Alert(
                                    context: context,
                                    type: AlertType.error,
                                    title: "Alert",
                                    desc: "You need to add atleast 4 symptoms",
                                    buttons: [
                                      DialogButton(
                                        color: Colors.deepOrangeAccent,
                                        child: Text(
                                          "OKAY",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        width: 120,
                                      )
                                    ],
                                  ).show()
                                : Navigator.of(context)
                                    .pushNamed(ResultScreen.routename);
                          },
                          icon: Icon(
                            Icons.search,
                            color: Colors.deepOrangeAccent,
                          ),
                          label: Text(
                            'Submit',
                            style: TextStyle(
                                fontFamily: "KumbhSans", fontSize: 16),
                          )),
                    ),
                  )
                ],
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
