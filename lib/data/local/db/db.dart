import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:floor/floor.dart';
import 'package:trickle/data/local/db/converters/image_list_converter.dart';

import 'package:trickle/data/local/db/converters/string_list_converter.dart';

import 'package:trickle/data/models/database/flow.dart';
import 'package:trickle/data/models/spotify/playlist.dart';

import 'dao/flow_dao.dart';
import 'dao/playlist_dao.dart';

part 'db.g.dart';

@TypeConverters([
  StringListConverter,
  ImageListConverter,
])
@Database(version: 1, entities: [Flow, Playlist])
abstract class Db extends FloorDatabase {
  FlowDao get flows;
  PlaylistDao get playlists;
}
