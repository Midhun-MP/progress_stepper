import 'package:flutter/material.dart';
import 'package:progress_stepper/progress_stepper.dart';

class BluntStepperDemoWidget extends StatefulWidget {
  const BluntStepperDemoWidget({super.key});

  @override
  State<BluntStepperDemoWidget> createState() =>
      _BluntStepperDemoWidgetState();
}

class _BluntStepperDemoWidgetState extends State<BluntStepperDemoWidget> {
  int _bluntStepperCounter = 0;

  void _incrementChevronStepper() {
    setState(() {
      if (_bluntStepperCounter != 5) {
        _bluntStepperCounter++;
      }
    });
  }

  void _decrementChevronStepper() {
    setState(() {
      if (_bluntStepperCounter != 0) {
        _bluntStepperCounter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProgressStepper(
          width: 300,
          height: 20,
          padding: 0,
          currentStep: _bluntStepperCounter,
          bluntHead: true,
          bluntTail: true,
          color: Colors.grey,
          progressColor: Colors.deepPurple,
          onClick: (int index) {
            setState(() {
              _bluntStepperCounter = index;
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
