import 'package:flutter/material.dart';

import 'package:sk_utilities/constants/asset_names.dart';
import 'package:sk_utilities/constants/consts.dart';

/// Notification button
class NotificationIconButton extends StatelessWidget {
  final bool hasNotif;
  final Color backgroundColor;
  final Function() onClick;
  final Widget? customIcon;
  final Color? imageColor;
  const NotificationIconButton({
    super.key,
    required this.hasNotif,
    required this.onClick,
    this.customIcon,
    this.imageColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      splashColor: Colors.transparent,
      child: Container(
          height: 42,
          width: 42,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: customIcon ??
              Image.asset(
                hasNotif ? Assets.notificationWithDot : Assets.notification,
                package: pkgName,
                color: imageColor,
                height: hasNotif ? 30 : 26,
                width: hasNotif ? 30 : 26,
              )),
    );
  }
}
