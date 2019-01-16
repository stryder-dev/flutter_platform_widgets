import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart' show Icons;
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class TabbedPage extends StatefulWidget {
  @override
  TabbedPageState createState() {
    return new TabbedPageState();
  }
}

class TabbedPageState extends State<TabbedPage> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        iosContentPadding: true,
        appBar: PlatformAppBar(
          title: Text('Platform Widgets'),
        ),
        bottomNavBar: PlatformNavBar(
          currentIndex: _selectedTabIndex,
          itemChanged: (index) => setState(
                () {
                  _selectedTabIndex = index;
                },
              ),
          items: [
            BottomNavigationBarItem(
              title: Text('Flag'),
              icon: PlatformWidget(
                ios: (_) => Icon(CupertinoIcons.flag),
                android: (_) => Icon(Icons.flag),
              ),
            ),
            BottomNavigationBarItem(
              title: Text('Book'),
              icon: PlatformWidget(
                ios: (_) => Icon(CupertinoIcons.book),
                android: (_) => Icon(Icons.book),
              ),
            ),
          ],
        ),
        body: Center(
          child: Text('Tabbed Page'),
        ));
  }
}
