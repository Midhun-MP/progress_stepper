import 'package:flutter/material.dart';

import 'clippers/chevronCrumbClipper.dart';

class ProgressStepWithChevron extends StatelessWidget {
  final double _width;
  final Color _defaultColor;
  final Color _progressColor;
  final bool _wasCompleted;
  final Widget _child;

  const ProgressStepWithChevron({
    @required double width,
    @required Color defaultColor,
    @required Color progressColor,
    @required bool wasCompleted,
    Widget child,
    Key key,
  })  : this._width = width,
        this._defaultColor = defaultColor,
        this._progressColor = progressColor,
        this._wasCompleted = wasCompleted,
        this._child = child,
        super(key: key);

  @override
  Widget build(BuildContext context) => ClipPath(
        child: Container(
          width: this._width,
          color: _wasCompleted ? this._progressColor : this._defaultColor,
          child: _child ?? Container(),
        ),
        clipper: ChevronClipper(),
      );
}
