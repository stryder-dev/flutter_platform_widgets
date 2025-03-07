import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class PlatformSliverAppBarPage extends StatefulWidget {
  const PlatformSliverAppBarPage({super.key});

  @override
  State<PlatformSliverAppBarPage> createState() =>
      _PlatformSliverAppBarPageState();
}

class _PlatformSliverAppBarPageState extends State<PlatformSliverAppBarPage> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const PlatformSliverAppBar(
            title: Text('Sliver App Bar'),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: PlatformText('$index',
                        textScaler: const TextScaler.linear(5)),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
