import 'package:floor/floor.dart';

@Entity()
class Flow {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final List<String> playlists;

  Flow(this.id, this.playlists);
}
