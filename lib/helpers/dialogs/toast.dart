import 'package:flutter/material.dart';
import 'package:sk_utilities/constants/enums.dart';
import 'package:toastification/toastification.dart';

void toastSnackbar(
  BuildContext context, {
  AlignmentGeometry? alignment,
  SKNotificationStatusType? type,
  SKToastificationStyle? style,
  required String title,
  String? description,
  Widget? icon,
  Function()? onTap,
  Color? primaryColor,
  Color? backgroundColor,
  bool? showProgressBar,
  SKToastProgressBarTheme? progressBarTheme,
  SKCloseButtonShowType? closeButtonShowType,
}) {
  ToastificationType type_ = _getSnackBarType(type ?? SKNotificationStatusType.positive);
  ToastificationStyle style_ = _getStyle(style ?? SKToastificationStyle.flat);
  CloseButtonShowType closeButtonShowType_ =
      _getCloseButtonShowType(closeButtonShowType ?? SKCloseButtonShowType.onHover);

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
      title: Text(title, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
      description: description == null ? null : Text(description, style: Theme.of(context).textTheme.bodyMedium),
      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10)],
      progressBarTheme: progressBarTheme,
      closeButtonShowType: closeButtonShowType_,
      pauseOnHover: true,
      callbacks: ToastificationCallbacks(onTap: (value) {
        if (onTap != null) onTap();
      }));
}

ToastificationType _getSnackBarType(SKNotificationStatusType type) {
  switch (type) {
    case SKNotificationStatusType.positive:
      return ToastificationType.success;
    case SKNotificationStatusType.negative:
      return ToastificationType.error;
    case SKNotificationStatusType.info:
      return ToastificationType.info;
    case SKNotificationStatusType.warning:
      return ToastificationType.warning;
  }
}

ToastificationStyle _getStyle(SKToastificationStyle style) {
  switch (style) {
    case SKToastificationStyle.flat:
      return ToastificationStyle.flat;
    case SKToastificationStyle.flatColored:
      return ToastificationStyle.flatColored;
    case SKToastificationStyle.minimal:
      return ToastificationStyle.minimal;
  }
}

class SKToastProgressBarTheme extends ProgressIndicatorThemeData {
  const SKToastProgressBarTheme(
      {super.circularTrackColor,
      super.linearTrackColor,
      super.color,
      super.linearMinHeight,
      super.refreshBackgroundColor})
      : super();
}

CloseButtonShowType _getCloseButtonShowType(SKCloseButtonShowType type) {
  switch (type) {
    case SKCloseButtonShowType.always:
      return CloseButtonShowType.always;
    case SKCloseButtonShowType.none:
      return CloseButtonShowType.none;
    case SKCloseButtonShowType.onHover:
      return CloseButtonShowType.onHover;
  }
}
