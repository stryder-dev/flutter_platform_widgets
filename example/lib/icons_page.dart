import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'platform_widget_example.dart';

class IconsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      iosContentPadding: true,
      appBar: PlatformAppBar(title: Text('Platform Icons')),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Material',
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Cupertino',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _IconCompared('add', (c) => c.platformIcons.add),
                  _IconCompared(
                      'addCircled', (c) => c.platformIcons.addCircled),
                  _IconCompared('addCircledOutline',
                      (c) => c.platformIcons.addCircledOutline),
                  _IconCompared('addCircledSolid',
                      (c) => c.platformIcons.addCircledSolid),
                  _IconCompared('back', (c) => c.platformIcons.back),
                  _IconCompared('batteryCharging',
                      (c) => c.platformIcons.batteryCharging),
                  _IconCompared(
                      'batteryEmpty', (c) => c.platformIcons.batteryEmpty),
                  _IconCompared(
                      'batteryFull', (c) => c.platformIcons.batteryFull),
                  _IconCompared('bluetooth', (c) => c.platformIcons.bluetooth),
                  _IconCompared('book', (c) => c.platformIcons.book),
                  _IconCompared('bookmark', (c) => c.platformIcons.bookmark),
                  _IconCompared('bookmarkOutline',
                      (c) => c.platformIcons.bookmarkOutline),
                  _IconCompared(
                      'bookmarkSolid', (c) => c.platformIcons.bookmarkSolid),
                  _IconCompared(
                      'brightness', (c) => c.platformIcons.brightness),
                  _IconCompared('brightnessSolid',
                      (c) => c.platformIcons.brightnessSolid),
                  _IconCompared('bus', (c) => c.platformIcons.bus),
                  _IconCompared('car', (c) => c.platformIcons.car),
                  _IconCompared('checkMark', (c) => c.platformIcons.checkMark),
                  _IconCompared('checkMarkCircled',
                      (c) => c.platformIcons.checkMarkCircled),
                  _IconCompared('checkMarkCircledOutline',
                      (c) => c.platformIcons.checkMarkCircledOutline),
                  _IconCompared('checkMarkCircledSolid',
                      (c) => c.platformIcons.checkMarkCircledSolid),
                  _IconCompared('clear', (c) => c.platformIcons.clear),
                  _IconCompared(
                      'clearThick', (c) => c.platformIcons.clearThick),
                  _IconCompared('clearThickCircled',
                      (c) => c.platformIcons.clearThickCircled),
                  _IconCompared(
                      'clockSolid', (c) => c.platformIcons.clockSolid),
                  _IconCompared(
                      'collections', (c) => c.platformIcons.collections),
                  _IconCompared('collectionsSolid',
                      (c) => c.platformIcons.collectionsSolid),
                  _IconCompared('conversationBubble',
                      (c) => c.platformIcons.conversationBubble),
                  _IconCompared('conversationBubbleOutline',
                      (c) => c.platformIcons.conversationBubbleOutline),
                  _IconCompared('create', (c) => c.platformIcons.create),
                  _IconCompared('delete', (c) => c.platformIcons.delete),
                  _IconCompared(
                      'deleteSolid', (c) => c.platformIcons.deleteSolid),
                  _IconCompared(
                      'deleteOutline', (c) => c.platformIcons.deleteOutline),
                  _IconCompared('downArrow', (c) => c.platformIcons.downArrow),
                  _IconCompared('ellipsis', (c) => c.platformIcons.ellipsis),
                  _IconCompared('eyeSolid', (c) => c.platformIcons.eyeSolid),
                  _IconCompared(
                      'favoriteSolid', (c) => c.platformIcons.favoriteSolid),
                  _IconCompared('favoriteOutline',
                      (c) => c.platformIcons.favoriteOutline),
                  _IconCompared('flag', (c) => c.platformIcons.flag),
                  _IconCompared('folder', (c) => c.platformIcons.folder),
                  _IconCompared(
                      'folderOpen', (c) => c.platformIcons.folderOpen),
                  _IconCompared(
                      'folderSolid', (c) => c.platformIcons.folderSolid),
                  _IconCompared('forward', (c) => c.platformIcons.forward),
                  _IconCompared(
                      'fullscreen', (c) => c.platformIcons.fullscreen),
                  _IconCompared(
                      'fullscreenExit', (c) => c.platformIcons.fullscreenExit),
                  _IconCompared(
                      'gameController', (c) => c.platformIcons.gameController),
                  _IconCompared('gameControllerSolid',
                      (c) => c.platformIcons.gameControllerSolid),
                  _IconCompared('gearSolid', (c) => c.platformIcons.gearSolid),
                  _IconCompared('group', (c) => c.platformIcons.group),
                  _IconCompared(
                      'groupSolid', (c) => c.platformIcons.groupSolid),
                  _IconCompared(
                      'heartSolid', (c) => c.platformIcons.heartSolid),
                  _IconCompared('home', (c) => c.platformIcons.home),
                  _IconCompared('info', (c) => c.platformIcons.info),
                  _IconCompared(
                      'leftChevron', (c) => c.platformIcons.leftChevron),
                  _IconCompared('location', (c) => c.platformIcons.location),
                  _IconCompared(
                      'locationSolid', (c) => c.platformIcons.locationSolid),
                  _IconCompared('loop', (c) => c.platformIcons.loop),
                  _IconCompared('mail', (c) => c.platformIcons.mail),
                  _IconCompared('mailSolid', (c) => c.platformIcons.mailSolid),
                  _IconCompared(
                      'mailOutline', (c) => c.platformIcons.mailOutline),
                  _IconCompared('mic', (c) => c.platformIcons.mic),
                  _IconCompared('micOff', (c) => c.platformIcons.micOff),
                  _IconCompared(
                      'micOutline', (c) => c.platformIcons.micOutline),
                  _IconCompared('micSolid', (c) => c.platformIcons.micSolid),
                  _IconCompared('musicNote', (c) => c.platformIcons.musicNote),
                  _IconCompared('padLock', (c) => c.platformIcons.padLock),
                  _IconCompared(
                      'padlockOutline', (c) => c.platformIcons.padlockOutline),
                  _IconCompared(
                      'padlockSolid', (c) => c.platformIcons.padlockSolid),
                  _IconCompared('pause', (c) => c.platformIcons.pause),
                  _IconCompared('pawSolid', (c) => c.platformIcons.pawSolid),
                  _IconCompared('pen', (c) => c.platformIcons.pen),
                  _IconCompared('person', (c) => c.platformIcons.person),
                  _IconCompared('personAdd', (c) => c.platformIcons.personAdd),
                  _IconCompared(
                      'personAddSolid', (c) => c.platformIcons.personAddSolid),
                  _IconCompared(
                      'personOutline', (c) => c.platformIcons.personOutline),
                  _IconCompared(
                      'personSolid', (c) => c.platformIcons.personSolid),
                  _IconCompared('phone', (c) => c.platformIcons.phone),
                  _IconCompared(
                      'phoneSolid', (c) => c.platformIcons.phoneSolid),
                  _IconCompared(
                      'photoCamera', (c) => c.platformIcons.photoCamera),
                  _IconCompared('photoCameraSolid',
                      (c) => c.platformIcons.photoCameraSolid),
                  _IconCompared('playArrow', (c) => c.platformIcons.playArrow),
                  _IconCompared(
                      'playArrowSolid', (c) => c.platformIcons.playArrowSolid),
                  _IconCompared('refresh', (c) => c.platformIcons.refresh),
                  _IconCompared(
                      'refreshBold', (c) => c.platformIcons.refreshBold),
                  _IconCompared('reply', (c) => c.platformIcons.reply),
                  _IconCompared('replyAll', (c) => c.platformIcons.replyAll),
                  _IconCompared(
                      'rightChevron', (c) => c.platformIcons.rightChevron),
                  _IconCompared('search', (c) => c.platformIcons.search),
                  _IconCompared('settings', (c) => c.platformIcons.settings),
                  _IconCompared(
                      'settingsSolid', (c) => c.platformIcons.settingsSolid),
                  _IconCompared('share', (c) => c.platformIcons.share),
                  _IconCompared(
                      'shareSolid', (c) => c.platformIcons.shareSolid),
                  _IconCompared(
                      'shoppingCart', (c) => c.platformIcons.shoppingCart),
                  _IconCompared('shuffle', (c) => c.platformIcons.shuffle),
                  _IconCompared('star', (c) => c.platformIcons.star),
                  _IconCompared(
                      'switchCamera', (c) => c.platformIcons.switchCamera),
                  _IconCompared('switchCameraSolid',
                      (c) => c.platformIcons.switchCameraSolid),
                  _IconCompared('tag', (c) => c.platformIcons.tag),
                  _IconCompared(
                      'tagOutline', (c) => c.platformIcons.tagOutline),
                  _IconCompared('tagSolid', (c) => c.platformIcons.tagSolid),
                  _IconCompared('thumbDown', (c) => c.platformIcons.thumbDown),
                  _IconCompared('thumbDownOutlined',
                      (c) => c.platformIcons.thumbDownOutlined),
                  _IconCompared('thumbUp', (c) => c.platformIcons.thumbUp),
                  _IconCompared('thumbUpOutlined',
                      (c) => c.platformIcons.thumbUpOutlined),
                  _IconCompared('time', (c) => c.platformIcons.time),
                  _IconCompared('timeSolid', (c) => c.platformIcons.timeSolid),
                  _IconCompared('train', (c) => c.platformIcons.train),
                  _IconCompared('upArrow', (c) => c.platformIcons.upArrow),
                  _IconCompared(
                      'videoCamera', (c) => c.platformIcons.videoCamera),
                  _IconCompared('videoCameraSolid',
                      (c) => c.platformIcons.videoCameraSolid),
                  _IconCompared(
                      'volumnDown', (c) => c.platformIcons.volumnDown),
                  _IconCompared(
                      'volumnMute', (c) => c.platformIcons.volumnMute),
                  _IconCompared('volumnOff', (c) => c.platformIcons.volumnOff),
                  _IconCompared('volumnUp', (c) => c.platformIcons.volumnUp),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IconCompared extends StatelessWidget {
  _IconCompared(this.title, this.icon);

  final String title;
  final IconData Function(BuildContext context) icon;

  @override
  Widget build(BuildContext context) {
    return PlatformWidgetExample(
      title: title,
      builder: (context, platform) => Icon(icon(context)),
    );
  }
}
