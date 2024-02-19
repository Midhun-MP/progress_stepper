import 'package:flutter/material.dart';
import '../progress_stepper.dart';
import 'shape/chevron_crumb.dart';

class ProgressStepWithChevron extends StatelessWidget with Chevron {
  const ProgressStepWithChevron({
    required double width,
    required double height,
    required Color defaultColor,
    required Color progressColor,
    Color borderColor = Colors.black,
    double borderWidth = 0.0,
    required bool wasCompleted,
    Widget? child,
    Key? key,
  })  : _width = width,
        _height = height,
        _defaultColor = defaultColor,
        _progressColor = progressColor,
        _borderColor = borderColor,
        _borderWidth = borderWidth,
        _wasCompleted = wasCompleted,
        _child = child,
        super(key: key);

  final double _width;
  final double _height;
  final Color _defaultColor;
  final Color _progressColor;
  final Color _borderColor;
  final double _borderWidth;
  final bool _wasCompleted;
  final Widget? _child;

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: StepShapePainter(
          path: getChevronPath(Size(_width, _height)),
          fillColor: _wasCompleted ? _progressColor : _defaultColor,
          borderColor: _borderColor,
          borderWidth: _borderWidth,
        ),
        child: _child,
      );
}
