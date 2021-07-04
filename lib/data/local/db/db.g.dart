// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorDb {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DbBuilder databaseBuilder(String name) => _$DbBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DbBuilder inMemoryDatabaseBuilder() => _$DbBuilder(null);
}

class _$DbBuilder {
  _$DbBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$DbBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$DbBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<Db> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$Db();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$Db extends Db {
  _$Db([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  FlowDao? _flowsInstance;

  PlaylistDao? _playlistsInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Flow` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `playlists` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Playlist` (`id` TEXT, `collaborative` INTEGER, `href` TEXT, `images` TEXT, `name` TEXT, `public` INTEGER, `snapshotId` TEXT, `type` TEXT, `uri` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  FlowDao get flows {
    return _flowsInstance ??= _$FlowDao(database, changeListener);
  }

  @override
  PlaylistDao get playlists {
    return _playlistsInstance ??= _$PlaylistDao(database, changeListener);
  }
}

class _$FlowDao extends FlowDao {
  _$FlowDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _flowInsertionAdapter = InsertionAdapter(
            database,
            'Flow',
            (Flow item) => <String, Object?>{
                  'id': item.id,
                  'playlists': _stringListConverter.encode(item.playlists)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Flow> _flowInsertionAdapter;

  @override
  Future<List<Flow>> findAllFlows() async {
    return _queryAdapter.queryList('SELECT * FROM Flow',
        mapper: (Map<String, Object?> row) => Flow(row['id'] as int?,
            _stringListConverter.decode(row['playlists'] as String)));
  }

  @override
  Stream<List<Flow>> findAllFlowsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM Flow',
        mapper: (Map<String, Object?> row) => Flow(row['id'] as int?,
            _stringListConverter.decode(row['playlists'] as String)),
        queryableName: 'Flow',
        isView: false);
  }

  @override
  Future<int> insertFlow(Flow flow) {
    return _flowInsertionAdapter.insertAndReturnId(
        flow, OnConflictStrategy.abort);
  }
}

class _$PlaylistDao extends PlaylistDao {
  _$PlaylistDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _playlistInsertionAdapter = InsertionAdapter(
            database,
            'Playlist',
            (Playlist item) => <String, Object?>{
                  'id': item.id,
                  'collaborative': item.collaborative == null
                      ? null
                      : (item.collaborative! ? 1 : 0),
                  'href': item.href,
                  'images': _imageListConverter.encode(item.images),
                  'name': item.name,
                  'public': item.public == null ? null : (item.public! ? 1 : 0),
                  'snapshotId': item.snapshotId,
                  'type': item.type,
                  'uri': item.uri
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Playlist> _playlistInsertionAdapter;

  @override
  Stream<List<Playlist>> findAllPlaylists() {
    return _queryAdapter.queryListStream('SELECT * FROM Playlist',
        mapper: (Map<String, Object?> row) => Playlist(
            collaborative: row['collaborative'] == null
                ? null
                : (row['collaborative'] as int) != 0,
            href: row['href'] as String?,
            id: row['id'] as String?,
            images: _imageListConverter.decode(row['images'] as String?),
            name: row['name'] as String?,
            public: row['public'] == null ? null : (row['public'] as int) != 0,
            snapshotId: row['snapshotId'] as String?,
            type: row['type'] as String?,
            uri: row['uri'] as String?),
        queryableName: 'Playlist',
        isView: false);
  }

  @override
  Future<List<Playlist>> findPlaylistsById(List<String> ids) async {
    const offset = 1;
    final _sqliteVariablesForIds =
        Iterable<String>.generate(ids.length, (i) => '?${i + offset}')
            .join(',');
    return _queryAdapter.queryList(
        'SELECT * FROM Playlist WHERE id IN (' + _sqliteVariablesForIds + ')',
        mapper: (Map<String, Object?> row) => Playlist(
            collaborative: row['collaborative'] == null
                ? null
                : (row['collaborative'] as int) != 0,
            href: row['href'] as String?,
            id: row['id'] as String?,
            images: _imageListConverter.decode(row['images'] as String?),
            name: row['name'] as String?,
            public: row['public'] == null ? null : (row['public'] as int) != 0,
            snapshotId: row['snapshotId'] as String?,
            type: row['type'] as String?,
            uri: row['uri'] as String?),
        arguments: [...ids]);
  }

  @override
  Stream<List<Playlist>> findAllPlaylistsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM Playlist',
        mapper: (Map<String, Object?> row) => Playlist(
            collaborative: row['collaborative'] == null
                ? null
                : (row['collaborative'] as int) != 0,
            href: row['href'] as String?,
            id: row['id'] as String?,
            images: _imageListConverter.decode(row['images'] as String?),
            name: row['name'] as String?,
            public: row['public'] == null ? null : (row['public'] as int) != 0,
            snapshotId: row['snapshotId'] as String?,
            type: row['type'] as String?,
            uri: row['uri'] as String?),
        queryableName: 'Playlist',
        isView: false);
  }

  @override
  Future<int> insertPlaylist(Playlist playlist) {
    return _playlistInsertionAdapter.insertAndReturnId(
        playlist, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> insertPlaylists(List<Playlist> playlists) {
    return _playlistInsertionAdapter.insertListAndReturnIds(
        playlists, OnConflictStrategy.replace);
  }
}

// ignore_for_file: unused_element
final _stringListConverter = StringListConverter();
final _imageListConverter = ImageListConverter();
