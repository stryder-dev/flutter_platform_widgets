import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../extensions.dart';
import 'sub_page.dart';

class ContentView extends StatelessWidget {
  final int index;
  final TargetPlatform platform;

  ContentView(this.index, this.platform);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlatformButton(
          child: Text('Back'),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
        ),
        Text('Viewing Tab $index'),
        PlatformButton(
          child: Text('Push to subpage'),
          onPressed: () => Navigator.push(
            context,
            platformPageRoute(
              context: context,
              builder: (context) => ((context) {
                if (index == 0) {
                  return SubPage('Flag', 1, platform);
                }
                return SubPage('Book', 1, platform);
              }).asPlatform(platform),
            ),
          ),
        ),
      ],
    );
  }
}
