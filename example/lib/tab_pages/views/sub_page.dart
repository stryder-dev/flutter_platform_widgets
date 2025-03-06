import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../extensions.dart';

class SubPage extends StatelessWidget {
  const SubPage(this.tab, this.level, this.platform);
  final String tab;
  final int level;
  final TargetPlatform platform;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      iosContentPadding: true,
      appBar: PlatformAppBar(
        title: Text('$tab $level'),
      ),
      body: Column(
        children: [
          Text('Sub Page $tab with $level'),
          PlatformElevatedButton(
            child: const Text('Push to subpage'),
            onPressed: () => Navigator.push(
              context,
              platformPageRoute(
                context: context,
                builder: (context) => ((context) {
                  return SubPage(tab, level + 1, platform);
                }).asPlatform(platform),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
