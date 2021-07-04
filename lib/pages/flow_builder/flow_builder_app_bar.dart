import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:trickle/widgets/scroll_builder.dart';
import 'package:trickle/utils/exts/all.dart';

import 'flow_builder_slots.dart';
import 'flow_create_button.dart';
import '../../widgets/sync_indicator.dart';

class FlowBuilderAppBar extends StatelessWidget {
  final ScrollController scrollController;
  final bool syncing;

  const FlowBuilderAppBar({
    Key? key,
    required this.scrollController,
    this.syncing = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorSet = context.colorSet;
    return SliverAppBar(
      backgroundColor: colorSet.background,
      centerTitle: false,
      expandedHeight: 348,
      collapsedHeight: 56,
      flexibleSpace: FlexibleSpaceBar(
        title: ScrollBuilder(
          scrollController: scrollController,
          delegate: ScrollBuilderFadeDelegate(),
          breakpoint: 90,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 16),
                  const SizedBox(width: 8),
                  Text(
                    'Create a Flow',
                    style: TextStyle(
                      color: colorSet.text,
                    ),
                  ),
                  const SizedBox(width: 8),
                  SyncIndicator(
                    visible: syncing,
                    radius: 6,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'Drag playlists into the area below',
                style: TextStyle(
                  color: colorSet.text,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        titlePadding: const EdgeInsets.only(bottom: 224),
      ),
      pinned: true,
      elevation: 2,
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, 140),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16, top: 32),
          child: Container(
            color: colorSet.secondaryBackground.withOpacity(0.5),
            child: DottedBorder(
              borderType: BorderType.Rect,
              color: colorSet.border,
              strokeWidth: 1.4,
              dashPattern: [4, 2],
              child: Stack(
                children: [
                  ScrollBuilder(
                    scrollController: scrollController,
                    delegate: ScrollBuilderCustomDelegate(
                      builder: (progress, child) {
                        return FlowBuilderSlots(height: 184 - 40 * progress);
                      },
                    ),
                    breakpoint: 90,
                    child: Container(),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 16),
                        child: FlowCreateButton(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
