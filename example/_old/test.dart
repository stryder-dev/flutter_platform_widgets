import 'package:flutter/widgets.dart';
import '../lib/flutter_platform_widgets.dart';

import 'package:flutter/cupertino.dart'
    show CupertinoNavigationBar, CupertinoPageScaffold;
import 'package:flutter/material.dart'
    show Theme, Colors, RaisedButton, Material;

class Test extends StatefulWidget {
  Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  bool solidNav = true;
  bool safeTop = true;
  bool useCuprtino = false;

  @override
  Widget build(BuildContext context) {
    if (useCuprtino) {
      return CupertinoPageScaffold(
        navigationBar: _buildAppBarCupertino(),
        child: Material(
          child: _buildBody(),
        ),
      );
    } else {
      return PlatformScaffold(
        appBar: _buildAppBar(),
        body: Material(
          child: _buildBody(),
        ),
      );
    }
  }

  Widget _buildAppBarCupertino() {
    return CupertinoNavigationBar(
      backgroundColor: solidNav ? Colors.black : Color(0xCCF8F8F8),
      middle: Text(
        "test cupertino",
        style: Theme.of(context).textTheme.title.copyWith(
              color: solidNav ? Colors.white : Colors.black,
            ),
      ),
    );
  }

  Widget _buildAppBar() {
    return PlatformAppBar(
      title: Text(
        "test",
        style: Theme.of(context).textTheme.title.copyWith(
              color: solidNav ? Colors.white : Colors.black,
            ),
      ),
      ios: (BuildContext context) => _buildAppBariOS(),
    );
  }

  CupertinoNavigationBarData _buildAppBariOS() {
    return CupertinoNavigationBarData(
      backgroundColor: solidNav ? Colors.black : null,
    );
  }

  Widget _buildBody() {
    Widget body = Container(
      color: Colors.grey,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Solid navbar with SafeArea:top=false"),
              onPressed: () {
                setState(() {
                  solidNav = true;
                  safeTop = false;
                });
              },
            ),
            RaisedButton(
              child: Text("Solid navbar with SafeArea:top=true"),
              onPressed: () {
                setState(() {
                  solidNav = true;
                  safeTop = true;
                });
              },
            ),
            RaisedButton(
              child: Text("Translucent navbar with SafeArea:top=true"),
              onPressed: () {
                setState(() {
                  solidNav = false;
                  safeTop = true;
                });
              },
            ),
            RaisedButton(
              child: Text("Translucent navbar with SafeArea:top=false"),
              onPressed: () {
                setState(() {
                  solidNav = false;
                  safeTop = false;
                });
              },
            ),
            RaisedButton(
              child: Text("Toggle using Cupertino / Platform Widgets"),
              onPressed: () {
                setState(() {
                  useCuprtino = !useCuprtino;
                });
              },
            ),
            Text(useCuprtino ? "Cupertino Widget" : "Platform Widget")
          ],
        ),
      ),
    );

    return SafeArea(
      top: safeTop,
      child: body,
    );
  }
}
