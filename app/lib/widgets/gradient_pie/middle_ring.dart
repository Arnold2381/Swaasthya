import 'package:flutter/material.dart';
import 'package:hack/widgets/gradient_pie/gradient_pie.dart';

class MiddleRing extends StatelessWidget {
  final num width;
  final num target;
  final num taken;
  // Add Text showing taken steps and target number of steps and Icon

  const MiddleRing(
      {Key key,
      @required this.width,
      @required this.taken,
      @required this.target})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: width,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          child: Center(
              child: Container(
                  height: 50,
                  child: Column(
                    children: [
                      Text(
                        this.taken.toString() + ' / ' + this.target.toString(),
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "KumbhSans",
                            color: Colors.blue),
                      ),
                      Text(
                        'Steps Taken',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "KumbhSans",
                            color: Colors.blue),
                      ),
                    ],
                  ))),
          height: width * 0.5,
          width: width * 0.5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              // Edge shadow
              BoxShadow(
                offset: Offset(-1.5, -1.5),
                color: shadowColor,
                spreadRadius: 1.0,
                // blurRadius: 0,
              ),
              BoxShadow(
                offset: Offset(1.5, 1.5),
                color: Colors.white,
                spreadRadius: 1.0,
                blurRadius: 4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
