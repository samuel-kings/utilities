import 'package:flutter/material.dart';
import 'package:sk_utilities/constants/library_colors.dart';

class InputField extends StatelessWidget {
  final double? width;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool? isEnabled;
  final bool? isWarning;
  final String? hintText;
  final String? autofillHint;
  final Widget? suffixIcon;
  final bool? obscureText;
  final FocusNode? focusNode;
  final Color? fillColor;
  final Color? borderColor;
  const InputField(
      {super.key,
      this.width,
      this.controller,
      this.textInputAction,
      this.keyboardType,
      this.isEnabled,
      this.isWarning,
      this.hintText,
      this.autofillHint,
      this.suffixIcon,
      this.obscureText,
      this.focusNode,
      this.fillColor,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: width,
      child: TextFormField(
        controller: controller,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        enabled: isEnabled,
        textAlign: TextAlign.left,
        obscureText: obscureText!,
        focusNode: focusNode,
        autofillHints: [autofillHint ?? ""],
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: isWarning! ? LibColors.mainRed : null),
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          hintText: hintText,
          hintStyle:
              Theme.of(context).textTheme.bodyMedium?.copyWith(color: isWarning! ? LibColors.mainRed : Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: isWarning!
                  ? LibColors.mainRed
                  : isEnabled!
                      ? borderColor ?? Theme.of(context).colorScheme.primary
                      : Colors.grey,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: isWarning!
                  ? LibColors.mainRed
                  : isEnabled!
                      ? borderColor ?? Theme.of(context).colorScheme.primary
                      : Colors.grey,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: isWarning!
                  ? LibColors.mainRed
                  : isEnabled!
                      ? borderColor ?? Theme.of(context).colorScheme.primary
                      : Colors.grey,
              width: 1,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: isWarning!
                  ? LibColors.mainRed
                  : isEnabled!
                      ? borderColor ?? Theme.of(context).colorScheme.primary
                      : Colors.grey,
              width: 1,
            ),
          ),
          suffixIconConstraints: const BoxConstraints(minHeight: 20, minWidth: 20),
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.symmetric(horizontal: 25),
        ),
      ),
    );
  }
}
