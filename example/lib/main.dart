import 'package:flutter/material.dart';
import 'package:progress_stepper/progress_stepper.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Progress Stepper Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Progress Stepper'),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _chevronCounter = 0;
  int _customCounter = 0;

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
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
              const SizedBox(
                height: 10,
              ),
              ProgressStepper(
                width: 200,
                height: 25,
                stepCount: 3,
                builder: (int index) {
                  const double widthOfStep = 200.0 / 3.0;
                  if (index == 1) {
                    return ProgressStepWithArrow(
                      width: widthOfStep,
                      defaultColor: Colors.red,
                      progressColor: Colors.green,
                      wasCompleted: _customCounter >= index,
                      child: Center(
                        child: Text(
                          index.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }
                  return ProgressStepWithChevron(
                    width: widthOfStep,
                    defaultColor: Colors.red,
                    progressColor: Colors.green,
                    wasCompleted: _customCounter >= index,
                    child: Center(
                      child: Text(
                        index.toString(),
                        style: const TextStyle(
                          color: Colors.white,
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
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
}
