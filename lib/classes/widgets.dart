import 'package:flutter/material.dart' hide OutlinedButton;
import 'package:utilities/constants/enums.dart';
import 'package:utilities/constants/library_colors.dart';
import 'package:utilities/helpers/widgets/buttons/border_button.dart';
import 'package:utilities/helpers/widgets/buttons/circular_progress_button.dart';
import 'package:utilities/helpers/widgets/buttons/custom_button_with_icon.dart';
import 'package:utilities/helpers/widgets/buttons/gradient_button.dart';
import 'package:utilities/helpers/widgets/buttons/notification_icon_button.dart';
import 'package:utilities/helpers/widgets/input_field.dart';
import 'package:utilities/helpers/widgets/linear_progress_percent_bar.dart';
import 'package:utilities/helpers/widgets/loading_widget.dart';
import 'package:utilities/helpers/widgets/notification_status_card.dart';

class Widgets {
  Widget borderButton(
          {required String text,
          required Function onPressed,
          double? width,
          Color? borderColor,
          Color? borderColorPressed,
          Color? backgroundColor,
          AlignmentGeometry? alignment}) =>
      BorderButton(
          text: text,
          onPressed: onPressed,
          width: width ?? 350,
          borderColor: borderColor ?? LibColors.greyish,
          borderColorPressed: borderColorPressed,
          backgroundColor: backgroundColor ?? Colors.transparent,
          alignment: alignment ?? Alignment.centerLeft);

  Widget circularProgressWithButton(
          {Icon? icon,
          Image? imageAsIcon,
          required double progress,
          Function()? onPressed,
          required Color color,
          bool? isContinuousLoading}) =>
      CircularProgressWithButton(
          progress: progress,
          color: color,
          onPressed: onPressed,
          icon: icon,
          imageAsIcon: imageAsIcon,
          isContinuousLoading: isContinuousLoading);

  Widget customButtonWithIcon(
          {Widget? icon,
          required String text,
          bool? isLoading,
          Function()? onPressed,
          Color? backgroundColor,
          TextStyle? textStyle,
          UtilsLoadingAnimationType? loadingAnimationType,
          Color? loadingAnimationColor,
          double? loadingAnimationSize,
          Color? loadingAnimationSecondaryColor,
          Color? loadingAnimationTeriaryColor}) =>
      CustomButtonWithIcon(
          icon: icon,
          text: text,
          isLoading: isLoading ?? false,
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          textStyle: textStyle,
          loadingAnimationType: loadingAnimationType,
          loadingAnimationColor: loadingAnimationColor,
          loadingAnimationSize: loadingAnimationSize,
          loadingAnimationSecondaryColor: loadingAnimationSecondaryColor,
          loadingAnimationTeriaryColor: loadingAnimationTeriaryColor);

  Widget gradientButton(
          {required String text,
          required Function onPressed,
          double? width,
          double? height,
          bool? useNegative,
          TextStyle? textStyle,
          LinearGradient? customGradient,
          double? borderRadius}) =>
      GradientButton(
          text: text,
          onPressed: onPressed,
          width: width ?? 350,
          height: height ?? 45,
          useNegative: useNegative ?? false,
          customGradient: customGradient,
          textStyle: textStyle,
          borderRadius: borderRadius);

  Widget notificationIconButton(
          {required bool hasNotif,
          required Color backgroundColor,
          required Function() onClick,
          Widget? customIcon,
          Color? imageColor}) =>
      NotificationIconButton(
          hasNotif: hasNotif,
          backgroundColor: backgroundColor,
          onClick: onClick,
          customIcon: customIcon,
          imageColor: imageColor);

  Widget inputField(
          {double? width,
          TextEditingController? controller,
          TextInputAction? textInputAction,
          TextInputType? keyboardType,
          bool? isEnabled,
          bool? isWarning,
          String? hintText,
          String? autofillHint,
          Widget? suffixIcon,
          bool? obscureText,
          FocusNode? focusNode,
          Color? fillColor,
          Color? borderColor}) =>
      InputField(
          width: width ?? 350,
          controller: controller,
          textInputAction: textInputAction ?? TextInputAction.next,
          keyboardType: keyboardType ?? TextInputType.text,
          isEnabled: isEnabled ?? true,
          isWarning: isWarning ?? false,
          hintText: hintText ?? "Input Text",
          autofillHint: autofillHint,
          suffixIcon: suffixIcon,
          obscureText: obscureText ?? false,
          focusNode: focusNode,
          fillColor: fillColor ?? Colors.transparent,
          borderColor: borderColor);

  Widget linearProgressPercentBar(
          {final Color? filledColor,
          final Color? borderColor,
          Color? emptyColor,
          required double width,

          /// The progress of the progress bar. It should be a value between 0 and 1
          required double progress}) =>
      LinearProgressPercentBar(
          progress: progress, width: width, filledColor: filledColor, borderColor: borderColor, emptyColor: emptyColor);

  /// secondaryColor and tertiaryColor are only used in [UtilsLoadingAnimationType.discreteCircular]
  /// waveDots: https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/waveDots.gif
  /// inkDrop: https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/inkDrop.gif
  /// staggeredDotsWave: https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/staggeredDotsWave.gif
  /// discreteCircular: https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/discreteCircular.gif
  /// threeArchedCircle: https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/threeArchedCircle.gif
  /// hexagonDots: https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/hexagonDots.gif
  /// beat: https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/beat.gif
  /// dotsTriangle: https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/dotsTriangle.gif
  Widget loadingWidget(
          {UtilsLoadingAnimationType? type,
          Color? color,
          double? size,

          /// secondaryColor and tertiaryColor are only used in [UtilsLoadingAnimationType.discreteCircular]
          Color? secondaryColor,

          /// secondaryColor and tertiaryColor are only used in [UtilsLoadingAnimationType.discreteCircular]
          Color? tertiaryColor}) =>
      LoadingWidget(type: type, color: color, size: size, secondaryColor: secondaryColor, tertiaryColor: tertiaryColor);

  Widget notificationStatusCard(
          {
          /// positive, negative, info, warning
          required UtilsNotificationStatusType type,
          required String title,
          required String message,
          String? extraInfo,
          double? width,
          Color? backgroundColor,
          Color? textColor}) =>
      NotificationStatusCard(
          type: type,
          title: title,
          message: message,
          extraInfo: extraInfo,
          width: width,
          backgroundColor: backgroundColor,
          textColor: textColor);
}
