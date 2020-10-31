import 'package:hack/widgets/forms.dart';
import 'package:flutter/material.dart';

import 'TextStyles.dart';

import 'forms.dart';

class ImageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Container(
      height: 300.0,
      width: 500.0,
      
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Image(
              image: AssetImage('lib/assets/medical_gif.gif'),
              fit: BoxFit.fill,
            ),
          ),
        /*  Padding(
            padding: const EdgeInsets.only(bottom: 60.0, left: 20, right: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 
                ],
              ),
            ),
          ),*/
         
        ],
      ),
    );
  }
}
