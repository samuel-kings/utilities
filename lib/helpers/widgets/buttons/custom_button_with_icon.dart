import 'package:flutter/material.dart';
import 'package:sk_utilities/constants/enums.dart';
import 'package:sk_utilities/helpers/widgets/loading_widget.dart';

// an elevated button with an icon and text replaced with a loading indicator when loading
class CustomButtonWithIcon extends StatelessWidget {
  final Widget? icon;
  final String text;
  final bool? isLoading;
  final Function()? onPressed;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final SKLoadingAnimationType? loadingAnimationType;
  final Color? loadingAnimationColor;
  final double? loadingAnimationSize;
  final Color? loadingAnimationSecondaryColor;
  final Color? loadingAnimationTeriaryColor;

  const CustomButtonWithIcon(
      {super.key,
      this.icon,
      required this.text,
      this.isLoading,
      this.onPressed,
      this.backgroundColor,
      this.textStyle,
      this.loadingAnimationType,
      this.loadingAnimationColor,
      this.loadingAnimationSize,
      this.loadingAnimationSecondaryColor,
      this.loadingAnimationTeriaryColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          fixedSize: const Size(double.infinity, 45),
          backgroundColor: backgroundColor),
      child: isLoading!
          ? LoadingWidget(
              type: loadingAnimationType,
              color: loadingAnimationColor,
              secondaryColor: loadingAnimationSecondaryColor,
              tertiaryColor: loadingAnimationTeriaryColor,
              size: loadingAnimationSize,
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null)
                  Row(
                    children: [
                      icon!,
                      const SizedBox(width: 8),
                    ],
                  ),
                Text(text, style: textStyle ?? Theme.of(context).textTheme.titleMedium),
              ],
            ),
    );
  }
}
