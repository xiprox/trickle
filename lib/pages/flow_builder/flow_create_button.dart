import 'package:veee/veee.dart';
import 'package:flutter/material.dart';
import 'package:trickle/pages/flow_builder/flow_builder_view_model.dart';

import 'package:supercharged/supercharged.dart';

class FlowCreateButton extends StatelessWidget {
  const FlowCreateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FlowBuilderViewModel>(
      builder: (context, viewModel, child) {
        return TweenAnimationBuilder<double>(
          tween:
              viewModel.showCreateButton ? 0.0.tweenTo(1.0) : 1.0.tweenTo(0.0),
          duration:
              viewModel.showCreateButton ? 400.milliseconds : 200.milliseconds,
          curve: viewModel.showCreateButton
              ? Curves.bounceOut
              : Curves.fastOutSlowIn,
          builder: (context, value, child) {
            return Transform.scale(
              scale: value,
              child: child,
            );
          },
          child: FloatingActionButton(
            onPressed: viewModel.onCreatePress,
            child: Icon(Icons.done_rounded),
            elevation: 8,
          ),
        );
      },
    );
  }
}
