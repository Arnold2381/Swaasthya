import 'package:flutter/material.dart';
import 'package:hack/providers/user.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'page_control.dart';

class SignupForm extends StatefulWidget {
  static const routname = '/signup';
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  GlobalKey<FormState> loginFormKey;
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   final token = MyUser().loadPreferences();    Navigator.of(context).pushReplacementNamed(PagesScreen.routename);
  // }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);
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
                'Lets Create a new User!',
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
                        key: loginFormKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            TextFormField(
                              controller: _name,
                              keyboardType: TextInputType.text,
                              onSaved: (input) => user.name = input,
                              validator: (input) => input.length < 3
                                  ? 'it should be more than 3 characters'
                                  : null,
                              decoration: InputDecoration(
                                labelText: 'Full Name',
                                labelStyle:
                                    TextStyle(color: Colors.deepOrangeAccent),
                                contentPadding: EdgeInsets.all(12),
                                hintText: 'John Doe',
                                hintStyle: TextStyle(
                                    color: Colors.deepOrangeAccent
                                        .withOpacity(0.7)),
                                prefixIcon: Icon(Icons.person_outline,
                                    color: Colors.deepOrangeAccent),
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
                            SizedBox(height: 30),
                            TextFormField(
                              controller: _email,
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (input) => user.email = input,
                              validator: (input) => !input.contains('@')
                                  ? 'should be avalid email'
                                  : null,
                              decoration: InputDecoration(
                                labelText: 'email',
                                labelStyle:
                                    TextStyle(color: Colors.deepOrangeAccent),
                                contentPadding: EdgeInsets.all(12),
                                hintText: 'johndoe@gmail.com',
                                hintStyle: TextStyle(
                                    color: Colors.deepOrangeAccent
                                        .withOpacity(0.7)),
                                prefixIcon: Icon(Icons.alternate_email,
                                    color: Colors.deepOrangeAccent),
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
                            SizedBox(height: 30),
                            TextFormField(
                              controller: _password,
                              onSaved: (input) => user.password = input,
                              validator: (input) => input.length < 6
                                  ? 'should be more than 6 letters'
                                  : null,
                              decoration: InputDecoration(
                                labelText: 'password',
                                labelStyle:
                                    TextStyle(color: Colors.deepOrangeAccent),
                                contentPadding: EdgeInsets.all(12),
                                hintText: '••••••••••••',
                                hintStyle: TextStyle(
                                    color: Colors.deepOrangeAccent
                                        .withOpacity(0.7)),
                                prefixIcon: Icon(Icons.lock_outline,
                                    color: Colors.deepOrangeAccent),
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
                            SizedBox(height: 20),
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
                                    user
                                        .register(_name.text, _email.text,
                                            _password.text)
                                        .then((value) {
                                      if (value == true) {
                                        Navigator.of(context)
                                            .pushNamed('/personel');
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
                                  }),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/login');
                              },
                              textColor: Theme.of(context).hintColor,
                              child: Text('I have an account . Take to Login'),
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
