import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart' show CupertinoPageRoute;

import 'sub_pages.dart';

import '../lib/flutter_platform_widgets.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Page 1'),
          PlatformButton(
            child: Text('Nav to Subpage 1'),
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SubPage1(),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Page 2'),
          PlatformButton(
            child: Text('Nav to Subpage 2'),
            onPressed: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => SubPage2(),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Page 3'));
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Page 4'));
  }
}

class Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Page 5'));
  }
}
