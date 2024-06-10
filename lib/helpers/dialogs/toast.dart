import 'package:flutter/material.dart';
import 'package:utilities/constants/enums.dart';
import 'package:toastification/toastification.dart';

void toastSnackbar(
  BuildContext context, {
  AlignmentGeometry? alignment,
  UtilsNotificationStatusType? type,
  UtilsToastificationStyle? style,
  required String title,
  String? description,
  Widget? icon,
  Function()? onTap,
  Color? primaryColor,
  Color? backgroundColor,
  bool? showProgressBar,
  UtilsToastProgressBarTheme? progressBarTheme,
  UtilsCloseButtonShowType? closeButtonShowType,
}) {
  ToastificationType type_ = _getSnackBarType(type ?? UtilsNotificationStatusType.positive);
  ToastificationStyle style_ = _getStyle(style ?? UtilsToastificationStyle.flat);
  CloseButtonShowType closeButtonShowType_ =
      _getCloseButtonShowType(closeButtonShowType ?? UtilsCloseButtonShowType.onHover);

  toastification.show(
      context: context,
      alignment: alignment,
      autoCloseDuration: const Duration(seconds: 5),
      type: type_,
      style: style_,
      icon: icon,
      showProgressBar: showProgressBar ?? true,
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      title: Text(title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: Colors.black)),
      description: description == null
          ? null
          : Text(description, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black)),
      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10)],
      progressBarTheme: progressBarTheme,
      closeButtonShowType: closeButtonShowType_,
      pauseOnHover: true,
      callbacks: ToastificationCallbacks(onTap: (value) {
        if (onTap != null) onTap();
      }));
}

ToastificationType _getSnackBarType(UtilsNotificationStatusType type) {
  switch (type) {
    case UtilsNotificationStatusType.positive:
      return ToastificationType.success;
    case UtilsNotificationStatusType.negative:
      return ToastificationType.error;
    case UtilsNotificationStatusType.info:
      return ToastificationType.info;
    case UtilsNotificationStatusType.warning:
      return ToastificationType.warning;
  }
}

ToastificationStyle _getStyle(UtilsToastificationStyle style) {
  switch (style) {
    case UtilsToastificationStyle.flat:
      return ToastificationStyle.flat;
    case UtilsToastificationStyle.flatColored:
      return ToastificationStyle.flatColored;
    case UtilsToastificationStyle.minimal:
      return ToastificationStyle.minimal;
  }
}

class UtilsToastProgressBarTheme extends ProgressIndicatorThemeData {
  const UtilsToastProgressBarTheme(
      {super.circularTrackColor,
      super.linearTrackColor,
      super.color,
      super.linearMinHeight,
      super.refreshBackgroundColor})
      : super();
}

CloseButtonShowType _getCloseButtonShowType(UtilsCloseButtonShowType type) {
  switch (type) {
    case UtilsCloseButtonShowType.always:
      return CloseButtonShowType.always;
    case UtilsCloseButtonShowType.none:
      return CloseButtonShowType.none;
    case UtilsCloseButtonShowType.onHover:
      return CloseButtonShowType.onHover;
  }
}
