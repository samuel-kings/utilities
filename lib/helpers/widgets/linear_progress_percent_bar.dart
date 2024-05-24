import 'package:flutter/material.dart';

class LinearProgressPercentBar extends StatelessWidget {
  final Color? filledColor;
  final Color? borderColor;
  final Color? emptyColor;
  final double width;

  /// The progress of the progress bar. It should be a value between 0 and 1
  final double progress;

  const LinearProgressPercentBar(
      {super.key, required this.progress, required this.width, this.filledColor, this.borderColor, this.emptyColor});

  @override
  Widget build(BuildContext context) {
    double filledWidth = progress * width;
    double textWidth = 40;
    double emptyWidth = width - (filledWidth + textWidth);

    Color primary = Theme.of(context).colorScheme.primary;

    return SizedBox(
        width: width,
        child: Row(
          children: [
            // progress bar filled
            if (filledWidth > 0)
              Expanded(
                child: Container(
                    width: filledWidth,
                    height: 6,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.22), color: filledColor ?? primary),
                    child: ClipRect(
                      child: Container(
                        height: 4,
                        decoration: BoxDecoration(color: filledColor ?? primary),
                      ),
                    )),
              ),
            // progress text
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              width: textWidth,
              alignment: Alignment.center,
              child: Text('${(progress * 100).toInt()}%',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: primary)),
            ),
            // progress bar empty
            if (emptyWidth > 0)
              Container(
                width: emptyWidth,
                height: 6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.22), color: emptyColor ?? Colors.grey.withOpacity(0.42)),
              ),
          ],
        ));
  }
}
