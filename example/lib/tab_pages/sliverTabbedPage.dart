import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import './views/content_view.dart';
import './views/sliver_view.dart';

class SliverTabbedPage extends StatefulWidget {
  final TargetPlatform platform;

  const SliverTabbedPage({Key? key, required this.platform}) : super(key: key);

  @override
  _SliverTabbedPageState createState() => _SliverTabbedPageState();
}

class _SliverTabbedPageState extends State<SliverTabbedPage> {
  static final titles = ['Flag', 'Book'];
  final items = (BuildContext context) => [
        BottomNavigationBarItem(
          label: titles[0],
          icon: Icon(context.platformIcons.flag),
        ),
        BottomNavigationBarItem(
          label: titles[1],
          icon: Icon(context.platformIcons.book),
        ),
      ];

  late Widget Function(BuildContext, int) contentBuilder;

  // This needs to be captured here in a stateful widget
  late PlatformTabController tabController;

  @override
  void initState() {
    super.initState();

    // If you want further control of the tabs have one of these
    tabController = PlatformTabController(
      initialIndex: 1,
    );

    contentBuilder = (BuildContext context, int index) => SliverView(
          title: titles[index],
          children: [ContentView(index, widget.platform)],
        );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformTabScaffold(
      iosContentPadding: true,
      tabController: tabController,
      bodyBuilder: contentBuilder,
      items: items(context),
    );
  }
}
