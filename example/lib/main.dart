import 'package:flutter/material.dart';
import 'package:progress_stepper/progress_stepper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Progress Stepper Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Progress Stepper'),
    );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementStepper() {
    setState(() {
      _counter++;
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
              height: 10,
              padding: 2,
              currentStep: _counter,
              onClick: (index) {
                setState(() {
                  _counter = index;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            ProgressStepper(
              width: 200,
              height: 25,
              stepCount: 3,
              builder: (index) {
                double widthOfStep = 200 / 3;
                if (index == 1) {
                  return ProgressStepWithArrow(
                    width: widthOfStep,
                    defaultColor: Colors.red,
                    progressColor: Colors.green,
                    wasCompleted: _counter >= index,
                  );
                }
                  return ProgressStepWithChevron(
                    width: widthOfStep,
                    defaultColor: Colors.red,
                    progressColor: Colors.green,
                    wasCompleted: _counter >= index,
                  );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementStepper,
        tooltip: 'Increment Stepper',
        child: Icon(Icons.plus_one),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
}
