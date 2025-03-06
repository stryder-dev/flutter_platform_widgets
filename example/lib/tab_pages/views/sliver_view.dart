import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SliverView extends StatelessWidget {
  const SliverView({
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        PlatformWidget(
          material: (context, _) => SliverAppBar(
            pinned: true,
            forceElevated: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                title,
                style: TextStyle(
                  color: theme.useMaterial3
                      ? theme.textTheme.headlineLarge?.color
                      : null,
                  // Or any other headline's color
                ),
              ),
            ),
          ),
          cupertino: (context, _) => CupertinoSliverNavigationBar(
            largeTitle: Text(title),
          ),
        ),
        SliverSafeArea(
          top: false, // Top safe area is consumed by the navigation bar.
          sliver: SliverList(
            delegate: SliverChildListDelegate(children),
          ),
        ),
      ],
    );
  }
}
