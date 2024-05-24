import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:sk_utilities/constants/enums.dart';
import 'package:sk_utilities/helpers/widgets/notification_status_card.dart';

/// shows a snackbar with a title, using the [NotificationStatusCard] widget
snackbarWithTitle(BuildContext context,
    {SKNotificationStatusType? type,
    required String title,
    required String message,
    String? extraInfo,
    double? width,
    Color? backgroundColor,
    Color? textColor}) {
  return AnimatedSnackBar(
    mobileSnackBarPosition: MobileSnackBarPosition.top,
    desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
    duration: const Duration(seconds: 5),
    builder: ((context) {
      return NotificationStatusCard(
          type: type ?? SKNotificationStatusType.positive,
          title: title,
          message: message,
          extraInfo: extraInfo,
          width: width,
          backgroundColor: backgroundColor,
          textColor: textColor);
    }),
  ).show(context);
}
