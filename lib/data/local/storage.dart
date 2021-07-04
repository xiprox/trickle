import 'package:hive/hive.dart';

abstract class Storage {
  Future init();
  Future clear();

  int? get expirationTimestamp;
  set expirationTimestamp(int? value);
}

class StorageImpl implements Storage {
  late Box _box;

  @override
  Future init() async {
    _box = await Hive.openBox('storage');
  }

  @override
  Future clear() async {
    await _box.clear();
    // Box gets closed when cleared so call init to re-open it.
    // Failing to re-open after clearing a box will cause writes to not be
    // persisted.
    await init();
  }

  getstuff() {}

  @override
  int? get expirationTimestamp => _box.get('expirationTimestamp');
  @override
  set expirationTimestamp(int? value) => _box.get('expirationTimestamp');
}
