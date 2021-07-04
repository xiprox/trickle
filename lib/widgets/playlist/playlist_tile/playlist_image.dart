import 'package:flutter/material.dart';
import 'package:trickle/widgets/frame_builders.dart';

class PlaylistImage extends StatelessWidget {
  final String? url;
  final double? size;

  const PlaylistImage({
    Key? key,
    required this.url,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: url != null
              ? Image(
                  image: NetworkImage(url!),
                  frameBuilder: FrameBuilder.fadeIn200ms,
                  width: size ?? constraints.maxWidth,
                  height: size ?? constraints.maxWidth,
                  fit: BoxFit.cover,
                )
              : Container(
                  color: Colors.grey,
                  width: size ?? constraints.maxWidth,
                  height: size ?? constraints.maxWidth,
                ),
        );
      },
    );
  }
}
