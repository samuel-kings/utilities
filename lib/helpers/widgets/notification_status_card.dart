import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sk_utilities/constants/asset_names.dart';
import 'package:sk_utilities/constants/consts.dart';
import 'package:sk_utilities/constants/enums.dart';
import 'package:sk_utilities/constants/library_colors.dart';

class NotificationStatusCard extends StatelessWidget {
  /// positive, negative, info, warning
  final SKNotificationStatusType type;
  final String title;
  final String message;
  final String? extraInfo;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;
  const NotificationStatusCard(
      {super.key,
      required this.type,
      required this.title,
      required this.message,
      this.extraInfo,
      this.width,
      this.backgroundColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    Color firstGradColor = LibColors.green;

    if (type == SKNotificationStatusType.negative) {
      firstGradColor = LibColors.secondaryRed;
    }

    if (type == SKNotificationStatusType.info) {
      firstGradColor = LibColors.blue;
    }

    if (type == SKNotificationStatusType.warning) {
      firstGradColor = LibColors.amber;
    }

    return Stack(
      children: [
        // base card
        Container(
          height: 80,
          width: width ?? MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                offset: const Offset(0.0, 10.0),
                blurRadius: 14.0,
              )
            ],
          ),
        ),
        // gradient half card on the left
        Container(
          height: 80,
          width: 120,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                firstGradColor,
                const Color.fromRGBO(54, 55, 66, 0),
              ],
              stops: const [0.0306, 0.8929],
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
        // content
        Container(
            width: width ?? MediaQuery.of(context).size.width - 40,
            padding: const EdgeInsets.only(left: 23, top: 8, right: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // extraInfo
                if (extraInfo != null)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(extraInfo!,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontSize: 10, color: textColor ?? LibColors.ashGrey)),
                  ),
                const SizedBox(height: 5),
                // others
                Row(
                  children: [
                    // icon
                    Container(
                      height: 35,
                      width: 35,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: firstGradColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: type == SKNotificationStatusType.info || type == SKNotificationStatusType.warning
                          ? Icon(
                              type == SKNotificationStatusType.info ? CupertinoIcons.info : Icons.warning_amber_rounded,
                              size: 24,
                              color: firstGradColor)
                          : Image.asset(
                              type == SKNotificationStatusType.positive ? Assets.checkBox : Assets.closeBox,
                              height: 24,
                              width: 24,
                              color: firstGradColor,
                              package: pkgName,
                            ),
                    ),
                    const SizedBox(width: 22),
                    // title and message
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title,
                              style:
                                  Theme.of(context).textTheme.titleMedium!.copyWith(color: textColor ?? Colors.white)),
                          const SizedBox(height: 7),
                          Text(message,
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: textColor ?? Colors.white),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.left),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ))
      ],
    );
  }
}
