import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform.dart';

extension PlatformIconsExt on BuildContext {
  /// Render either a Material or Cupertino icon based on the platform
  PlatformIcons get platformIcons => PlatformIcons(this);
}

class PlatformIcons {
  PlatformIcons(this.context);

  final BuildContext context;

  /// Icons: Icons.add : CupertinoIcons.add
  IconData get add => isMaterial(context) ? Icons.add : CupertinoIcons.add;

  /// Icons: Icons.add_circle : CupertinoIcons.add_circled
  IconData get addCircled =>
      isMaterial(context) ? Icons.add_circle : CupertinoIcons.add_circled;

  /// Icons: Icons.add_circle_outline : CupertinoIcons.add_circled
  IconData get addCircledOutline => isMaterial(context)
      ? Icons.add_circle_outline
      : CupertinoIcons.add_circled;

  /// Icons: Icons.add_circle : CupertinoIcons.add_circled_solid
  IconData get addCircledSolid =>
      isMaterial(context) ? Icons.add_circle : CupertinoIcons.add_circled_solid;

  /// Icons: Icons.arrow_back : CupertinoIcons.back
  IconData get back =>
      isMaterial(context) ? Icons.arrow_back : CupertinoIcons.back;

  // IconData get battery25Percent =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.battery_25_percent;

  // IconData get battery75Percent =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.battery_75_percent;

  /// Icons: Icons.battery_charging_full : CupertinoIcons.battery_charging
  IconData get batteryCharging => isMaterial(context)
      ? Icons.battery_charging_full
      : CupertinoIcons.battery_charging;

  /// Icons: Icons.battery_alert : CupertinoIcons.battery_empty
  IconData get batteryEmpty =>
      isMaterial(context) ? Icons.battery_alert : CupertinoIcons.battery_empty;

  /// Icons: Icons.battery_full : CupertinoIcons.battery_full
  IconData get batteryFull =>
      isMaterial(context) ? Icons.battery_full : CupertinoIcons.battery_full;

  // IconData get bell => isMaterial(context) ? Icons. : CupertinoIcons.bell;

  // IconData get bellSolid =>
  //     isMaterial(context) ? Icons.flag : CupertinoIcons.bell_solid;

  /// Icons: Icons.bluetooth : CupertinoIcons.bluetooth
  IconData get bluetooth =>
      isMaterial(context) ? Icons.bluetooth : CupertinoIcons.bluetooth;

  /// Icons: Icons.book : CupertinoIcons.book
  IconData get book => isMaterial(context) ? Icons.book : CupertinoIcons.book;

  // IconData get bookSolid =>
  //     isMaterial(context) ? Icons.book : CupertinoIcons.book_solid;

  /// Icons: Icons.bookmark : CupertinoIcons.bookmark
  IconData get bookmark =>
      isMaterial(context) ? Icons.bookmark : CupertinoIcons.bookmark;

  /// Icons: Icons.bookmark : CupertinoIcons.bookmark_solid
  IconData get bookmarkSolid =>
      isMaterial(context) ? Icons.bookmark : CupertinoIcons.bookmark_solid;

  /// Icons: Icons.bookmark_border : CupertinoIcons.bookmark
  IconData get bookmarkOutline =>
      isMaterial(context) ? Icons.bookmark_border : CupertinoIcons.bookmark;

  /// Icons: Icons.brightness_low : CupertinoIcons.brightness
  IconData get brightness =>
      isMaterial(context) ? Icons.brightness_low : CupertinoIcons.brightness;

  /// Icons: Icons.brightness_high : CupertinoIcons.brightness_solid
  IconData get brightnessSolid => isMaterial(context)
      ? Icons.brightness_high
      : CupertinoIcons.brightness_solid;

  /// Icons: Icons.directions_bus : CupertinoIcons.bus
  IconData get bus =>
      isMaterial(context) ? Icons.directions_bus : CupertinoIcons.bus;

  /// Icons: Icons.directions_car : CupertinoIcons.car
  IconData get car =>
      isMaterial(context) ? Icons.directions_car : CupertinoIcons.car;

  // IconData get carDetailed =>
  //     isMaterial(context) ? Icons.book : CupertinoIcons.car_detailed;

  /// Icons: Icons.check : CupertinoIcons.check_mark
  IconData get checkMark =>
      isMaterial(context) ? Icons.check : CupertinoIcons.check_mark;

