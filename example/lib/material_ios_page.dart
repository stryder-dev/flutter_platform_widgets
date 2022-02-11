import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

/// Page to show what material widgets look like on cupertino
class IosMaterialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('iOS with Material'),
        trailingActions: [
          // This is possible because of PlatformProvider iosUsesMaterialWidgets setting
          IconButton(icon: Icon(Icons.ac_unit), onPressed: () {}),
        ],
        cupertino: (_, __) => CupertinoNavigationBarData(
            // If this is enabled and set to true then the IconButton above will complain of no parent Material widget
            //noMaterialParent: true,
            ),
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
