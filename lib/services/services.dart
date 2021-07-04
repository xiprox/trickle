import 'package:trickle/data/local/db/db.dart';
import 'package:trickle/data/local/storage.dart';
import 'package:trickle/data/repos/flow_repo.dart';
import 'package:trickle/data/repos/playlists_repo.dart';
import 'package:trickle/services/color_generator.dart';
import 'package:universal_io/io.dart';

import 'package:get_it/get_it.dart';
import 'package:trickle/data/local/credentials.dart';
import 'package:trickle/data/remote/api.dart';
import 'package:trickle/fakes.dart';
import 'package:trickle/navigation/router.gr.dart';
import 'package:trickle/services/auth_flow.dart';
import 'package:trickle/services/crypto.dart';
import 'package:trickle/services/logger.dart';

export 'exported_services.dart';

final get = GetIt.instance.get;

Logger get log => get<Logger>();

final _testing = Platform.environment.containsKey('FLUTTER_TEST');

class Services {
  static bool _initialized = false;

  static init() async {
    if (_initialized) return;
    if (_testing) {
      await _initTesting();
    } else {
      await _init();
    }
    _initialized = true;
  }

  static Future _init() async {
    final getIt = GetIt.instance;

    getIt.registerSingleton<Crypto>(CryptoImpl());

    getIt.registerSingleton(AppRouter());

    final credentials = CredentialsImpl();
    await credentials.init();
    getIt.registerSingleton<Credentials>(credentials);

    final storage = StorageImpl();
    await storage.init();
    getIt.registerSingleton<Storage>(storage);

    final api = ApiImpl();
    getIt.registerSingleton<Api>(api);
    api.init();

    getIt.registerFactory<AuthFlow>(() => AuthFlowImpl());

    final colorGenerator = ColorGeneratorImpl();
    await colorGenerator.init();
    getIt.registerSingleton<ColorGenerator>(colorGenerator);

    final db = await $FloorDb.databaseBuilder('database.db').build();
    // await db.database.delete('flow');
    getIt.registerSingleton<Db>(db);

    // Repos
    getIt.registerSingleton<FlowRepo>(FlowRepoImpl());
    getIt.registerSingleton<PlaylistsRepo>(PlaylistsRepoImpl());
  }

  static Future _initTesting() async {
    return _init();
    // final getIt = GetIt.instance;

    // getIt.registerSingleton(AppRouter());

    // final credentials = FakeCredentials();
    // await credentials.init();
    // getIt.registerSingleton<Credentials>(credentials);
  }
}
