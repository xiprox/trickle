import 'package:flutter/material.dart';

class SeekBar extends StatelessWidget {
  final int positionMs;
  final int durationMs;
  final Function(int) onSeek;

  const SeekBar({
    Key? key,
    required this.positionMs,
    required this.durationMs,
    required this.onSeek,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 3,
        thumbShape: SliderComponentShape.noThumb,
        overlayShape: SliderComponentShape.noOverlay,
        thumbColor: Colors.transparent,
        trackShape: RectangularSliderTrackShape(),
      ),
      child: Slider(
        onChanged: (value) => onSeek((durationMs * value).toInt()),
        value: positionMs / durationMs,
      ),
    );
  }
}
