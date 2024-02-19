import 'package:flutter/material.dart';

import '../../progress_stepper.dart';

enum StepType {
  arrow,
  chevron,
  chevronBlunt,
}

mixin StepFactory {
  Widget createStep(
      StepType type,
      Color color,
      Color progressColor,
      bool hasCompleted,
      double width,
      double height,
      Color borderColor,
      double borderWidth) {
    switch (type) {
      case StepType.arrow:
        return ProgressStepWithArrow(
          width: width,
          height: height,
          defaultColor: color,
          progressColor: progressColor,
          borderColor: borderColor,
          borderWidth: borderWidth,
          wasCompleted: hasCompleted,
        );
      case StepType.chevron:
        return ProgressStepWithChevron(
          width: width,
          height: height,
          defaultColor: color,
          progressColor: progressColor,
          borderColor: borderColor,
          borderWidth: borderWidth,
          wasCompleted: hasCompleted,
        );
      case StepType.chevronBlunt:
        return ProgressStepWithBluntChevron(
          width: width,
          height: height,
          defaultColor: color,
          progressColor: progressColor,
          borderColor: borderColor,
          borderWidth: borderWidth,
          wasCompleted: hasCompleted,
        );
    }
  }

  StepType getStepType(
      int index, bool bluntTail, bool bluntHead, int stepCount) {
    if (index == 1 && bluntTail) {
      return StepType.arrow;
    } else if (index == stepCount && bluntHead) {
      return StepType.chevronBlunt;
    } else {
      return StepType.chevron;
    }
  }
}
