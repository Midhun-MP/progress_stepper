import 'package:example/chevron_stepper_demo.dart';
import 'package:flutter/material.dart';
import 'package:progress_stepper/progress_stepper.dart';

import 'blunt_stepper_demo.dart';
import 'custom_stepper_demo.dart';

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
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ChevronStepperDemoWidget(),
              Divider(),
              SizedBox(
                height: 10,
              ),
              CustomStepperDemoWidget(),
              Divider(),
              SizedBox(
                height: 10,
              ),
              BluntStepperDemoWidget(),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
}
