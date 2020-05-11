import 'package:flutter/material.dart';

import 'clippers/arrowClipper.dart';

class ProgressStepWithArrow extends StatelessWidget {
  final double _width;
  final Color _defaultColor;
  final Color _progressColor;
  final bool _wasCompleted;

  const ProgressStepWithArrow({
    @required double width,
    @required Color defaultColor,
    @required Color progressColor,
    @required bool wasCompleted,
    Key key,
  })  : this._width = width,
        this._defaultColor = defaultColor,
        this._progressColor = progressColor,
        this._wasCompleted = wasCompleted,
        super(key: key);

  @override
  Widget build(BuildContext context) => ClipPath(
      child: Container(
          width: this._width,
          color: _wasCompleted ? this._progressColor : this._defaultColor),
      clipper: ArrowClipper(),
    );
}
