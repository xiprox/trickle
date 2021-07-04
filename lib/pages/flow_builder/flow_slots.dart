import 'package:flutter/material.dart';
import 'package:trickle/widgets/network_image_with_placeholder.dart';
import 'package:trickle/widgets/slot/slot.dart';
import 'package:trickle/utils/exts/all.dart';

import 'package:collection/collection.dart';

import 'flow_builder_view_model.dart';

class FlowSlots extends StatelessWidget {
  final bool compact;

  const FlowSlots({
    Key? key,
    this.compact = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorSet = context.colorSet;
    return Container();
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    //     Slot(
    //       imageUrl: state.selectedPair?.source?.images?.firstOrNull?.url,
    //       imageType: ImageType.playlist,
    //       title: state.selectedPair?.source?.name,
    //       label: 'From',
    //       compact: compact,
    //     ),
    //     const SizedBox(width: 16),
    //     Icon(
    //       Icons.arrow_right_alt_outlined,
    //       color: state.selectedPair?.isValid == true
    //           ? colorSet.primary
    //           : colorSet.border,
    //     ),
    //     const SizedBox(width: 16),
    //     Slot(
    //       imageUrl: state.selectedPair?.target?.images?.firstOrNull?.url,
    //       imageType: ImageType.playlist,
    //       title: state.selectedPair?.target?.name,
    //       label: 'To',
    //       compact: compact,
    //     ),
    //   ],
    // );
  }
}
