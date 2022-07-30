import 'package:canteen/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class WorkflowStep2Page extends StatelessWidget {
  const WorkflowStep2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: IconButton(
                onPressed: () {
                  context.vRouter.to(Routes.workflow.name, isReplacement: true);
                },
                icon: const Icon(
                  Icons.close,
                  size: 35,
                ),
              ),
            ),
            Column(
              children: [
                const Center(
                  child: Text('Step 1'),
                ),
                TextButton(
                  onPressed: () {
                    context.vRouter.historyGo(-1);
                  },
                  child: const Text('Previous'),
                ),
                TextButton(
                  onPressed: () {
                    context.vRouter
                        .to(Routes.workflow.name, isReplacement: true);
                  },
                  child: const Text('Done'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
