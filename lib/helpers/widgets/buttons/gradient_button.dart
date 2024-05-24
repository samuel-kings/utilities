import 'package:flutter/material.dart';
import 'package:sk_utilities/constants/library_colors.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final double? width;
  final bool? useNegative;
  final TextStyle? textStyle;
  final LinearGradient? customGradient;
  const GradientButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.width,
      this.useNegative,
      this.customGradient,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<LinearGradient> gradient = ValueNotifier(useNegative!
        ? LibColors.negGradient
        : customGradient != null
            ? customGradient!
            : LibColors.mainGradient);

    return ValueListenableBuilder(
      valueListenable: gradient,
      builder: (context, value, child) {
        return InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            if (!useNegative! && customGradient == null) {
              // change the gradient to the third one for the pressed one second
              gradient.value = LibColors.secGradient;
              Future.delayed(const Duration(milliseconds: 200), () {
                gradient.value = LibColors.mainGradient;
              });
            }

            onPressed();
          },
          child: Container(
            height: 45,
            width: width,
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), gradient: gradient.value, boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                offset: const Offset(0.0, 10.0),
                blurRadius: 14.0,
              )
            ]),
            child: Text(text, style: textStyle ?? Theme.of(context).textTheme.titleMedium),
          ),
        );
      },
    );
  }
}
