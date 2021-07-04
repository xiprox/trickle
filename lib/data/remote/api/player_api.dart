part of '../api.dart';

extension PlayerApi on Api {
  Future<Resource<CurrentPlayback>> getCurrentPlayback() async {
    return ApiCall<CurrentPlayback>(client).get('/me/player').parseWith((json) {
      return CurrentPlayback.fromJson(json);
    }).future();
  }

  Future<Resource> startResumePlayback({
    int? positionMs,
  }) async {
    return ApiCall(client).put('/me/player/play').bodyJson({
      'position_ms': positionMs,
    }).future(json: false);
  }

  Future<Resource> pausePlayback() async {
    return ApiCall(client).put('/me/player/pause').future(json: false);
  }

  Future<Resource> skipToNextTrack() async {
    return ApiCall(client).post('/me/player/next').future(json: false);
  }

  Future<Resource> skipToPreviousTrack() async {
    return ApiCall(client).post('/me/player/previous').future(json: false);
  }

  Future<Resource> seekTo(int positionMs) async {
    return ApiCall(client).put('/me/player/seek').params({
      'position_ms': positionMs,
    }).future(json: false);
  }
}
