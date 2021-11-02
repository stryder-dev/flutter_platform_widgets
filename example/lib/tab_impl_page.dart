import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import './tab_pages/basicTabbedPage.dart';
import './tab_pages/dynamicTabbedPage.dart';
import './tab_pages/originalTabbedPage.dart';
import './tab_pages/sliverTabbedPage.dart';
import 'extensions.dart';
import 'platform_widget_example.dart';

class TabImplementationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('Platform Tab Scaffold'),
      ),
      body: ListView(
        children: [
          PlatformWidgetExample(
            title: 'Basic Tabbed Page',
            builder: (_, platform) => PlatformElevatedButton(
              child: Text(platform.text),
              onPressed: () => _openPage(
                context,
                (_) => BasicTabbedPage(platform: platform),
                platform,
              ),
            ),
          ),
          PlatformWidgetExample(
            title: 'Sliver Tabbed Page',
            builder: (_, platform) => PlatformElevatedButton(
              child: Text(platform.text),
              onPressed: () => _openPage(
                context,
                (_) => SliverTabbedPage(platform: platform),
                platform,
              ),
            ),
          ),
          PlatformWidgetExample(
            title: 'Original Tabbed Page',
            builder: (_, platform) => PlatformElevatedButton(
              child: Text(platform.text),
              onPressed: () => _openPage(
                context,
                (_) => OriginalTabbedPage(platform: platform),
                platform,
              ),
            ),
          ),
          PlatformWidgetExample(
            title: 'Dynamic Tabbed Page',
            builder: (_, platform) => PlatformElevatedButton(
              child: Text(platform.text),
              onPressed: () => _openPage(
                context,
                (_) => DynamicTabbedPage(platform: platform),
                platform,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

_openPage(
  BuildContext context,
  WidgetBuilder pageToDisplayBuilder,
  TargetPlatform platform,
) {
  Navigator.push(
    context,
    platformPageRoute(
      context: context,
      builder: (context) => pageToDisplayBuilder.asPlatform(platform),
    ),
  );
}
