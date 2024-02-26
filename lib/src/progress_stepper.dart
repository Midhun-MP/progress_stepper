import 'package:flutter/material.dart';

import '../progress_stepper.dart';

typedef ProgressStepperBuilder = Widget Function(
    BuildContext context, int index, double width);
typedef ProgressStepperOnClick = void Function(int index);

class ProgressStepper extends StatelessWidget with StepFactory {
  ProgressStepper({
    required this.width,
    this.height = 10,
    this.padding = 2,
    this.stepCount = 5,
    this.currentStep = 0,
    this.color = const Color(0xFFCECECF),
    this.progressColor = const Color(0xFFFBB040),
    this.borderColor = const Color(0x00FFFFFF),
    this.borderWidth = 0.0,
    this.bluntHead = false,
    this.bluntTail = false,
    this.builder,
    this.labels,
    this.defaultTextStyle,
    this.selectedTextStyle,
    this.onClick,
    super.key,
  })  : assert(padding >= 0),
        assert(labels == null || (labels.length == stepCount)) {
    _calculatedPadding = _calculatePadding();
    _calculatedStepWidth = _getStepWidth();
  }

  /// Active Progress Color
  final Color progressColor;

  /// Progress Color
  final Color color;

  /// Border Color
  /// Default is black color
  final Color borderColor;

  /// Border width
  /// Default is 0
  final double borderWidth;

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

  /// Label to display on each step
  /// Step Count and Label count should match
  final List<String>? labels;

  /// Text style to show to the labels in default state
  final TextStyle? defaultTextStyle;

  /// Text style to show to the labels in selected state
  final TextStyle? selectedTextStyle;

  // Keeps calculated step width
  late final double _calculatedStepWidth;

  // Keeps calculated padding value
  late final double _calculatedPadding;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: _getProgressSteps(context),
        ),
      );

  List<Widget> _getProgressSteps(BuildContext context) {
    if (builder == null) {
      return _createSteps();
    } else {
      return _invokeBuilder(context);
    }
  }

  List<Widget> _createSteps() {
    final List<Widget> steps = <Widget>[];
    final double widthOfStep = _calculatedStepWidth;
    for (int index = 1; index <= stepCount; index++) {
      final StepType type = getStepType(index, bluntTail, bluntHead, stepCount);
      final Widget? child = _getLabelWidget(index - 1, index <= currentStep);
      final Widget step = createStep(
          type,
          color,
          progressColor,
          index <= currentStep,
          widthOfStep,
          height,
          borderColor,
          borderWidth,
          child);
      steps.add(_getStepPositionWidget(index, step));
    }
    return steps;
  }

  List<Widget> _invokeBuilder(BuildContext context) {
    final List<Widget> steps = <Widget>[];
    for (int index = 1; index <= stepCount; index++) {
      final Widget step = builder!.call(context, index, _calculatedStepWidth);
      steps.add(_getStepPositionWidget(index, step));
    }
    return steps;
  }

  double _getStepWidth() =>
      (width - ((stepCount - 1) * _calculatedPadding)) / stepCount;

  double _getPosition(int index) {
    if (index == 1) {
      return 0.0;
    }
    return ((index - 1) * _calculatedStepWidth * 3.5 / 4) +
        (padding * (index - 1));
  }

  double _calculatePadding() {
    final double widthOfStep = width / stepCount;
    return padding - (widthOfStep - (widthOfStep * 3.5 / 4));
  }

  Widget _getStepPositionWidget(int index, Widget step) {
    if (onClick != null) {
      return Positioned(
        left: _getPosition(index),
        bottom: 0,
        top: 0,
        width: _calculatedStepWidth,
        child: GestureDetector(
          onTap: () {
            onClick?.call(index);
          },
          child: SizedBox(width: _calculatedStepWidth, child: step),
        ),
      );
    } else {
      return Positioned(
        left: _getPosition(index),
        bottom: 0,
        top: 0,
        width: _calculatedStepWidth,
        child: SizedBox(width: _calculatedStepWidth, child: step),
      );
    }
  }

  Widget? _getLabelWidget(int index, bool isSelected) {
    if (labels == null) {
      return null;
    }
    final String label = labels![index];
    final Widget widget = Center(
      child: Text(
        label,
        style: isSelected ? selectedTextStyle : defaultTextStyle,
      ),
    );
    return widget;
  }
}
