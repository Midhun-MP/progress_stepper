import 'package:flutter/material.dart';

import '../progress_stepper.dart';

typedef ProgressStepperBuilder = Widget Function(int index);
typedef ProgressStepperOnClick = void Function(int index);

class ProgressStepper extends StatelessWidget {
  ProgressStepper({
    required this.width,
    this.height = 10,
    this.padding = 2,
    this.stepCount = 5,
    this.currentStep = 0,
    this.color = const Color(0xFFCECECF),
    this.progressColor = const Color(0xFFFBB040),
    this.bluntHead = false,
    this.bluntTail = false,
    this.builder,
    this.onClick,
    super.key,
  }): assert(padding >= 0);

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

  /// Whether to blunt the last stepper (head)
  /// If this value is true, it will use [ProgressStepWithBluntChevron]
  /// Default value is false
  final bool bluntHead;

  /// Whether to blunt the first stepper (tail)
  /// If this value is true, it will use [ProgressStepWithArrow}
  /// Default value is false
  final bool bluntTail;

  /// Currently Selected Step
  /// Default value is 0
  /// Steps value starts from 1
  final int currentStep;

  /// Builder, for customising the stepper further
  final ProgressStepperBuilder? builder;

  /// On click callback
  /// If set, user tap will trigger it and give the index of tapped step
  final ProgressStepperOnClick? onClick;

  double _calculatedPadding = 0;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        height: height,
        child: Stack(
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
    _calculatePadding();
    final List<Widget> steps = <Widget>[];
    final double widthOfStep = _getStepWidth();
    for (int index = 1; index <= stepCount; index++) {
      Widget step;
      print(widthOfStep - (widthOfStep * 3.5 / 4));
      if (index == 1 && bluntTail) {

        step = ProgressStepWithArrow(
          width: widthOfStep,
          defaultColor: color,
          progressColor: progressColor,
          wasCompleted: index <= currentStep,
        );
      } else if (index == stepCount && bluntHead) {
        step = ProgressStepWithBluntChevron(
          width: widthOfStep,
          defaultColor: color,
          progressColor: progressColor,
          wasCompleted: index <= currentStep,
        );
      } else {
        step = ProgressStepWithChevron(
          width: widthOfStep,
          defaultColor: color,
          progressColor: progressColor,
          wasCompleted: index <= currentStep,
        );
      }

      if (onClick != null) {
        steps.add(
          Positioned(
            left: _getPosition(index),
            bottom: 0,
            top: 0,
            child: GestureDetector(
              onTap: () {
                onClick?.call(index);
              },
              child: step,
            ),
          ),
        );
      } else {
        steps.add(Positioned(
          left: _getPosition(index),
          bottom: 0,
          top: 0,
        child: step,
        ),
        );
      }
    }
    return steps;
  }

  List<Widget> _invokeBuilder() {
    final List<Widget> steps = <Widget>[];
    for (int index = 1; index <= stepCount; index++) {
      steps.add(builder!.call(index));
    }
    return [Row(children: steps,)];
  }

  double _getStepWidth() => (width - ((stepCount - 1) * padding)) / stepCount;

  double _getPosition(int index) {
    if (index == 1) {
      return 0.0;
    }
    return (index - 1) * _getStepWidth() + _calculatedPadding * (index - 1);
  }

  void _calculatePadding() {
    final double widthOfStep = _getStepWidth();
    _calculatedPadding = padding - (widthOfStep - (widthOfStep * 3.5 / 4));
  }
}
