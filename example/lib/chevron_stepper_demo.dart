import 'package:flutter/material.dart';
import 'package:progress_stepper/progress_stepper.dart';

class ChevronStepperDemoWidget extends StatefulWidget {
  const ChevronStepperDemoWidget({super.key});

  @override
  State<ChevronStepperDemoWidget> createState() =>
      _ChevronStepperDemoWidgetState();
}

class _ChevronStepperDemoWidgetState extends State<ChevronStepperDemoWidget> {
  int _chevronCounter = 0;

  void _incrementChevronStepper() {
    setState(() {
      if (_chevronCounter != 5) {
        _chevronCounter++;
      }
    });
  }

  void _decrementChevronStepper() {
    setState(() {
      if (_chevronCounter != 0) {
        _chevronCounter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProgressStepper(
          width: 300,
          currentStep: _chevronCounter,
          onClick: (int index) {
            setState(() {
              _chevronCounter = index;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: _decrementChevronStepper,
              child: const Text(
                '-1',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            OutlinedButton(
              onPressed: _incrementChevronStepper,
              child: const Text(
                '+1',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
