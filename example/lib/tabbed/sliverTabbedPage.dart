import 'package:example/tabbed/views/content_view.dart';
import 'package:example/tabbed/views/sliver_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SliverTabbedPage extends StatefulWidget {
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

  final contentBuilder = (BuildContext context, int index) => SliverView(
        title: titles[index],
        children: [ContentView(index)],
      );

  // This needs to be captured here in a stateful widget
  PlatformTabController tabController;

  @override
  void initState() {
    super.initState();

    // If you want further control of the tabs have one of these
    if (tabController == null) {
      tabController = PlatformTabController(
        initialIndex: 1,
      );
    }
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
