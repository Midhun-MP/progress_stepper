import 'package:flutter/material.dart';
import 'package:progress_stepper/progress_stepper.dart';

class CustomStepperDemoWidget extends StatefulWidget {
  const CustomStepperDemoWidget({super.key});

  @override
  State<CustomStepperDemoWidget> createState() =>
      _CustomStepperDemoWidgetState();
}

class _CustomStepperDemoWidgetState extends State<CustomStepperDemoWidget> {
  int _customCounter = 0;

  void _incrementCustomStepper() {
    setState(() {
      if (_customCounter != 3) {
        _customCounter++;
      }
    });
  }

  void _decrementCustomStepper() {
    setState(() {
      if (_customCounter != 0) {
        _customCounter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProgressStepper(
          width: 200,
          height: 25,
          stepCount: 3,
          padding: 2,
          builder: (int index, double widthOfStep) {
            if (index == 1) {
              return ProgressStepWithArrow(
                width: widthOfStep,
                height: 25,
                defaultColor: Colors.red,
                progressColor: Colors.green,
                borderWidth: 1,
                wasCompleted: _customCounter >= index,
                child: SizedBox(
                  width: widthOfStep,
                  child: Center(
                    child: Text(
                      index.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            }
            return ProgressStepWithChevron(
              width: widthOfStep,
              height: 25,
              defaultColor: Colors.red,
              progressColor: Colors.green,
              borderWidth: 1,
              wasCompleted: _customCounter >= index,
              child: SizedBox(
                width: widthOfStep,
                child: Center(
                  child: Text(
                    index.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: _decrementCustomStepper,
              child: const Text(
                '-1',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            OutlinedButton(
              onPressed: _incrementCustomStepper,
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
