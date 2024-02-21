# progress_stepper

This package can be used to create custom stepper.

## Main Classes

| Class                                                                          | Description                                                    |
|--------------------------------------------------------------------------------|----------------------------------------------------------------|
| [ProgressStepper](lib/src/progress_stepper.dart)                               | You have to initialise this class to create the custom stepper |
| [ProgressStepWithChevron](lib/src/progress_step_with_chevron.dart)             | Custom step with the shape of an arrow                         |
| [ProgressStepWithArrow](lib/src/progress_step_with_arrow.dart)                 | Custom step with the shape of chevron                          |
| [ProgressStepWithBluntChevron](lib/src/progress_step_with_blunt_chevron.dart)  | Custom step with the shape of chevron, without pointed head    |

## Usage

You can use this control in two ways:

### Method 1

You just need to initialise the ProgressStepper with required values, it will create a default
progress step with chevron type.

```@dart
ProgressStepper(
   width: 300,
   currentStep: 1,
)
```

The above code will create a stepper as shown below:

![Default Stepper](example/assets/default.png)

---

#### Stepper with both end blunt

```@dart
ProgressStepper(
   width: 300,
   height: 20,
   padding: 1,
   currentStep: 1,
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
      color: Colors.white,
      fontWeight: FontWeight.bold,
   ),         
)
```
Which will result in:

![Blunt Stepper](example/assets/blunt.png)

### Method 2

You can use the builder to return your own custom step or use the provided steps as you need.

```@dart
ProgressStepper(
   width: 200,
   height: 25,
   stepCount: 3,
   builder: (int index, double widthOfStep) {
      if (index == 1) {
         return ProgressStepWithArrow(
            width: widthOfStep,
            height: 25,
            defaultColor: Colors.red,
            progressColor: Colors.green,
            borderWidth: 1,
            wasCompleted: true,
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
         height: 25,
         defaultColor: Colors.red,
         progressColor: Colors.green,
         borderWidth: 1,
         wasCompleted: false,
         child: Center(
            child: Text(
               index.toString(),
               textAlign: TextAlign.center,
               style: const TextStyle(
                  color: Colors.white,
               ),
            ),
         ),
      );
   },
)
```

The above code will create a stepper as shown below:

![Default Stepper](example/assets/custom.png)