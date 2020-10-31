import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'dart:async';
import 'package:pedometer/pedometer.dart';

import 'package:hack/widgets/gradient_pie/middle_ring.dart';
import 'package:hack/widgets/gradient_pie/progress_rings.dart';

class GradientPie extends StatefulWidget {
  final num target;

  const GradientPie({
    Key key,
    @required this.target,
  }) : super(key: key);

  @override
  _GradientPieState createState() => _GradientPieState();
}

class _GradientPieState extends State<GradientPie> {
  Stream<StepCount> _stepCountStream;
  Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?';
  num _steps = 0;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps;
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 0;
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    // Outer white circle
    return Container(
      height: 290.0,
      width: 290.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white24,
      ),
      child: Center(
        child: Container(
          height: 200.0,
          width: 200.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.9),
                spreadRadius: 20,
                blurRadius: 45,
                offset: Offset(0, 7), // changes position of shadow
              ),
            ],
          ),
          child: Stack(
            children: <Widget>[
              Center(
                  child: MiddleRing(
                width: 300.0,
                taken: _steps,
                target: widget.target,
              )),
              Transform.rotate(
                angle: pi * 1.6,
                child: CustomPaint(
                  child: Center(),
                  painter: ProgressRings(
                    completedPercentage: 2.0,
                    circleWidth: 50.0,
                    gradient: whiteGradient,
                    gradientStartAngle: 0.0,
                    gradientEndAngle: pi,
                    progressStartAngle: 1.85,
                    lengthToRemove: 3,
                  ),
                ),
              ),
              Transform.rotate(
                angle: -(pi / 2),
                child: CustomPaint(
                  child: Center(),
                  painter: ProgressRings(
                    completedPercentage: _steps / widget.target,
                    circleWidth: 50.0,
                    gradient: orangeGradient,
                    gradientStartAngle: 0.0,
                    gradientEndAngle: 2 * pi,
                    progressStartAngle: 1.85,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final innerColor = Color.fromRGBO(233, 242, 249, 1);
final shadowColor = Color.fromRGBO(200, 207, 214, 1);

const greenGradient = [
  Color.fromRGBO(223, 250, 92, 1),
  Color.fromRGBO(129, 250, 112, 1)
];
const turqoiseGradient = [
  Color.fromRGBO(91, 253, 199, 1),
  Color.fromRGBO(129, 182, 205, 1)
];

const whiteGradient = [
  Color.fromRGBO(255, 255, 255, 1),
  Color.fromRGBO(255, 255, 255, 1)
];

const redGradient = [
  Color.fromRGBO(255, 93, 91, 1),
  Color.fromRGBO(254, 154, 92, 1),
];
const orangeGradient = [
  Color.fromRGBO(253, 255, 93, 1),
  Color.fromRGBO(251, 0, 0, 1),
];
