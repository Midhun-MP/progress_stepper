# progress_stepper

This package can be used to create custom stepper.

## Main Classes

Class | Description |
--- | --- |
[ProgressStepper](lib/src/progress_stepper.dart) | You have to initialise this class to create the custom stepper |
[ProgressStepWithChevron](lib/src/progress_step_with_chevron.dart) | Custom step with the shape of an arrow
[ProgressStepWithArrow](lib/src/progress_step_with_arrow.dart) | Custom step with the shape of chevron

## Usage

You can use this control in two ways:

### Method 1

You just need to initialise the ProgressStepper with required values, it will create a default
progress step with chevron type.

```
ProgressStepper(
   width: 300,
   currentStep: 1,
)
```

The above code will create a stepper as shown below:

![Default Stepper](example/assets/default.png)

### Method 2

You can use the builder to return your own custom step or use the provided steps as you need.

```
ProgressStepper(                              
   width: 200,
   height: 25,
   color: Colors.red,
   progressColor: Colors.green,
   stepCount: 3,
   builder: (index) {
      double widthOfStep = 200 / 3;
      if (index == 1) {
         return ProgressStepWithArrow(
            width: widthOfStep,
            defaultColor: Colors.red,
            progressColor: Colors.green,
            wasCompleted: true,
         );
      }
      return ProgressStepWithChevron(
         width: widthOfStep,
         defaultColor: Colors.red,
         progressColor: Colors.green,
         wasCompleted: false,
      );
   },
)
```

The above code will create a stepper as shown below:

![Default Stepper](example/assets/custom.png)