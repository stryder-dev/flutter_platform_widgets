import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import './views/content_view.dart';
import '../extensions.dart';

class OriginalTabbedPage extends StatefulWidget {
  final TargetPlatform platform;

  const OriginalTabbedPage({Key? key, required this.platform})
      : super(key: key);

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
  late PlatformTabController tabController;

  @override
  void initState() {
    super.initState();

    // If you want further control of the tabs have one of these
    tabController = PlatformTabController(
      initialIndex: 1,
    )..addListener(_listener);
  }

  void _listener() {
    print('Current index: ${tabController.index(context)}');
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformTabScaffold(
      iosContentPadding: true,
      tabController: tabController,
      appBarBuilder: (_, index) => PlatformAppBar(
        title: Text('${widget.platform.text} Page Title'),
        cupertino: (_, __) => CupertinoNavigationBarData(
          title: Text('Title: ${titles[index]}'),
          //   only required if useCupertinoTabView = false,
          transitionBetweenRoutes: false,
        ),
      ),
      bodyBuilder: (context, index) => ContentView(index, widget.platform),
      items: items(context),
      cupertino: (_, __) => CupertinoTabScaffoldData(
        //   Having this property as false (default true) forces it not to use CupertinoTabView which will show
        //   the back button, but does required transitionBetweenRoutes set to false (see above)
        useCupertinoTabView: false,
      ),
    );
  }
}
