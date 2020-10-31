
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hack/widgets/moods.dart';
import 'TextStyles.dart';
import 'package:hack/utils/consts.dart';

class SelfCard extends StatefulWidget {
 

  @override
  _SelfCardState createState() => _SelfCardState();
}

class _SelfCardState extends State<SelfCard> {
  @override
  Widget build(BuildContext context) {
   
   
    return GestureDetector(
     
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Container(
        
          child: Card(
            elevation: 10,
           
            child: Material(
              
              borderRadius: BorderRadius.circular(15.0),
              child: Container(


              /*  decoration: BoxDecoration(
                   gradient: new LinearGradient(colors: [
              
                Color(0xFFFF6E40),
                Color(0xFFFF8A65),
                Color(0xFFFFAB91),
                 Color(0xFFFFCCBC),
            ],
                begin: const FractionalOffset(0.2, 0.5),
                end: const FractionalOffset(0.5, 0.0),
                stops: [0.1, 0.3, 0.6, 0.9],
                tileMode: TileMode.clamp
          ),
                  

                   ),*/
                width: 540,
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        child: CircleAvatar(
                         radius: 20,
                          backgroundColor: Colors.deepOrangeAccent,
                          child: CircleAvatar(
                            radius: 47,
                            backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png')
                          ),
                        )
                        
                        /*ClipRRect(
                            borderRadius: new BorderRadius.all(
                              Radius.circular(15),
                            ),
                            child: Icon(Icons.portable_wifi_off)
                            
                            /*Image(
                              image: NetworkImage(widget),
                              fit: BoxFit.fitHeight,
                            )*/),*/
                      
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          //child: BoldText(widget.name, 20.0, kblack),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                            //  NormalText(widget.location, kgreyDark, 16.0),
                             
                              SizedBox(
                                width: 20.0,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            NormalText('Name : ', korange, 16),
                            /*Container(
                              width: 50.0,
                              decoration: BoxDecoration(
                                color: kpink2,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                 /* Icon(
                                    FontAwesomeIcons.rupeeSign,
                                    color: kwhite,
                                    size: 15.0,
                                  ),*/
                                 // BoldText(widget.rate.toString(), 15.0, kwhite)
                                ],
                              ),
                            ),*/
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            NormalText('Bloood Type : ',  korange, 16),
                           /* Container(
                              width: 50.0,
                              decoration: BoxDecoration(
                                color: kpink2,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.bed,
                                    color: kwhite,
                                    size: 15.0,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                 /* BoldText(
                                      widget.bedrooms.toString(), 15.0, kwhite)*/
                                ],
                              ),
                            ),*/
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            NormalText('Steps : ',  korange, 16),
                            /*Container(
                              width: 110.0,
                              decoration: BoxDecoration(
                                color: kpink2,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  /*Icon(
                                    FontAwesomeIcons.home,
                                    color: kwhite,
                                    size: 15.0,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),*/
                                  //BoldText(widget.type, 15.0, kwhite)
                                ],
                              ),
                            ),*/
                          ],
                        ),
                        SizedBox(height: 30,),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text('Hi how are you feeling today!',style: 
                          TextStyle(color: Colors.deepOrangeAccent),),
                        ),
                        SizedBox(height: 5),
                      MoodsSelector(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
