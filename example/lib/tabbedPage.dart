import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart' show Icons, Colors;
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
      iosContentBottomPadding: true,
      appBar: PlatformAppBar(
        title: Text('Platform Widgets'),
        ios: (_) => CupertinoNavigationBarData(
              transitionBetweenRoutes: false,
            ),
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(36),
              color: Colors.limeAccent,
              alignment: Alignment.center,
              child: Text('Content 1'),
            ),
            Container(
              padding: const EdgeInsets.all(36),
              color: Colors.amberAccent,
              alignment: Alignment.center,
              child: Text('Content 2'),
            ),
            Container(
              padding: const EdgeInsets.all(36),
              color: Colors.pinkAccent,
              alignment: Alignment.center,
              child: Text('Content 3'),
            ),
            Container(
              padding: const EdgeInsets.all(36),
              color: Colors.purpleAccent,
              alignment: Alignment.center,
              child: Text('Content 4'),
            ),
            Container(
              padding: const EdgeInsets.all(36),
              color: Colors.deepPurpleAccent,
              alignment: Alignment.center,
              child: Text('Content 5'),
            ),
            Container(
              padding: const EdgeInsets.all(36),
              color: Colors.indigoAccent,
              alignment: Alignment.center,
              child: Text('Content 6'),
            ),
            Container(
              padding: const EdgeInsets.all(36),
              color: Colors.blueAccent,
              alignment: Alignment.center,
              child: Text('Content 7'),
            ),
            Container(
              padding: const EdgeInsets.all(36),
              color: Colors.lightBlueAccent,
              alignment: Alignment.center,
              child: Text('Content 8'),
            ),
            Container(
              padding: const EdgeInsets.all(36),
              color: Colors.tealAccent,
              alignment: Alignment.center,
              child: Text('Content 9'),
            ),
          ],
        ),
      ),
    );
  }
}
