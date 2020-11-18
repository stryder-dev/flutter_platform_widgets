import 'package:example/tabbed/views/content_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class DynamicTabbedPage extends StatefulWidget {
  @override
  _DynamicTabbedPageState createState() => _DynamicTabbedPageState();
}

class _DynamicTabbedPageState extends State<DynamicTabbedPage> {
  static final titles = ['One', 'Two', 'Three'];
  final icons = (BuildContext context) => [
        Icon(context.platformIcons.batteryFull),
        Icon(context.platformIcons.folder),
        Icon(context.platformIcons.shoppingCart),
      ];
  final colors = [
    Colors.amber,
    Colors.cyan,
    Colors.lime,
  ];
  List<BottomNavigationBarItem> Function(BuildContext) items;

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

    items = (BuildContext context) => [
          BottomNavigationBarItem(
            label: titles[0],
            icon: icons(context)[0],
            activeIcon: Icon(icons(context)[0].icon, color: colors[0]),
          ),
          BottomNavigationBarItem(
            label: titles[1],
            icon: icons(context)[1],
            activeIcon: Icon(icons(context)[1].icon, color: colors[1]),
          ),
          BottomNavigationBarItem(
            label: titles[2],
            icon: icons(context)[2],
            activeIcon: Icon(icons(context)[2].icon, color: colors[2]),
          ),
        ];
  }

  @override
  Widget build(BuildContext context) {
    return PlatformTabScaffold(
      iosContentPadding: true,
      tabController: tabController,
      appBarBuilder: (_, index) => PlatformAppBar(
        title: Text('Page Title'),
        backgroundColor: colors[index],
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
      bodyBuilder: (context, index) => ContentView(index),
      items: items(context),
      materialBuilder: (context, __, index) => MaterialTabScaffoldData(
        floatingActionButton: FloatingActionButton(
          child: icons(context)[index],
          backgroundColor: colors[index],
          onPressed: () {},
        ),
      ),
      cupertinoBuilder: (_, __, index) => CupertinoTabScaffoldData(
        backgroundColor: colors[index],
      ),
    );
  }
}
