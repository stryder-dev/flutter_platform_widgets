import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart' show Icons, showDialog;
import 'package:flutter/widgets.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class LandingPage extends StatefulWidget {
  @override
  LandingPageState createState() {
    return LandingPageState();
  }
}

class LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      iosContentPadding: true,
      appBar: PlatformAppBar(
        title: Text('Platform Widgets'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Primary concept of this package is to use the same widgets to create iOS (Cupertino) or Android (Material) looking apps rather than needing to discover what widgets to use.'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'This approach is best when both iOS and Android apps follow the same design in layout and navigation, but need to look as close to native styling as possible.'),
            ),
            Divider(),
            SectionHeader(title: '1. Change Platform'),
            PlatformButton(
              child: PlatformText('Switch Platform'),
              onPressed: () => _switchPlatform(),
            ),
            PlatformWidget(
              android: (_) => Text('Currently showing Material'),
              ios: (_) => Text('Currently showing Cupertino'),
            ),
            Text('Scaffold: PlatformScaffold'),
            Text('AppBar: PlatformAppBar'),
            Divider(),
            SectionHeader(title: '2. Basic Widgets'),
            PlatformText(
              'PlatformText will uppercase for Material only',
              textAlign: TextAlign.center,
            ),
            PlatformButton(
              child: PlatformText('PlatformButton'),
              onPressed: () {},
            ),
            PlatformIconButton(
              androidIcon: Icon(Icons.home),
              iosIcon: Icon(CupertinoIcons.home),
              onPressed: () {},
            ),
            //PlatformCircularProgressIndicator(),
            Divider(),
            SectionHeader(title: '3. Dialogs'),
            PlatformButton(
              child: PlatformText('Show Dialog'),
              onPressed: () => _showExampleDialog(),
            ),
            Divider(),
            SectionHeader(title: '4. Navigation'),
            PlatformButton(
              child: PlatformText('Open Page'),
              onPressed: () {},
            ),
            PlatformButton(
              child: PlatformText('Open Modal'),
              onPressed: () {},
            ),
            PlatformButton(
              child: PlatformText('Open Tabbed Page'),
              onPressed: () {},
            ),
            Divider(),
            SectionHeader(title: '5. Advanced'),
            Divider(),
            PlatformButton(
              child: PlatformText('Page with ListView'),
              onPressed: () {},
            ),
            PlatformButton(
              child: PlatformText('Page with Colored Header'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  _showExampleDialog() {
    showDialog(
        context: context,
        builder: (_) => PlatformAlertDialog(
              title: Text('Alert'),
              content: Text('Some content'),
              actions: <Widget>[
                PlatformDialogAction(
                  android: (_) => MaterialDialogActionData(),
                  ios: (_) => CupertinoDialogActionData(),
                  child: PlatformText('Cancel'),
                  onPressed: () => Navigator.pop(context),
                ),
                PlatformDialogAction(
                  child: PlatformText('OK'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ));
  }

  _switchPlatform() {
    if (isMaterial) {
      setState(() => changeToCupertinoPlatform());
    } else {
      setState(() => changeToMaterialPlatform());
    }
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({
    @required this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}

class Divider extends StatelessWidget {
  const Divider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.0,
      color: new Color(0xff999999),
      margin: const EdgeInsets.symmetric(vertical: 12.0),
    );
  }
}
