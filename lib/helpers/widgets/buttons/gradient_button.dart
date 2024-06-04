import 'package:flutter/material.dart';
import 'package:utilities/constants/library_colors.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final double? width;
  final double? height;
  final bool? useNegative;
  final TextStyle? textStyle;
  final LinearGradient? customGradient;
  final double? borderRadius;
  const GradientButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.width,
      this.useNegative,
      this.customGradient,
      this.textStyle,
      this.height,
      this.borderRadius});

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
            if (customGradient != null) {
              gradient.value = LinearGradient(colors: [
                customGradient!.colors.first.withOpacity(0.8),
                customGradient!.colors.last.withOpacity(0.8)
              ]);

              Future.delayed(const Duration(milliseconds: 200), () {
                gradient.value = customGradient!;
              });
            }

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
            height: height,
            width: width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
                gradient: gradient.value,
                boxShadow: [
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