  /// Icons: Icons.check_circle : CupertinoIcons.check_mark_circled
  IconData get checkMarkCircled => isMaterial(context)
      ? Icons.check_circle
      : CupertinoIcons.check_mark_circled;

  /// Icons: Icons.check_circle : CupertinoIcons.check_mark_circled_solid
  IconData get checkMarkCircledSolid => isMaterial(context)
      ? Icons.check_circle
      : CupertinoIcons.check_mark_circled_solid;

  /// Icons: Icons.check_circle_outline : CupertinoIcons.check_mark_circled
  IconData get checkMarkCircledOutline => isMaterial(context)
      ? Icons.check_circle_outline
      : CupertinoIcons.check_mark_circled;

  // IconData get circle =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.circle;

  // IconData get circleFilled =>
  //     isMaterial(context) ? Icons.book : CupertinoIcons.circle_filled;

  /// Icons: Icons.clear : CupertinoIcons.clear
  IconData get clear =>
      isMaterial(context) ? Icons.clear : CupertinoIcons.clear;

  // IconData get clearCircled =>
  //     isMaterial(context) ? Icons.clear : CupertinoIcons.clear_circled;

  // IconData get clearCircledSolid =>
  //     isMaterial(context) ? Icons.clear : CupertinoIcons.clear_circled_solid;

  /// Icons: Icons.clear : CupertinoIcons.clear_thick
  IconData get clearThick =>
      isMaterial(context) ? Icons.clear : CupertinoIcons.clear_thick;

  /// Icons: Icons.collections : CupertinoIcons.collections
  IconData get clearThickCircled =>
      isMaterial(context) ? Icons.cancel : CupertinoIcons.clear_thick_circled;

  // IconData get clock => isMaterial(context) ? Icons. : CupertinoIcons.clock;

  /// Icons: Icons.watch_later : CupertinoIcons.clock_solid
  IconData get clockSolid =>
      isMaterial(context) ? Icons.watch_later : CupertinoIcons.clock_solid;

  /// Icons: Icons.collections : CupertinoIcons.collections
  IconData get collections =>
      isMaterial(context) ? Icons.collections : CupertinoIcons.collections;

  /// Icons: Icons.collections : CupertinoIcons.collections_solid
  IconData get collectionsSolid => isMaterial(context)
      ? Icons.collections
      : CupertinoIcons.collections_solid;

  /// Icons: Icons.chat_bubble : CupertinoIcons.conversation_bubble
  IconData get conversationBubble => isMaterial(context)
      ? Icons.chat_bubble
      : CupertinoIcons.conversation_bubble;

  /// Icons: Icons.chat_bubble_outline : CupertinoIcons.conversation_bubble
  IconData get conversationBubbleOutline => isMaterial(context)
      ? Icons.chat_bubble_outline
      : CupertinoIcons.conversation_bubble;

  // IconData get conversationBubbleSolid => isMaterial(context)
  //     ? Icons.chat_bubble
  //     : CupertinoIcons.conversation_bubble;

  /// Icons: Icons.create : CupertinoIcons.create
  IconData get create =>
      isMaterial(context) ? Icons.create : CupertinoIcons.create;

  // IconData get createSolid =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.create_solid;

