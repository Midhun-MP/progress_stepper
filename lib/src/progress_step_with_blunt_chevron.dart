import 'package:flutter/material.dart';

import 'clippers/chevron_blunt_clipper.dart';

class ProgressStepWithBluntChevron extends StatelessWidget {
  const ProgressStepWithBluntChevron({
    required double width,
    required Color defaultColor,
    required Color progressColor,
    required bool wasCompleted,
    Widget? child,
    Key? key,
  })  : _width = width,
        _defaultColor = defaultColor,
        _progressColor = progressColor,
        _wasCompleted = wasCompleted,
        _child = child,
        super(key: key);

  final double _width;
  final Color _defaultColor;
  final Color _progressColor;
  final bool _wasCompleted;
  final Widget? _child;

  @override
  Widget build(BuildContext context) => ClipPath(
        clipper: ChevronBluntClipper(),
        child: Container(
          width: _width,
          color: _wasCompleted ? _progressColor : _defaultColor,
          child: _child ?? Container(),
        ),
      );
}
