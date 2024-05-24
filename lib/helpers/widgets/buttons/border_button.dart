import 'package:flutter/material.dart';

class BorderButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final double? width;
  final Color? borderColor;
  final Color? borderColorPressed;
  final Color? backgroundColor;
  final AlignmentGeometry? alignment;
  const BorderButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.width,
      this.borderColor,
      this.borderColorPressed,
      this.backgroundColor,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    Color pressedBorderColor = borderColorPressed ?? Theme.of(context).primaryColor;
    final ValueNotifier<bool> isPressed = ValueNotifier(false);

    return ValueListenableBuilder(
      valueListenable: isPressed,
      builder: (context, value, child) {
        return InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            // change the gradient to the third one for the pressed one second
            isPressed.value = true;
            Future.delayed(const Duration(milliseconds: 200), () {
              isPressed.value = false;
            });

            onPressed();
          },
          child: Container(
            height: 45,
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: backgroundColor,
                border: Border.all(
                  color: isPressed.value ? pressedBorderColor : borderColor ?? Theme.of(context).primaryColor,
                  width: 1,
                )),
            child: Align(alignment: alignment!, child: Text(text, style: Theme.of(context).textTheme.titleMedium)),
          ),
        );
      },
    );
  }
}
