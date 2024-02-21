import 'package:flutter/material.dart';
import 'package:progress_stepper/progress_stepper.dart';

class BluntStepperDemoWidget extends StatefulWidget {
  const BluntStepperDemoWidget({super.key});

  @override
  State<BluntStepperDemoWidget> createState() => _BluntStepperDemoWidgetState();
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProgressStepper(
            width: MediaQuery.of(context).size.width,
            height: 20,
            padding: 1,
            currentStep: _bluntStepperCounter,
            bluntHead: true,
            bluntTail: true,
            color: Colors.grey,
            progressColor: Colors.deepPurple,
            labels: const <String>['A', 'B', 'C', 'D', 'E'],
            defaultTextStyle: const TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.w500,
            ),
            selectedTextStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            onClick: (int index) {
              setState(() {
                _bluntStepperCounter = index;
              });
            },
          ),
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
