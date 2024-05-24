import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:utilities/constants/enums.dart';

snackbar(BuildContext context, {required String message, SKNotificationStatusType? type}) {
  final snackBarType = _getSnackBarType(type ?? SKNotificationStatusType.positive);

  return AnimatedSnackBar.material(
    message,
    type: snackBarType,
    mobileSnackBarPosition: MobileSnackBarPosition.top,
    desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
    duration: const Duration(seconds: 5),
  ).show(context);
}

AnimatedSnackBarType _getSnackBarType(SKNotificationStatusType type) {
  switch (type) {
    case SKNotificationStatusType.positive:
      return AnimatedSnackBarType.success;
    case SKNotificationStatusType.negative:
      return AnimatedSnackBarType.error;
    case SKNotificationStatusType.info:
      return AnimatedSnackBarType.info;
    case SKNotificationStatusType.warning:
      return AnimatedSnackBarType.warning;
  }
}
