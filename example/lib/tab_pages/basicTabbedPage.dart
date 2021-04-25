import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import './views/content_view.dart';
import '../extensions.dart';

class BasicTabbedPage extends StatefulWidget {
  final TargetPlatform platform;

  const BasicTabbedPage({Key? key, required this.platform}) : super(key: key);

  @override
  _BasicTabbedPageState createState() => _BasicTabbedPageState();
}

class _BasicTabbedPageState extends State<BasicTabbedPage> {
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

  late List<Widget> tabs;

  @override
  void initState() {
    super.initState();

    // If you want further control of the tabs have one of these
    tabController = PlatformTabController(
      initialIndex: 1,
    );

    tabs = [
      ContentView(
        0,
        widget.platform,
        key: ValueKey('key0'),
      ),
      ContentView(
        1,
        widget.platform,
        key: ValueKey('key1'),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PlatformTabScaffold(
      iosContentPadding: true,
      tabController: tabController,
      appBarBuilder: (_, index) => PlatformAppBar(
        title: Text('${widget.platform.text} Page Title'),
        trailingActions: <Widget>[
          PlatformIconButton(
            padding: EdgeInsets.zero,
            icon: Icon(context.platformIcons.share),
            onPressed: () {},
          ),
        ],
        cupertino: (_, __) => CupertinoNavigationBarData(
          title: Text('${titles[index]}'),
        ),
      ),
      bodyBuilder: (context, index) => IndexedStack(
        index: index,
        children: tabs,
      ),
      items: items(context),
    );
  }
}
