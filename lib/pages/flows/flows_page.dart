import 'package:veee/veee.dart';
import 'package:flutter/material.dart' hide Flow;
import 'package:trickle/data/models/database/flow.dart';
import 'package:trickle/pages/flows/flows_view_model.dart';

class FlowsPage extends StatelessWidget {
  const FlowsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelProvider<FlowsViewModel>(
        create: (_) => FlowsViewModel(),
        child: ViewModelBuilder<FlowsViewModel>(
          builder: (context, viewModel, child) {
            return StreamBuilder<List<Flow>>(
              stream: viewModel.flows,
              builder: (context, snapshot) {
                final flows = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: flows.length,
                  itemBuilder: (context, index) {
                    return Text(flows[index].id?.toString() ?? '0');
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
