import 'package:flutter/material.dart';

import '../progress_stepper.dart';

typedef ProgressStepperBuilder = Widget Function(int index);
typedef ProgressStepperOnClick = void Function(int index);

class ProgressStepper extends StatelessWidget {
  const ProgressStepper({
    required this.width,
    this.height = 10,
    this.padding = 2,
    this.stepCount = 5,
    this.currentStep = 0,
    this.color = const Color(0xFFCECECF),
    this.progressColor = const Color(0xFFFBB040),
    this.builder,
    this.onClick,
    Key? key,
  }) : super(key: key);

  /// Active Progress Color
  final Color progressColor;

  /// No Progress Color
  final Color color;

  /// Width of control
  final double width;

  /// Height of control
  final double height;

  /// Padding between each steps
  final double padding;

  /// Number of Steps
  final int stepCount;

  /// Currently Selected Step
  /// Default value is 0
  /// Steps value starts from 1
  final int currentStep;

  /// Builder, for customising the stepper further
  final ProgressStepperBuilder? builder;

  /// On click callback
  /// If set, user tap will trigger it and give the index of tapped step
  final ProgressStepperOnClick? onClick;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _getProgressSteps(),
        ),
      );

  List<Widget> _getProgressSteps() {
    if (builder == null) {
      return _createSteps();
    } else {
      return _invokeBuilder();
    }
  }

  List<Widget> _createSteps() {
    final List<Widget> steps = <Widget>[];
    final double widthOfStep =
        (width - ((stepCount - 1) * padding)) / stepCount;
    for (int index = 1; index <= stepCount; index++) {
      final ProgressStepWithChevron step = ProgressStepWithChevron(
        width: widthOfStep,
        defaultColor: color,
        progressColor: progressColor,
        wasCompleted: index <= currentStep,
      );
      if (onClick != null) {
        steps.add(
          GestureDetector(
            child: step,
            onTap: () {
              onClick?.call(index);
            },
          ),
        );
      } else {
        steps.add(step);
      }
    }
    return steps;
  }

  List<Widget> _invokeBuilder() {
    final List<Widget> steps = <Widget>[];
    for (int index = 1; index <= stepCount; index++) {
      steps.add(builder!.call(index));
    }
    return steps;
  }
}
