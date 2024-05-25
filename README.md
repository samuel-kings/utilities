# Utilities
A starter pack for new projects containing a collection of functions, utilities and tools that I find useful and re-use across many projects. This is a work in progress and will be updated as I find new tools or utilities that I find useful.
P.S: 

## Demo
![Demo video displaying the utilities](https://cloud.appwrite.io/v1/storage/buckets/665110730038befbd5f5/files/665110940013e5b4826f/view?project=658ef43bce600d3e35ee&mode=admin)

## Getting Started

Add package to pubspec.yaml
```
utilities:
    git:
      url: https://github.com/Performerslink/utilities.git
      ref: main
```

Import the package
```import 'package:utilities/utilities.dart';```

## Usage
```
    final functions = Utilities.functions;
    final dialogs = MyUtilities.dialogs;
    final widgets = MyUtilities.widgets;
    final spacing = MyUtilities.spacing;
```

### Functions
* bad words
* change web page title
* compress  image... this reduces the size and quality of the image. Can return a Uint8List or a File
* date and time formatters
* an instance of pre-configured [flutter_secure_storage]((https://pub.dev/packages/flutter_secure_storage))
* code generator: useful for generating random strings characters for passwords, tokens, IDs, etc. Length is optional, default is 6


### Dialogs
* no internet connection dialog
* snackbar with title (custom built)
* snackbar using [animated_snack_bar](https://pub.dev/packages/animated_snackbar)
* toast snackbar using [toastification](https://pub.dev/packages/toastification)

### widgets
* BorderButton
* NotificationStatusCard
* LinearProgressPercentBar
* GradientButton
* CircularProgressWithButton
* InputField
* NotificationIconButton
* CustomButtonWithIcon
* LoadingWidget, 8 types based on the [loading_animation_widget](https://pub.dev/packages/loading_animation_widget) package

waveDots
![waveDots](https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/waveDots.gif)

inkDrop
![inkDrop](https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/inkDrop.gif)

staggeredDotsWave
![staggeredDotsWave](https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/staggeredDotsWave.gif)

discreteCircular
![discreteCircular](https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/discreteCircular.gif)

threeArchedCircle
![threeArchedCircle](https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/threeArchedCircle.gif)

hexagonDots
![hexagonDots](https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/hexagonDots.gif)

beat
![beat](https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/beat.gif)

dotsTriangle
![dotsTriangle](https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/dotsTriangle.gif)