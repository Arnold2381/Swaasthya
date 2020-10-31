import 'package:flutter/material.dart';
import 'package:hack/providers/user.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../providers/service_provider.dart';
import '../providers/userclass.dart';
import 'page_control.dart';

class AuthForm extends StatefulWidget {
  static const routname = '/personel';
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  TextEditingController _dob = TextEditingController();
  TextEditingController _sex = TextEditingController();
  TextEditingController _height = TextEditingController();
  TextEditingController _weight = TextEditingController();
  TextEditingController _bg = TextEditingController();
  TextEditingController _name = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);
    final myuser = Provider.of<User>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: <Widget>[
        Positioned(
          top: 0,
          child: Container(
            width: MediaQuery.of(context).size.width * 1,
            height: 400,
            decoration: BoxDecoration(color: Colors.deepOrangeAccent),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Text(
                'Lets Start With these details!',
                style: TextStyle(
                    color: Colors.white, fontFamily: "KumbhSans", fontSize: 25),
              ),
              Center(
                child: Card(
                  margin: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(height: 20),
                            TextFormField(
                              controller: _name,
                              keyboardType: TextInputType.text,
                              onSaved: (input) => user.name = input,
                              validator: (input) => input.length == 0
                                  ? 'it should be more than 3 characters'
                                  : null,
                              decoration: InputDecoration(
                                labelText: 'name',
                                labelStyle:
                                    TextStyle(color: Colors.deepOrangeAccent),
                                contentPadding: EdgeInsets.all(12),
                                hintText: 'jay',
                                hintStyle: TextStyle(
                                    color: Colors.deepOrangeAccent
                                        .withOpacity(0.7)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepOrangeAccent
                                            .withOpacity(0.2))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepOrangeAccent
                                            .withOpacity(0.5))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepOrangeAccent
                                            .withOpacity(0.2))),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _height,
                              keyboardType: TextInputType.text,
                              onSaved: (input) => user.name = input,
                              validator: (input) => input.length == 0
                                  ? 'it should be more than 3 characters'
                                  : null,
                              decoration: InputDecoration(
                                labelText: 'Height in cms',
                                labelStyle:
                                    TextStyle(color: Colors.deepOrangeAccent),
                                contentPadding: EdgeInsets.all(12),
                                hintText: '124',
                                hintStyle: TextStyle(
                                    color: Colors.deepOrangeAccent
                                        .withOpacity(0.7)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepOrangeAccent
                                            .withOpacity(0.2))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepOrangeAccent
                                            .withOpacity(0.5))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepOrangeAccent
                                            .withOpacity(0.2))),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _weight,
                              keyboardType: TextInputType.text,
                              onSaved: (input) => user.name = input,
                              validator: (input) => input.length == 0
                                  ? 'it should be more than 3 characters'
                                  : null,
                              decoration: InputDecoration(
                                labelText: 'Weight in kg',
                                labelStyle:
                                    TextStyle(color: Colors.deepOrangeAccent),
                                contentPadding: EdgeInsets.all(12),
                                hintText: '55',
                                hintStyle: TextStyle(
                                    color: Colors.deepOrangeAccent
                                        .withOpacity(0.7)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepOrangeAccent
                                            .withOpacity(0.2))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepOrangeAccent
                                            .withOpacity(0.5))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepOrangeAccent
                                            .withOpacity(0.2))),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _sex,
                              keyboardType: TextInputType.text,
                              onSaved: (input) => user.name = input,
                              validator: (input) => input.length == 0
                                  ? 'it should be more than 3 characters'
                                  : null,
                              decoration: InputDecoration(
                                labelText: 'Gender',
                                labelStyle:
                                    TextStyle(color: Colors.deepOrangeAccent),
                                contentPadding: EdgeInsets.all(12),
                                hintText: 'male',
                                hintStyle: TextStyle(
                                    color: Colors.deepOrangeAccent
                                        .withOpacity(0.7)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepOrangeAccent
                                            .withOpacity(0.2))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepOrangeAccent
                                            .withOpacity(0.5))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepOrangeAccent
                                            .withOpacity(0.2))),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _bg,
                              keyboardType: TextInputType.text,
                              onSaved: (input) => user.name = input,
                              validator: (input) => input.length == 0
                                  ? 'it should be more than 3 characters'
                                  : null,
                              decoration: InputDecoration(
                                labelText: 'Blood Group',
                                labelStyle:
                                    TextStyle(color: Colors.deepOrangeAccent),
                                contentPadding: EdgeInsets.all(12),
                                hintText: 'B+',
                                hintStyle: TextStyle(
                                    color: Colors.deepOrangeAccent
                                        .withOpacity(0.7)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepOrangeAccent
                                            .withOpacity(0.2))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepOrangeAccent
                                            .withOpacity(0.5))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepOrangeAccent
                                            .withOpacity(0.2))),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _dob,
                              keyboardType: TextInputType.text,
                              onSaved: (input) => user.name = input,
                              validator: (input) => input.length == 0
                                  ? 'it should be more than 3 characters'
                                  : null,
                              decoration: InputDecoration(
                                labelText: 'Date of birth',
                                labelStyle:
                                    TextStyle(color: Colors.deepOrangeAccent),
                                contentPadding: EdgeInsets.all(12),
                                hintText: '3/11/2000',
                                hintStyle: TextStyle(
                                    color: Colors.deepOrangeAccent
                                        .withOpacity(0.7)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepOrangeAccent
                                            .withOpacity(0.2))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepOrangeAccent
                                            .withOpacity(0.5))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepOrangeAccent
                                            .withOpacity(0.2))),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 350,
                              height: 50,
                              child: RaisedButton(
                                  color: Colors.deepOrangeAccent,
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                        fontFamily: "KumbhSans",
                                        color: Colors.white),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      user
                                          .details(_height.text, _weight.text,
                                              _sex.text, _bg.text, _dob.text)
                                          .then((value) {
                                        if (value == true) {
                                           myuser.getdata(_name.text, _dob.text,
                                      _weight.text, _height.text, _sex.text,_bg.text);
                                  myuser.calbmi(_weight.text, _height.text);
                                          
                                          Navigator.of(context)
                                              .pushReplacementNamed(PagesScreen.routename);
                                        }
                                        if (value == false) {
                                          Alert(
                                            context: context,
                                            type: AlertType.error,
                                            title: "Alert",
                                            desc: "Something went wrong",
                                            buttons: [
                                              DialogButton(
                                                color: Colors.deepOrangeAccent,
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
                                        }
                                      });
                                    }
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
