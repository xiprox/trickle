import 'package:flutter/material.dart';
import 'package:trickle/pages/player/player_view_model.dart';
import 'package:veee/veee.dart';

class ConnectControls extends ViewModelWidget<PlayerViewModel> {
  const ConnectControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, PlayerViewModel viewModel) {
    return Container();
  }

  @override
  void handleOrder(
      BuildContext context, ViewModelOrder order, PlayerViewModel viewModel) {
    // TODO: implement handleOrder
  }
}
