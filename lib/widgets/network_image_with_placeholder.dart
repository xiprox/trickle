import 'package:flutter/material.dart';
import 'package:trickle/widgets/frame_builders.dart';
import 'package:trickle/utils/exts/all.dart';

enum ImageType { playlist, album }

final _kDefaultBorderRadius = BorderRadius.circular(6);

/// Renders [Image.network] if given [url] is not null, otherwise renders
/// a default image with an icon for given [type].
class NetworkImageWithPlaceholder extends StatelessWidget {
  final String? url;
  final ImageType type;
  final BorderRadius? borderRadius;
  final double? size;

  const NetworkImageWithPlaceholder({
    Key? key,
    required this.url,
    required this.type,
    this.borderRadius,
    this.size,
  }) : super(key: key);

  factory NetworkImageWithPlaceholder.playlist(
    String? url, {
    BorderRadius? borderRadius,
    double? size,
  }) {
    return NetworkImageWithPlaceholder(
      url: url,
      type: ImageType.playlist,
      borderRadius: borderRadius,
      size: size,
    );
  }

  factory NetworkImageWithPlaceholder.album(
    String? url, {
    double? size,
    BorderRadius? borderRadius,
  }) {
    return NetworkImageWithPlaceholder(
      url: url,
      type: ImageType.album,
      borderRadius: borderRadius,
      size: size,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ClipRRect(
          borderRadius: borderRadius ?? _kDefaultBorderRadius,
          child: url != null
              ? _buildImage(context, constraints)
              : _buildPlaceholder(context, constraints),
        );
      },
    );
  }

  Widget _buildImage(BuildContext context, BoxConstraints constraints) {
    return Image.network(
      url!,
      frameBuilder: FrameBuilder.fadeIn200ms,
      width: size ?? constraints.maxWidth,
      height: size ?? constraints.maxWidth,
      fit: BoxFit.cover,
    );
  }

  Widget _buildPlaceholder(BuildContext context, BoxConstraints constraints) {
    final lightTheme = context.theme.brightness == Brightness.light;
    final colorSet = context.colorSet;
    final backgroundColor =
        colorSet.background.manipulate(lightTheme ? 0.95 : 1.2);

    final size = this.size ?? constraints.maxWidth;
    return Container(
      color: backgroundColor,
      width: size,
      height: size,
      child: Icon(
        _getIcon(),
        color: backgroundColor.manipulate(lightTheme ? 0.85 : 1.5),
        size: size * 0.5,
      ),
    );
  }

  IconData _getIcon() {
    switch (type) {
      case ImageType.playlist:
        return Icons.list_rounded;
      case ImageType.album:
        return Icons.album_rounded;
      default:
        return Icons.circle;
    }
  }
}
