/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoIcons, CupertinoPageRoute;
import 'package:flutter/material.dart'
    show
        showDialog,
        Theme,
        DefaultTextStyle,
        Colors,
        FloatingActionButton,
        BottomNavigationBarType,
        MaterialPageRoute,
        Icons;
import 'package:flutter/widgets.dart';

import '../lib/flutter_platform_widgets.dart';
import 'sub_pages.dart';

class ExamplePage extends StatefulWidget {
  ExamplePage({Key key}) : super(key: key);

  @override
  _ExamplePageState createState() => new _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  int _selectedTabIndex = 0;

  void _showSubPage() {
//need for ios different navigation stacks so the bottom tab bar does not hide
//https://stackoverflow.com/questions/46502751/how-to-use-multiple-navigators
//https://stackoverflow.com/questions/45511549/permanent-view-with-navigation-bar-in-flutter
//https://github.com/flutter/flutter/blob/9909e773dc66608a866efa7388f39127509d0e1e/packages/flutter/lib/src/cupertino/tab_view.dart
//https://stackoverflow.com/questions/46483949/how-to-get-current-route-path-in-flutter

    if (isMaterial) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => SubPage1()));
    } else {
      Navigator.push(context, CupertinoPageRoute(builder: (_) => SubPage1()));
    }
  }

  void showExampleAlertDialog() {
    showDialog(
        context: context,
        builder: (_) => PlatformAlertDialog(
              title: Text('Alert'),
              content: Text('Some content'),
              actions: <Widget>[
                PlatformDialogAction(
                  android: (_) => MaterialDialogActionData(),
                  ios: (_) => CupertinoDialogActionData(),
                  child: PlatformText('Cancel'),
                  onPressed: () => Navigator.pop(context),
                ),
                PlatformDialogAction(
                  child: PlatformText('OK'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ));
  }

  Widget _buildContent() {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.body1,
      child: Center(
        child: Column(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Standard Text',
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformText(
                'Platform Text - (uppercase in Android)',
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformButton(
                onPressed: () => showExampleAlertDialog(),
                child: PlatformText('Show Alert Dialog'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformButton(
                onPressed: () => setState(() => changeToMaterialPlatform()),
                child: PlatformText('Switch to Material'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformButton(
                onPressed: () => setState(() => changeToCupertinoPlatform()),
                child: Text('Switch to Cupertino'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformButton(
                onPressed: () => _showSubPage(),
                child: Text('Display Sub Page'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformCircularProgressIndicator(
                ios: (_) => CupertinoProgressIndicatorData(radius: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return PlatformNavBar(
      currentIndex: _selectedTabIndex,
      itemChanged: (index) => setState(
            () {
              _selectedTabIndex = index;
            },
          ),
      android: (_) => MaterialNavBarData(
            backgroundColor: Colors.lightBlue,
            type: BottomNavigationBarType.fixed,
          ),
      items: [
        BottomNavigationBarItem(
          title: Text('Flag'),
          icon: PlatformWidget(
            ios: (_) => Icon(
                  CupertinoIcons.flag,
                ),
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
        BottomNavigationBarItem(
          title: Text('Phone'),
          icon: PlatformWidget(
            ios: (_) => Icon(CupertinoIcons.phone),
            android: (_) => Icon(Icons.phone),
          ),
        ),
        BottomNavigationBarItem(
          title: Text('Home'),
          icon: PlatformWidget(
            ios: (_) => Icon(CupertinoIcons.home),
            android: (_) => Icon(Icons.home),
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    return PlatformAppBar(
      title: new Text(
        'Platform Widgets',
      ),
      leading: PlatformIconButton(
        onPressed: () {},
        iosIcon: Icon(
          CupertinoIcons.info,
          size: 28.0,
          color: Theme.of(context).primaryColor,
        ),
        androidIcon: Icon(Icons.info),
      ),
      trailingActions: <Widget>[
        PlatformIconButton(
          ios: (_) => CupertinoIconButtonData(
                onPressed: () {
                  print('ios onpressed');
                },
              ),
          onPressed: () {
            print('onpressed');
          },
          iosIcon: Icon(
            CupertinoIcons.share,
            size: 28.0,
          ),
          androidIcon: Icon(Icons.share),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: _buildAppBar(),
      body: _buildContent(),
      bottomNavBar: _buildBottomNavBar(),
      android: (_) => MaterialScaffoldData(
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {},
            ),
          ),
    );
  }
}
