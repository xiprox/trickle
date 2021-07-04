import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:trickle/config/consts.dart';

import 'package:trickle/utils/exts/all.dart';
import 'package:trickle/widgets/network_image_with_placeholder.dart';

import 'package:supercharged/supercharged.dart';

import 'slot_image.dart';

final _kAnimationDuration = 200.milliseconds;

class Slot extends StatelessWidget {
  final String? imageUrl;
  final ImageType imageType;
  final String? title;
  final String label;
  final bool compact;

  const Slot({
    Key? key,
    required this.imageUrl,
    required this.imageType,
    required this.title,
    required this.label,
    this.compact = false,
  }) : super(key: key);

  bool get slotIsEmpty => title == null && imageUrl == null;

  @override
  Widget build(BuildContext context) {
    final colorSet = context.colorSet;
    return Tooltip(
      message: title ?? label,
      waitDuration: compact ? null : 1.days,
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(8),
        color: colorSet.border,
        strokeWidth: 1.2,
        dashPattern: [8, slotIsEmpty ? 4 : 0],
        child: AnimatedSize(
          duration: _kAnimationDuration,
          alignment: AlignmentDirectional.centerStart,
          curve: Curves.fastOutSlowIn,
          child: Container(
            width: compact ? null : kDesiredSlotWidth,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  SlotImage(
                    url: imageUrl,
                    imageType: imageType,
                    title: title,
                  ),
                  if (!compact) ...[
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        title ?? label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: title == null ? colorSet.textLighter : null,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
