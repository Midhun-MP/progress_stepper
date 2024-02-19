import 'package:flutter/material.dart';

import '../../progress_stepper.dart';

enum StepType {
  arrow,
  chevron,
  chevronBlunt,
}

mixin StepFactory {
  Widget createStep(StepType type, Color color, Color progressColor, bool hasCompleted,
      double width) {
    switch (type) {
      case StepType.arrow:
        return ProgressStepWithArrow(
          width: width,
          defaultColor: color,
          progressColor: progressColor,
          wasCompleted: hasCompleted,
        );
      case StepType.chevron:
        return ProgressStepWithChevron(
          width: width,
          defaultColor: color,
          progressColor: progressColor,
          wasCompleted: hasCompleted,
        );
      case StepType.chevronBlunt:
        return ProgressStepWithBluntChevron(
          width: width,
          defaultColor: color,
          progressColor: progressColor,
          wasCompleted: hasCompleted,
        );
    }
  }

  StepType getStepType(int index, bool bluntTail, bool bluntHead, int stepCount) {
    if (index == 1 && bluntTail) {
      return StepType.arrow;
    } else if (index == stepCount && bluntHead) {
      return StepType.chevronBlunt;
    } else {
      return StepType.chevron;
    }
  }
}
