import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:trickle/data/models/spotify/image.dart';

class ImageListConverter extends TypeConverter<List<Image>?, String?> {
  @override
  List<Image>? decode(String? databaseValue) {
    if (databaseValue == null) return null;
    return List<Image>.from(
      json.decode(databaseValue).map((json) {
        return Image.fromJson(json);
      }),
    );
  }

  @override
  String? encode(List<Image>? value) {
    if (value == null) return null;
    return json.encode(value);
  }
}
