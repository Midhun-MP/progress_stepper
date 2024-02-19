import 'package:flutter/material.dart';
import '../progress_stepper.dart';
import 'shape/arrow.dart';

class ProgressStepWithArrow extends StatelessWidget with ArrowShape {
  const ProgressStepWithArrow({
    required double width,
    required double height,
    required Color defaultColor,
    required Color progressColor,
    required bool wasCompleted,
    Color borderColor = Colors.black,
    double borderWidth = 0.0,
    Widget? child,
    Key? key,
  })  : _width = width,
        _height = height,
        _defaultColor = defaultColor,
        _progressColor = progressColor,
        _wasCompleted = wasCompleted,
        _borderColor = borderColor,
        _borderWidth = borderWidth,
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
  painter:
  StepShapePainter(
        path: getArrowPath(Size(_width, _height)),
        fillColor: _wasCompleted ? _progressColor : _defaultColor,
        borderColor: _borderColor,
        borderWidth: _borderWidth,
      ),
    child: _child,
  );
}
