import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:utilities/constants/enums.dart';

/// secondaryColor and tertiaryColor are only used in [SKLoadingAnimationType.discreteCircular]
/// waveDots: https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/waveDots.gif
/// inkDrop: https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/inkDrop.gif
/// staggeredDotsWave: https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/staggeredDotsWave.gif
/// discreteCircular: https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/discreteCircular.gif
/// threeArchedCircle: https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/threeArchedCircle.gif
/// hexagonDots: https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/hexagonDots.gif
/// beat: https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/beat.gif
/// dotsTriangle: https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/dotsTriangle.gif
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.type, this.color, this.size, this.secondaryColor, this.tertiaryColor});

  final SKLoadingAnimationType? type;
  final Color? color;
  final double? size;
  final Color? secondaryColor;
  final Color? tertiaryColor;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: _getAnimationWidget(context,
            type: type, color: color, size: size, secondaryColor: secondaryColor, tertiaryColor: tertiaryColor));
  }

  Widget _getAnimationWidget(BuildContext context,
      {SKLoadingAnimationType? type, Color? color, double? size, Color? secondaryColor, Color? tertiaryColor}) {
    type ??= SKLoadingAnimationType.staggeredDotsWave;
    color ??= Theme.of(context).colorScheme.onTertiaryContainer;
    size ??= 25;

    switch (type) {
      case SKLoadingAnimationType.waveDots:
        return LoadingAnimationWidget.waveDots(color: color, size: size);
      case SKLoadingAnimationType.inkDrop:
        return LoadingAnimationWidget.inkDrop(color: color, size: size);
      case SKLoadingAnimationType.staggeredDotsWave:
        return LoadingAnimationWidget.staggeredDotsWave(color: color, size: size);
      case SKLoadingAnimationType.discreteCircular:
        return LoadingAnimationWidget.discreteCircle(
            color: color,
            size: size,
            secondRingColor: secondaryColor ?? Colors.teal,
            thirdRingColor: tertiaryColor ?? Colors.orange);
      case SKLoadingAnimationType.threeArchedCircle:
        return LoadingAnimationWidget.threeArchedCircle(color: color, size: size);
      case SKLoadingAnimationType.hexagonDots:
        return LoadingAnimationWidget.hexagonDots(color: color, size: size);
      case SKLoadingAnimationType.beat:
        return LoadingAnimationWidget.beat(color: color, size: size);
      case SKLoadingAnimationType.dotsTriangle:
        return LoadingAnimationWidget.dotsTriangle(color: color, size: size);
      default:
        return LoadingAnimationWidget.staggeredDotsWave(color: color, size: size);
    }
  }
}
