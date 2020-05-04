import 'package:flutter/material.dart';
import 'package:progress_stepper/progress_stepper.dart';

typedef Widget ProgressStepperBuilder(int index);

class ProgressStepper extends StatelessWidget {
  final Color progressColor;
  final Color color;
  final double width;
  final double height;
  final double padding;
  final int stepCount;
  final int currentStep;
  final ProgressStepperBuilder builder;

  ProgressStepper({
    Key key,
    @required this.width,
    this.height = 10,
    this.padding = 2,
    this.stepCount = 5,
    this.currentStep = 0,
    this.color = const Color(0xFFCECECF),
    this.progressColor = const Color(0xFFFBB040),
    this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Row(children: _getProgressSteps(), mainAxisAlignment: MainAxisAlignment.spaceBetween,),
    );
  }

  List<Widget> _getProgressSteps() {
    if (builder == null) {
      return _createSteps();
    } else {
      return _invokeBuilder();
    }
  }

  List<Widget> _createSteps() {
    List<Widget> steps = [];
    double widthOfStep = (width - ((stepCount - 1) * padding)) / stepCount;
    for (int index = 1; index <= stepCount; index++) {
      ProgressStepWithChevron step = ProgressStepWithChevron(
        width: widthOfStep,
        defaultColor: color,
        progressColor: progressColor,
        wasCompleted: index <= currentStep,
      );
      steps.add(step);
    }
    return steps;
  }

  List<Widget> _invokeBuilder() {
    List<Widget> steps = [];
    for (int index = 1; index <= stepCount; index++) {
      steps.add(builder(index));
    }
    return steps;
  }
}
