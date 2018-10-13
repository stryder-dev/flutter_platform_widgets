import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../lib/flutter_platform_widgets.dart';

class SubPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> words = [
      'abacus',
      'abdomen',
      'abdominal',
      'abide',
      'abiding',
      'ability',
      'ablaze',
      'able',
      'abnormal',
      'abrasion',
      'abrasive',
      'abreast',
      'abridge',
      'abroad',
      'abruptly',
      'absence',
      'absentee',
      'absently',
      'absinthe',
      'absolute',
      'absolve',
      'abstain',
      'abstract',
      'absurd',
      'accent',
      'acclaim',
      'acclimate'
    ];

    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('Sub page 1'),
      ),
      body: Material(
        child: ListView(
          children: words
              .map(
                (w) => ListTile(
                      title: Text(w),
                    ),
              )
              .toList(),
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
