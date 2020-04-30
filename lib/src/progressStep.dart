import 'package:flutter/material.dart';
import 'package:progress_stepper/src/clippers/breadCrumbClipper.dart';

class ProgressStep extends StatelessWidget {
  final double _width;
  final Color _defaultColor;
  final Color _progressColor;
  final bool _wasCompleted;

  ProgressStep(
      {Key key,
      @required double width,
      Color defaultColor,
      Color progressColor,
      bool wasCompleted})
      : this._width = width,
        this._defaultColor = defaultColor,
        this._progressColor = progressColor,
        this._wasCompleted = wasCompleted,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
          width: this._width,
          color: _wasCompleted ? this._progressColor : this._defaultColor),
      clipper: BreadCrumbClipper(),
    );
  }
}
