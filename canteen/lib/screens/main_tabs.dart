import 'package:canteen/screens/screens.dart';
import 'package:canteen/screens/workflow/workflow.dart';
import 'package:vrouter/vrouter.dart';

final mainTabs = VNester(
  widgetBuilder: (child) => MainPage(child: child),
  path: Routes.root.name,
  nestedRoutes: [
    VWidget(
      path: null,
      widget: const HomePage(),
      transitionDuration: const Duration(milliseconds: 0),
    ),
    VWidget(
      path: Routes.workflow.name,
      widget: const WorkflowPage(),
      aliases: [Routes.workflowStep1.name, Routes.workflowStep2.name],
      transitionDuration: const Duration(milliseconds: 0),
    ),
  ],
  stackedRoutes: [workflowScreens],
);
