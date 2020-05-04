import 'package:flutter/material.dart';
import 'package:progress_stepper/src/clippers/chevronCrumbClipper.dart';

class ProgressStepWithChevron extends StatelessWidget {
  final double _width;
  final Color _defaultColor;
  final Color _progressColor;
  final bool _wasCompleted;

  ProgressStepWithChevron(
      {Key key,
      @required double width,
      @required Color defaultColor,
      @required Color progressColor,
      @required bool wasCompleted})
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
      clipper: ChevronClipper(),
    );
  }
}
