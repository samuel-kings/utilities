import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:utilities/constants/enums.dart';

snackbar(BuildContext context, {required String message, UtilsNotificationStatusType? type}) {
  final snackBarType = _getSnackBarType(type ?? UtilsNotificationStatusType.positive);

  return AnimatedSnackBar.material(
    message,
    type: snackBarType,
    mobileSnackBarPosition: MobileSnackBarPosition.top,
    desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
    duration: const Duration(seconds: 5),
  ).show(context);
}

AnimatedSnackBarType _getSnackBarType(UtilsNotificationStatusType type) {
  switch (type) {
    case UtilsNotificationStatusType.positive:
      return AnimatedSnackBarType.success;
    case UtilsNotificationStatusType.negative:
      return AnimatedSnackBarType.error;
    case UtilsNotificationStatusType.info:
      return AnimatedSnackBarType.info;
    case UtilsNotificationStatusType.warning:
      return AnimatedSnackBarType.warning;
  }
}
