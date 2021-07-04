import 'dart:async';

import 'package:api_call/resource.dart';
import 'package:veee/veee.dart';
import 'package:trickle/core/common_view_model_orders.dart';
import 'package:trickle/config/consts.dart';
import 'package:trickle/data/models/spotify/player/current_playback.dart';
import 'package:trickle/services/services.dart';
import 'package:supercharged/supercharged.dart';

class PlayerViewModel extends ViewModel {
  final _api = get<Api>();

  late Timer _refreshTimer;

  Resource<CurrentPlayback> playback = Resource.loading();

  @override
  void onCreate() {
    _restartRefreshTimer();
  }

  @override
  void dispose() {
    _refreshTimer.cancel();
    super.dispose();
  }

  Future _restartRefreshTimer() async {
    _refreshTimer = Timer.periodic(kPlayerRefreshRate, (timer) => _refetch());
  }

  Future _refetch() async {
    playback = await _api.getCurrentPlayback();
    print(playback);
    notifyListeners();
  }

  void onPlayPausePress() async {
    Resource result;
    if (playback.data?.isPlaying == true) {
      result = await _api.pausePlayback();
    } else {
      result = await _api.startResumePlayback();
    }
    if (result.isError()) {
      print(result.error?.stackTrace);
      order(ShowSnackBar(result.error!.message));
    }
    await _refetch();
  }

  void onNextPress() async {
    final result = await _api.skipToNextTrack();
    if (result.isError()) {
      order(ShowSnackBar(result.error!.message));
    }
    await _refetch();
  }

  void onPreviousPress() async {
    final result = await _api.skipToPreviousTrack();
    if (result.isError()) {
      order(ShowSnackBar(result.error!.message));
    }
    await _refetch();
  }

  @deprecated
  void onSeek(int positionMs) async {
    final result = await _api.seekTo(positionMs);
    if (result.isError()) {
      order(ShowSnackBar(result.error!.message));
    }
    await _refetch();
  }
}
