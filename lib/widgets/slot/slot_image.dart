import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:trickle/widgets/network_image_with_placeholder.dart';
import 'package:trickle/utils/exts/all.dart';

class SlotImage extends StatelessWidget {
  final String? url;
  final String? title;
  final ImageType imageType;
  final double size;

  const SlotImage({
    Key? key,
    required this.url,
    required this.title,
    required this.imageType,
    this.size = 32,
  }) : super(key: key);

  bool get slotIsEmpty => url == null && title == null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: slotIsEmpty
          ? _buildPlaceholder(context)
          : NetworkImageWithPlaceholder(
              url: url,
              type: imageType,
            ),
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    final colorSet = context.colorSet;
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(4),
      color: colorSet.border,
      strokeWidth: 1.2,
      dashPattern: [4, 2],
      child: Container(),
    );
  }
}
