import 'package:flutter/material.dart';

class CircularProgressWithButton extends StatelessWidget {
  final Icon? icon;
  final Image? imageAsIcon;
  final double progress;
  final Function()? onPressed;
  final Color color;
  final bool? isContinuousLoading;
  const CircularProgressWithButton(
      {super.key, required this.progress, this.onPressed, this.icon, this.imageAsIcon, required this.color, this.isContinuousLoading});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(
        children: [
          // btn
          Container(
            height: 80,
            width: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color.withOpacity(0.42),
              shape: BoxShape.circle,
              boxShadow: progress >= 1
                  ? [
                      BoxShadow(
                        color: Theme.of(context).primaryColor,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 18.0,
                      )
                    ]
                  : null,
            ),
            child: Container(
                height: 67,
                width: 67,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                child: icon ?? imageAsIcon ?? const Icon(Icons.chevron_right_rounded, color: Colors.white, size: 60)),
          ),
          // progress indicator
          Positioned.fill(
            child: CircularProgressIndicator(
              value: isContinuousLoading == true ? null : progress,
              strokeCap: StrokeCap.round,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              backgroundColor: Colors.transparent,
              strokeWidth: 3,
            ),
          ),
        ],
      ),
    );
  }
}
