import 'package:example/tabbed/views/content_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class OriginalTabbedPage extends StatefulWidget {
  @override
  _OriginalTabbedPageState createState() => _OriginalTabbedPageState();
}

class _OriginalTabbedPageState extends State<OriginalTabbedPage> {
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
      appBarBuilder: (_, index) => PlatformAppBar(
        title: Text('Page Title'),
        cupertino: (_, __) => CupertinoNavigationBarData(
          title: Text('Title: ${titles[index]}'),
          //   only required if useCupertinoTabView = false,
          transitionBetweenRoutes: false,
        ),
      ),
      bodyBuilder: (context, index) => ContentView(index),
      items: items(context),
      cupertino: (_, __) => CupertinoTabScaffoldData(
        //   Having this property as false (default true) forces it not to use CupertinoTabView which will show
        //   the back button, but does required transitionBetweenRoutes set to false (see above)
        useCupertinoTabView: false,
      ),
    );
  }
}
