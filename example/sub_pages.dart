import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import '../lib/flutter_platform_widgets.dart';

class SubPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('Sub page 1'),
      ),
      body: Material(
        child: Center(
          child: Text('Sub Page 1'),
        ),
      ),
    );
  }
}

class SubPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('Sub page 2'),
      ),
      body: Material(
        child: Center(
          child: Text('Sub Page 2'),
        ),
      ),
    );
  }
}
