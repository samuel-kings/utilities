import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:utilities/constants/enums.dart';
import 'package:utilities/helpers/dialogs/no_intenet_widget.dart';
import 'package:utilities/helpers/dialogs/snackbar.dart';
import 'package:utilities/helpers/dialogs/snackbar_with_title.dart';
import 'package:utilities/helpers/dialogs/toast.dart';
import 'package:utilities/helpers/widgets/notification_status_card.dart';

class Dialogs {
  /// shows a dialog indicating no internet connection with a title, message and an action button
  void showNoInternetDialog(BuildContext context,
      {String text = "Refresh",
      Widget icon = const Icon(Icons.refresh, size: 30),

      /// the image asset to be displayed indicating no internet connection
      String? asset,
      Function()? onRefresh}) {
    noInternetDialog(context, text: text, icon: icon, asset: asset, onRefresh: onRefresh);
  }

  /// shows a snackbar using the [AnimatedSnackBar.material]
  void showSnackbar(BuildContext context,
          {required String message, UtilsNotificationStatusType type = UtilsNotificationStatusType.positive}) =>
      snackbar(context, message: message, type: type);

  /// shows a snackbar with a title, using the [NotificationStatusCard] widget
  void showSnackbarWithTitle(BuildContext context,
          {required UtilsNotificationStatusType type,
          required String title,
          required String message,
          String? extraInfo,
          double? width,
          Color? backgroundColor,
          Color? textColor}) =>
      snackbarWithTitle(context,
          type: type,
          title: title,
          message: message,
          extraInfo: extraInfo,
          width: width,
          backgroundColor: backgroundColor,
          textColor: textColor);

  /// shows a toast notification using the [Toastification] package
  void showToastSnackbar(
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
    toastSnackbar(
      context,
      alignment: alignment,
      type: type,
      style: style,
      title: title,
      description: description,
      icon: icon,
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      showProgressBar: showProgressBar,
      progressBarTheme: progressBarTheme,
      closeButtonShowType: closeButtonShowType,
    );
  }
}
