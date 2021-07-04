import 'package:dio/dio.dart';
import 'package:trickle/data/models/spotify/player/current_playback.dart';
import 'package:trickle/data/models/spotify/playlist.dart';
import 'package:api_call/api_call.dart';
import 'package:api_call/resource.dart';
import 'package:trickle/config/consts.dart';
import 'package:trickle/data/models/spotify/auth_result.dart';
import 'package:trickle/services/services.dart';

import 'auth_interceptor.dart';
import 'dio_isolate_transformer.dart';

part 'api/auth_api.dart';
part 'api/playlists_api.dart';
part 'api/player_api.dart';

abstract class Api {
  void init();
  Dio get client;
}

class ApiImpl extends Api {
  final _dio = Dio(
    BaseOptions(baseUrl: 'https://api.spotify.com/v1'),
  );

  @override
  void init() {
    _dio.transformer = DioIsolateTransformer();
    _dio.interceptors.add(AuthInterceptor());
  }

  @override
  Dio get client => _dio;

  Future exchangeCode(String code) async {
    return Dio().post(
      'https://accounts.spotify.com/api/token',
      queryParameters: {'code': code},
    );
  }
}
