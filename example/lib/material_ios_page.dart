import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

/// Page to show what material widgets look like on cupertino
class IosMaterialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('iOS with Material'),
      ),
      body: ListView(
        children: [
          IconButton(
            icon: Icon(Icons.book),
            onPressed: () {},
          ),
          Divider(
            thickness: 6,
          ),
          ListTile(
            title: Text('List Tile title'),
            subtitle: Text('sub title'),
            onTap: () {},
            trailing: Icon(Icons.place),
          ),
        ],
      ),
    );
  }
}