  /// Icons: Icons.dehaze : CupertinoIcons.(custom)
  IconData get dehaze => isMaterial(context)
      ? Icons.dehaze
      : const IconData(0xf394,
          fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons');

  /// Icons: Icons.delete : CupertinoIcons.delete
  IconData get delete =>
      isMaterial(context) ? Icons.delete : CupertinoIcons.delete;

  // IconData get deleteSimple =>
  //     isMaterial(context) ? Icons.delete : CupertinoIcons.delete_simple;

  /// Icons: Icons.delete : CupertinoIcons.delete_solid
  IconData get deleteSolid =>
      isMaterial(context) ? Icons.delete : CupertinoIcons.delete_solid;

  /// Icons: Icons.delete_outline : CupertinoIcons.delete
  IconData get deleteOutline =>
      isMaterial(context) ? Icons.delete_outline : CupertinoIcons.delete;

  /// Icons: Icons.done : CupertinoIcons.(custom)
  IconData get done => isMaterial(context)
      ? Icons.done
      : const IconData(0xf383,
          fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons');

  // IconData get doubleMusicNote =>
  //     isMaterial(context) ? Icons.music_note : CupertinoIcons.double_music_note;

  /// Icons: Icons.arrow_downward : CupertinoIcons.down_arrow
  IconData get downArrow =>
      isMaterial(context) ? Icons.arrow_downward : CupertinoIcons.down_arrow;

  /// Icons: Icons.more_horiz : CupertinoIcons.ellipsis
  IconData get ellipsis =>
      isMaterial(context) ? Icons.more_horiz : CupertinoIcons.ellipsis;

  /// Icons: Icons.error : CupertinoIcons.(custom)
  IconData get error => isMaterial(context)
      ? Icons.error
      : const IconData(0xf35b,
          fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons');

  // IconData get eye => isMaterial(context) ? Icons. : CupertinoIcons.eye;

  /// Icons: Icons.visibility : CupertinoIcons.eye_solid
  IconData get eyeSolid =>
      isMaterial(context) ? Icons.visibility : CupertinoIcons.eye_solid;

  /// Icons: Icons.favorite : CupertinoIcons.heart_solid
  IconData get favoriteSolid =>
      isMaterial(context) ? Icons.favorite : CupertinoIcons.heart_solid;

  /// Icons: Icons.favorite_border : CupertinoIcons.heart
  IconData get favoriteOutline =>
      isMaterial(context) ? Icons.favorite_border : CupertinoIcons.heart;

  /// Icons: Icons.flag : CupertinoIcons.flag
  IconData get flag => isMaterial(context) ? Icons.flag : CupertinoIcons.flag;

  /// Icons: Icons.folder : CupertinoIcons.folder
  IconData get folder =>
      isMaterial(context) ? Icons.folder : CupertinoIcons.folder;

  /// Icons: Icons.folder_open : CupertinoIcons.folder_open
  IconData get folderOpen =>
      isMaterial(context) ? Icons.folder_open : CupertinoIcons.folder_open;

  /// Icons: Icons.folder : CupertinoIcons.folder_solid
  IconData get folderSolid =>
      isMaterial(context) ? Icons.folder : CupertinoIcons.folder_solid;

  /// Icons: Icons.arrow_forward : CupertinoIcons.forward
  IconData get forward =>
      isMaterial(context) ? Icons.arrow_forward : CupertinoIcons.forward;

  /// Icons: Icons.fullscreen : CupertinoIcons.fullscreen
  IconData get fullscreen =>
      isMaterial(context) ? Icons.fullscreen : CupertinoIcons.fullscreen;

  /// Icons:
  IconData get fullscreenExit => isMaterial(context)
      ? Icons.fullscreen_exit
      : CupertinoIcons.fullscreen_exit;

  /// Icons: Icons.gamepad : CupertinoIcons.game_controller
  IconData get gameController =>
      isMaterial(context) ? Icons.gamepad : CupertinoIcons.game_controller;

  /// Icons: Icons.games : CupertinoIcons.game_controller_solid
  IconData get gameControllerSolid =>
      isMaterial(context) ? Icons.games : CupertinoIcons.game_controller_solid;

  // IconData get gear => isMaterial(context) ? Icons. : CupertinoIcons.gear;

  // IconData get gearBig =>
  //     isMaterial(context) ? Icons.flag : CupertinoIcons.gear_big;

  /// Icons: Icons.settings : CupertinoIcons.gear_solid
  IconData get gearSolid =>
      isMaterial(context) ? Icons.settings : CupertinoIcons.gear_solid;

  /// Icons: Icons.group : CupertinoIcons.group
  IconData get group =>
      isMaterial(context) ? Icons.group : CupertinoIcons.group;

  /// Icons: Icons.group : CupertinoIcons.group_solid
  IconData get groupSolid =>
      isMaterial(context) ? Icons.group : CupertinoIcons.group_solid;

  // IconData get heart => isMaterial(context) ? Icons. : CupertinoIcons.heart;

  /// Icons: Icons.favorite : CupertinoIcons.heart_solid
  IconData get heartSolid =>
      isMaterial(context) ? Icons.favorite : CupertinoIcons.heart_solid;

  /// Icons: Icons.help : CupertinoIcons.(custom)
  IconData get help => isMaterial(context)
      ? Icons.help
      : const IconData(0xf446,
          fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons');

  /// Icons: Icons.helOutline : CupertinoIcons.(custom)
  IconData get helpOutline => isMaterial(context)
      ? Icons.help_outline
      : const IconData(0xf445,
          fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons');

  /// Icons: Icons.home : CupertinoIcons.home
  IconData get home => isMaterial(context) ? Icons.home : CupertinoIcons.home;

  /// Icons: Icons.info : CupertinoIcons.info
  IconData get info => isMaterial(context) ? Icons.info : CupertinoIcons.info;

  // IconData get labFlask =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.lab_flask;

  // IconData get labFlaskSolid =>
  //     isMaterial(context) ? Icons.flag : CupertinoIcons.lab_flask_solid;

  /// Icons: Icons.chevron_left : CupertinoIcons.left_chevron
  IconData get leftChevron =>
      isMaterial(context) ? Icons.chevron_left : CupertinoIcons.left_chevron;

  /// Icons: Icons.location_on : CupertinoIcons.location
  IconData get location =>
      isMaterial(context) ? Icons.location_on : CupertinoIcons.location;

  /// Icons: Icons.location_on : CupertinoIcons.location_solid
  IconData get locationSolid =>
      isMaterial(context) ? Icons.location_on : CupertinoIcons.location_solid;

  /// Icons: Icons.loop : CupertinoIcons.loop
  IconData get loop => isMaterial(context) ? Icons.loop : CupertinoIcons.loop;

  // IconData get loopThick =>
  //     isMaterial(context) ? Icons.loop : CupertinoIcons.loop_thick;

  /// Icons: Icons.mail : CupertinoIcons.mail
  IconData get mail => isMaterial(context) ? Icons.mail : CupertinoIcons.mail;

  /// Icons: Icons.mail : CupertinoIcons.mail_solid
  IconData get mailSolid =>
      isMaterial(context) ? Icons.mail : CupertinoIcons.mail_solid;

  /// Icons: Icons.mail_outline : CupertinoIcons.mail
  IconData get mailOutline =>
      isMaterial(context) ? Icons.mail_outline : CupertinoIcons.mail;

  /// Icons: Icons.mic : CupertinoIcons.mic
  IconData get mic => isMaterial(context) ? Icons.mic : CupertinoIcons.mic;

  /// Icons: Icons.mic_off : CupertinoIcons.mic_off
  IconData get micOff =>
      isMaterial(context) ? Icons.mic_off : CupertinoIcons.mic_off;

  /// Icons: Icons.mic : CupertinoIcons.mic_solid
  IconData get micSolid =>
      isMaterial(context) ? Icons.mic : CupertinoIcons.mic_solid;

  /// Icons: Icons.mic_none : CupertinoIcons.mic
  IconData get micOutline =>
      isMaterial(context) ? Icons.mic_none : CupertinoIcons.mic;

  // IconData get minusCircled =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.minus_circled;

  /// Icons: Icons.music_note : CupertinoIcons.music_note
  IconData get musicNote =>
      isMaterial(context) ? Icons.music_note : CupertinoIcons.music_note;

  // IconData get news => isMaterial(context) ? Icons. : CupertinoIcons.news;

  // IconData get newsSolid =>
  //     isMaterial(context) ? Icons.flag : CupertinoIcons.news_solid;

  /// Icons: Icons.lock : CupertinoIcons.padlock
  IconData get padLock =>
      isMaterial(context) ? Icons.lock : CupertinoIcons.padlock;

  /// Icons: Icons.lock : CupertinoIcons.padlock_solid
  IconData get padlockSolid =>
      isMaterial(context) ? Icons.lock : CupertinoIcons.padlock_solid;

  /// Icons: Icons.lock_outline : CupertinoIcons.padlock
  IconData get padlockOutline =>
      isMaterial(context) ? Icons.lock_outline : CupertinoIcons.padlock;

  /// Icons: Icons.pause : CupertinoIcons.pause
  IconData get pause =>
      isMaterial(context) ? Icons.pause : CupertinoIcons.pause;

  // IconData get pauseSolid => isMaterial(context)
  //     ? Icons.pause_circle_filled
  //     : CupertinoIcons.pause_solid;

  // IconData get paw => isMaterial(context) ? Icons. : CupertinoIcons.paw;

  // Icons: Icons.pets : CupertinoIcons.paw_solid
  IconData get pawSolid =>
      isMaterial(context) ? Icons.pets : CupertinoIcons.paw_solid;

  // Icons: Icons.edit : CupertinoIcons.pen
  IconData get pen => isMaterial(context) ? Icons.edit : CupertinoIcons.pen;

  // IconData get pencil =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.pencil;

  /// Icons: Icons.person_add : CupertinoIcons.person_add
  IconData get personAdd =>
      isMaterial(context) ? Icons.person_add : CupertinoIcons.person_add;

  /// Icons: Icons.person_add : CupertinoIcons.person_add_solid
  IconData get personAddSolid =>
      isMaterial(context) ? Icons.person_add : CupertinoIcons.person_add_solid;

  /// Icons: Icons.person : CupertinoIcons.person
  IconData get person =>
      isMaterial(context) ? Icons.person : CupertinoIcons.person;

  /// Icons: Icons.person : CupertinoIcons.person_solid
  IconData get personSolid =>
      isMaterial(context) ? Icons.person : CupertinoIcons.person_solid;

  /// Icons: Icons.person_outline : CupertinoIcons.person
  IconData get personOutline =>
      isMaterial(context) ? Icons.person_outline : CupertinoIcons.person;

  /// Icons: Icons.phone : CupertinoIcons.phone
  IconData get phone =>
      isMaterial(context) ? Icons.phone : CupertinoIcons.phone;

  /// Icons: Icons.phone : CupertinoIcons.phone_solid
  IconData get phoneSolid =>
      isMaterial(context) ? Icons.phone : CupertinoIcons.phone_solid;

  /// Icons: Icons.photo_camera : CupertinoIcons.photo_camera
  IconData get photoCamera =>
      isMaterial(context) ? Icons.photo_camera : CupertinoIcons.photo_camera;

  /// Icons: Icons.photo_camera : CupertinoIcons.photo_camera_solid
  IconData get photoCameraSolid => isMaterial(context)
      ? Icons.photo_camera
      : CupertinoIcons.photo_camera_solid;

  /// Icons: Icons.play_arrow : CupertinoIcons.play_arrow
  IconData get playArrow =>
      isMaterial(context) ? Icons.play_arrow : CupertinoIcons.play_arrow;

  /// Icons: Icons.play_arrow : CupertinoIcons.play_arrow_solid
  IconData get playArrowSolid =>
      isMaterial(context) ? Icons.play_arrow : CupertinoIcons.play_arrow_solid;

  // IconData get plusCircled =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.plus_circled;

  // IconData get profileCircled =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.profile_circled;

  /// Icons: Icons.refresh : CupertinoIcons.refresh
  IconData get refresh =>
      isMaterial(context) ? Icons.refresh : CupertinoIcons.refresh;

  /// Icons: Icons.refresh : CupertinoIcons.refresh_bold
  IconData get refreshBold =>
      isMaterial(context) ? Icons.refresh : CupertinoIcons.refresh_bold;

  // IconData get refreshCircled =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.refresh_circled;

  // IconData get refreshCircledSolid =>
  //     isMaterial(context) ? Icons.flag : CupertinoIcons.refresh_circled_solid;

  // IconData get refreshThick =>
  //     isMaterial(context) ? Icons.flag : CupertinoIcons.refresh_thick;

  // IconData get refreshThin =>
  //     isMaterial(context) ? Icons.flag : CupertinoIcons.refresh_thin;

  /// Icons: Icons.reply : CupertinoIcons.reply
  IconData get reply =>
      isMaterial(context) ? Icons.reply : CupertinoIcons.reply;

  /// Icons: Icons.reply_all : CupertinoIcons.reply_all
  IconData get replyAll =>
      isMaterial(context) ? Icons.reply_all : CupertinoIcons.reply_all;

  // IconData get replyThickSolid =>
  //     isMaterial(context) ? Icons.reply : CupertinoIcons.reply_thick_solid;

  // IconData get restart =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.restart;

  /// Icons: Icons.chevron_right : CupertinoIcons.right_chevron
  IconData get rightChevron =>
      isMaterial(context) ? Icons.chevron_right : CupertinoIcons.right_chevron;

  /// Icons: Icons.search : CupertinoIcons.search
  IconData get search =>
      isMaterial(context) ? Icons.search : CupertinoIcons.search;

  /// Icons: Icons.settings : CupertinoIcons.settings
  IconData get settings =>
      isMaterial(context) ? Icons.settings : CupertinoIcons.settings;

  /// Icons: Icons.settings : CupertinoIcons.settings_solid
  IconData get settingsSolid =>
      isMaterial(context) ? Icons.settings : CupertinoIcons.settings_solid;

  /// Icons: Icons.share : CupertinoIcons.share
  IconData get share =>
      isMaterial(context) ? Icons.share : CupertinoIcons.share;

  /// Icons: Icons.share : CupertinoIcons.share_solid
  IconData get shareSolid =>
      isMaterial(context) ? Icons.share : CupertinoIcons.share_solid;

  // IconData get shareUp =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.share_up;

  /// Icons: Icons.shopping_cart : CupertinoIcons.shopping_cart
  IconData get shoppingCart =>
      isMaterial(context) ? Icons.shopping_cart : CupertinoIcons.shopping_cart;

  /// Icons: Icons.shuffle : CupertinoIcons.shuffle
  IconData get shuffle =>
      isMaterial(context) ? Icons.shuffle : CupertinoIcons.shuffle;

  // IconData get shuffleMedium =>
  //     isMaterial(context) ? Icons.share : CupertinoIcons.shuffle_medium;

  // IconData get shuffleThick =>
  //     isMaterial(context) ? Icons.share : CupertinoIcons.shuffle_thick;

  /// Icons: Icons.star : CupertinoIcons.(custom)
  IconData get star => isMaterial(context)
      ? Icons.star
      : const IconData(0xf2fc,
          fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons');

  /// Icons: Icons.switch_camera : CupertinoIcons.switch_camera
  IconData get switchCamera =>
      isMaterial(context) ? Icons.switch_camera : CupertinoIcons.switch_camera;

  /// Icons: Icons.switch_camera : CupertinoIcons.switch_camera_solid
  IconData get switchCameraSolid => isMaterial(context)
      ? Icons.switch_camera
      : CupertinoIcons.switch_camera_solid;

  /// Icons: Icons.label : CupertinoIcons.tag
  IconData get tag => isMaterial(context) ? Icons.label : CupertinoIcons.tag;

  /// Icons: Icons.label : CupertinoIcons.tag_solid
  IconData get tagSolid =>
      isMaterial(context) ? Icons.label : CupertinoIcons.tag_solid;

  /// Icons: Icons.label_outline : CupertinoIcons.tag
  IconData get tagOutline =>
      isMaterial(context) ? Icons.label_outline : CupertinoIcons.tag;

  /// Icons: Icons.share : CupertinoIcons.tags
  IconData get tags => isMaterial(context) ? Icons.share : CupertinoIcons.tags;

  // IconData get tagsSolid =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.tags_solid;

  /// Icons: Icons.schedule : CupertinoIcons.time
  IconData get time =>
      isMaterial(context) ? Icons.schedule : CupertinoIcons.time;

  /// Icons: Icons.watch_later : CupertinoIcons.time_solid
  IconData get timeSolid =>
      isMaterial(context) ? Icons.watch_later : CupertinoIcons.time_solid;

  /// Icons: Icons.tram : CupertinoIcons.train_style_one
  IconData get train =>
      isMaterial(context) ? Icons.tram : CupertinoIcons.train_style_one;

  // IconData get trainStyleTwo =>
  //     isMaterial(context) ? Icons. : CupertinoIcons.train_style_two;

  /// Icons: Icons.arrow_upward : CupertinoIcons.up_arrow
  IconData get upArrow =>
      isMaterial(context) ? Icons.arrow_upward : CupertinoIcons.up_arrow;

  /// Icons: Icons.videocam : CupertinoIcons.video_camer
  IconData get videoCamera =>
      isMaterial(context) ? Icons.videocam : CupertinoIcons.video_camera;

  /// Icons: Icons.videocam : CupertinoIcons.video_camera_solid
  IconData get videoCameraSolid =>
      isMaterial(context) ? Icons.videocam : CupertinoIcons.video_camera_solid;

  /// Icons: Icons.volume_down : CupertinoIcons.volume_down
  IconData get volumnDown =>
      isMaterial(context) ? Icons.volume_down : CupertinoIcons.volume_down;

  /// Icons: Icons.volume_mute : CupertinoIcons.volume_mute
  IconData get volumnMute =>
      isMaterial(context) ? Icons.volume_mute : CupertinoIcons.volume_mute;

  /// Icons: Icons.volume_off : CupertinoIcons.volume_off
  IconData get volumnOff =>
      isMaterial(context) ? Icons.volume_off : CupertinoIcons.volume_off;

  /// Icons: Icons.volume_up : CupertinoIcons.volume_up
  IconData get volumnnUp =>
      isMaterial(context) ? Icons.volume_up : CupertinoIcons.volume_up;

  /// Icons: Icons.volume_up : CupertinoIcons.volume_up
  IconData get work => isMaterial(context)
      ? Icons.work
      : const IconData(0xf3ee,
          fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons');
}
