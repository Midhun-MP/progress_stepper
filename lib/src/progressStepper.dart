import 'package:flutter/material.dart';
import 'package:progress_stepper/src/progressStep.dart';

class ProgressStepper extends StatelessWidget {
  final Color progressColor;
  final Color color;
  final double width;
  final double height;
  final double padding;
  final int stepCount;
  final int currentStep;

  ProgressStepper({
    Key key,
    @required this.width,
    this.height = 10,
    this.padding = 2,
    this.stepCount = 5,
    this.currentStep = 0,
    this.color = const Color(0xFFCECECF),
    this.progressColor = const Color(0xFFFBB040),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Row(children: getProgressSteps()),
    );
  }

  List<Widget> getProgressSteps() {
    List<Widget> steps = [];
    double widthOfStep = (width - ((stepCount - 1) * padding)) / stepCount;
    for (int index = 1; index <= stepCount; index++) {
      ProgressStep step = ProgressStep(
        width: widthOfStep,
        defaultColor: color,
        progressColor: progressColor,
        wasCompleted: index <= currentStep,
      );
      steps.add(step);
      if (stepCount != index) {
        steps.add(SizedBox(width: padding));
      }
    }
    return steps;
  }
}
