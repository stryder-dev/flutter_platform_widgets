import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart' show ThemeData, Colors, Icons, Theme;
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'lib/listViewHeaderPage.dart';
import 'lib/listViewPage.dart';
import 'lib/tabbedPage.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => App();
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final themeData = new ThemeData(
      primarySwatch: Colors.purple,
    );

    return Theme(
      data: themeData,
      child: PlatformApp(
        title: 'Flutter Platform Widgets',
        android: (_) => new MaterialAppData(theme: themeData),
        home: LandingPage(() => _switchPlatform()),
      ),
    );
  }

  /*
      Need to redraw at the PlatformApp level when switching platforms
    */
  _switchPlatform() {
    if (isMaterial) {
      setState(() => changeToCupertinoPlatform());
    } else {
      setState(() => changeToMaterialPlatform());
    }
  }
}

class LandingPage extends StatefulWidget {
  final VoidCallback switchPlatform;

  LandingPage(this.switchPlatform);

  @override
  LandingPageState createState() {
    return LandingPageState();
  }
}

class LandingPageState extends State<LandingPage> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      iosContentPadding: true,
      appBar: PlatformAppBar(
        title: Text('Flutter Platform Widgets'),
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
              onPressed: () => widget.switchPlatform(),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformIconButton(
                androidIcon: Icon(Icons.home),
                iosIcon: Icon(CupertinoIcons.home),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformSwitch(
                value: switchValue,
                onChanged: (bool value) => setState(() => switchValue = value),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformTextField(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformCircularProgressIndicator(),
            ),
            Divider(),
            SectionHeader(title: '3. Dialogs'),
            PlatformButton(
              child: PlatformText('Show Dialog'),
              onPressed: () => _showExampleDialog(),
            ),
            Divider(),
            SectionHeader(title: '4. Navigation'),
            PlatformButton(
              child: PlatformText('Open Tabbed Page'),
              onPressed: () => _openPage((_) => new TabbedPage()),
            ),
            Divider(),
            SectionHeader(title: '5. Advanced'),
            PlatformButton(
              child: PlatformText('Page with ListView'),
              onPressed: () => _openPage((_) => new ListViewPage()),
            ),
            PlatformWidget(
              android: (_) => Container(), //this is for iOS only
              ios: (_) => PlatformButton(
                    child: PlatformText('iOS Page with Colored Header'),
                    onPressed: () => _openPage((_) => new ListViewHeaderPage()),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  _openPage(WidgetBuilder pageToDisplayBuilder) {
    Navigator.push(
      context,
      platformPageRoute(
        builder: pageToDisplayBuilder,
      ),
    );
  }

  _showExampleDialog() {
    showPlatformDialog(
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
          ),
    );
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
