import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class WorkflowStep1Page extends StatelessWidget {
  const WorkflowStep1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: IconButton(
                onPressed: () {
                  context.vRouter.to('/workflow', isReplacement: true);
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
                    context.vRouter.to('/workflow/steps/2');
                  },
                  child: const Text('Next'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
