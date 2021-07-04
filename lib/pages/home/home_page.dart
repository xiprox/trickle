import 'package:auto_route/auto_route.dart';
import 'package:veee/veee.dart';
import 'package:flutter/material.dart';
import 'package:trickle/pages/home/home_view_model.dart';
import 'package:trickle/pages/player/player_view_model.dart';
import 'package:trickle/services/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(get<Credentials>().accessToken);
    return ViewModelProvider<PlayerViewModel>(
      create: (_) => PlayerViewModel(),
      child: ViewModelProvider<HomeViewModel>(
        create: (_) => HomeViewModel(),
        child: ViewModelBuilder<HomeViewModel>(
          builder: (context, viewModel, child) {
            return StreamBuilder<bool>(
              stream: viewModel.noFlowsCreated,
              builder: (context, snapshot) {
                final noFlowsCreated = snapshot.data == true;
                return AutoRouter.declarative(routes: (_) {
                  return [
                    if (noFlowsCreated) FlowBuilderRoute(),
                    if (!noFlowsCreated) NowPlayingRoute(),
                  ];
                });
              },
            );
          },
        ),
      ),
    );
  }
}
