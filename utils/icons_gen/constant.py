import subprocess

# Constant variables of paths
material_icons_relative_path = 'packages/flutter/lib/src/material/icons.dart'
cupertino_icons_relative_path = 'packages/flutter/lib/src/cupertino/icons.dart'
platform_icons_relative_path = './lib/src/platform_icons.dart'
platform_icons_gen_relative_path = './lib/src/platform_icons_gen.dart'
platform_icons_example_page_relative_path = './example/lib/icons_page.dart'

# Code snippets for  header of platform_icons_gen.dart file.
platform_icons_dart_header = """
/// All same name icons of material and cupertino.
/// This file generated by script, do not edit this file directly.

/// Local SDK version information:
""" + '/// ' + subprocess.check_output(['flutter', '--version']).decode('utf-8').rstrip().replace('\n','\n/// ') + """

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform.dart';
import 'platform_icons.dart';

extension PlatformIconsGen on PlatformIcons {
"""


# Code snippets for header of icons_page.dart file (example page).
platform_icons_example_page_header = """
/// Platform Icons Example Page.
/// This file generated by script, do not edit this file directly.

/// Local SDK version information:
""" + '/// ' + subprocess.check_output(['flutter', '--version']).decode('utf-8').rstrip().replace('\n','\n/// ') + """

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'platform_widget_example.dart';

class IconsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      iosContentPadding: true,
      appBar: PlatformAppBar(title: Text('Platform Icons')),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Material',
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Cupertino',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
"""

# Code snippets for end of icons_page.dart file (example page).
platform_icons_example_page_end = """
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IconCompared extends StatelessWidget {
  _IconCompared(this.title, this.icon);

  final String title;
  final IconData Function(BuildContext context) icon;

  @override
  Widget build(BuildContext context) {
    return PlatformWidgetExample(
      title: title,
      showBothPlatforms: true,
      builder: (context, platform) => Icon(icon(context)),
    );
  }
}
"""