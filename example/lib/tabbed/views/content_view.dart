import 'package:example/tabbed/pages/sub_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ContentView extends StatelessWidget {
  ContentView(this.index);
  final int index;
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
              builder: (context) {
                if (index == 0) {
                  return SubPage('Flag', 1);
                }
                return SubPage('Book', 1);
              },
            ),
          ),
        ),
      ],
    );
  }
}
