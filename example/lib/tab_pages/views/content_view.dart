import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../extensions.dart';
import 'sub_page.dart';

class ContentView extends StatefulWidget {
  final int index;
  final TargetPlatform platform;

  const ContentView(this.index, this.platform, {Key? key}) : super(key: key);

  @override
  _ContentViewState createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  late int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PlatformElevatedButton(
              child: Text('Back'),
              onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
            ),
          ),
          Text('Viewing Tab ${widget.index}'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PlatformElevatedButton(
              child: Text('Push to subpage'),
              onPressed: () => Navigator.push(
                context,
                platformPageRoute(
                  context: context,
                  builder: (context) => ((context) {
                    if (widget.index == 0) {
                      return SubPage('Flag', 1, widget.platform);
                    }
                    return SubPage('Book', 1, widget.platform);
                  }).asPlatform(widget.platform),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PlatformElevatedButton(
              child: Text('Increment'),
              onPressed: () => setState(() => counter++),
            ),
          ),
          Text('Counter: $counter'),
        ],
      ),
    );
  }
}
