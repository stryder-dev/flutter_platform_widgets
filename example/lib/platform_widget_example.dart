import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'extensions.dart';

class PlatformWidgetExample extends StatelessWidget {
  final Widget Function(BuildContext context, TargetPlatform platform) builder;
  final String title;

  const PlatformWidgetExample({
    Key? key,
    required this.builder,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text(title),
        ),
        IntrinsicHeight(
          child: Row(
            children: [
              ((context) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: builder(context, TargetPlatform.android),
                    ),
                  )).asMaterial(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: VerticalDivider(
                  width: 1,
                  thickness: 1,
                ),
              ),
              ((context) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: builder(context, TargetPlatform.iOS),
                    ),
                  )).asCupertino(),
            ],
          ).maxWidth(500),
        ),
        Divider(
          height: 16,
          thickness: 2,
        ),
      ],
    );
  }
}
