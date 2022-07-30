import 'package:canteen/screens/screens.dart';
import 'package:canteen/screens/workflow/workflow_step1.dart';
import 'package:canteen/screens/workflow/workflow_step2.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

final workflowScreens = VNester(
  fullscreenDialog: true,
  path: Routes.workflowStepsRoot.name,
  widgetBuilder: (child) => child,
  nestedRoutes: [
    VWidget(
      path: Routes.workflowStep1.name,
      widget: const WorkflowStep1Page(),
      stackedRoutes: [
        VWidget(
          path: Routes.workflowStep2.name,
          widget: const WorkflowStep2Page(),
        ),
      ],
    ),
  ],
);

class WorkflowPage extends StatelessWidget {
  const WorkflowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Workflow'),
          TextButton(
            child: const Text('Do it'),
            onPressed: () {
              context.vRouter.to(Routes.workflowStep1.name);
            },
          ),
        ],
      ),
    );
  }
}
