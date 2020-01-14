import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SubPage extends StatelessWidget {
  SubPage(this.tab, this.level);
  final String tab;
  final int level;

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
          PlatformButton(
            child: Text('Push to subpage'),
            onPressed: () => Navigator.push(
              context,
              platformPageRoute(
                context: context,
                builder: (context) => SubPage(tab, level + 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
